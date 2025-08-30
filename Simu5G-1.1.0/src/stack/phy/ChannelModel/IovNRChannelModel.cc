//
//                  Simu5G
//
// Authors: Giovanni Nardini, Giovanni Stea, Antonio Virdis (University of Pisa)
//
// This file is part of a software released under the license included in file
// "license.pdf". Please read LICENSE and README files before using it.
// The above files and the present reference are part of the software itself,
// and cannot be removed from it.
// 

#include "stack/phy/ChannelModel/IovNRChannelModel.h"

#include <cmath>
#include <algorithm>
#include "common/binder/Binder.h"
#include "inet/common/ModuleAccess.h"

using namespace inet;
using namespace omnetpp;

Define_Module(IovNRChannelModel);

// 定义专用信号
simsignal_t IovNRChannelModel::rsrpChangeRate_ = registerSignal("rsrpChangeRate");
simsignal_t IovNRChannelModel::trafficDensity_ = registerSignal("trafficDensity");
simsignal_t IovNRChannelModel::concurrentConnections_ = registerSignal("concurrentConnections");

IovNRChannelModel::IovNRChannelModel() : 
    statisticsUpdateMsg_(nullptr),
    statsUpdateInterval_(1.0)  // 默认每1秒更新一次统计
{
}

IovNRChannelModel::~IovNRChannelModel()
{
    cancelAndDelete(statisticsUpdateMsg_);
}

void IovNRChannelModel::initialize(int stage)
{
    NRChannelModel::initialize(stage);
    
    if (stage == inet::INITSTAGE_LOCAL) {
        // 读取参数
        statsUpdateInterval_ = par("statsUpdateInterval").doubleValue();
        
        // 创建定期更新统计的消息
        statisticsUpdateMsg_ = new cMessage("updateIovStatistics");
        
        // 启动统计更新
        scheduleAt(simTime() + statsUpdateInterval_, statisticsUpdateMsg_);
        
        EV << "IovNRChannelModel initialized with statsUpdateInterval = " << statsUpdateInterval_ << "s" << endl;
    }
}

void IovNRChannelModel::handleMessage(cMessage *msg)
{
    if (msg == statisticsUpdateMsg_) {
        // 更新交通统计
        updateTrafficStats();
        
        // 重新调度
        scheduleAt(simTime() + statsUpdateInterval_, statisticsUpdateMsg_);
    } else {
        // 调用父类方法处理其他消息
        NRChannelModel::handleMessage(msg);
    }
}

void IovNRChannelModel::updateTrafficStats()
{
    // 获取系统的Binder模块
    Binder* binder = getBinder();
    if (!binder) {
        EV << "IovNRChannelModel::updateTrafficStats() - Binder module not found" << endl;
        return;
    }
    
    // 获取车辆数量和连接数
    int totalUEs = 0;
    int connectedUEs = 0;
    
    // 遍历所有UE节点
    std::vector<UeInfo*> * ueList = binder->getUeList();
    if (ueList && !ueList->empty()) {
        totalUEs = ueList->size();
        
        // 计算已连接的UE数量
        for (auto ueInfo : *ueList) {
            if (ueInfo) {
                MacNodeId ueId = ueInfo->id;
                MacNodeId nextHop = binder->getNextHop(ueId);
                
                // 检查UE是否关联到一个基站 (nextHop > 0)
                if (nextHop > 0) {
                    connectedUEs++;
                }
            }
        }
    }
    
    // 发送统计信号
    emit(trafficDensity_, totalUEs);
    emit(concurrentConnections_, connectedUEs);
    
    EV << "IovNRChannelModel::updateTrafficStats() - Traffic Density: " << totalUEs 
       << ", Connected UEs: " << connectedUEs << endl;
}

std::vector<double> IovNRChannelModel::getSINR(LteAirFrame *frame, UserControlInfo* lteInfo)
{
    // 获取原始SINR
    std::vector<double> sinrVector = NRChannelModel::getSINR(frame, lteInfo);
    
    // 获取接收节点ID
    MacNodeId nodeId = lteInfo->getDestId();
    
    // 计算平均RSRP (Reference Signal Received Power)
    // 在5G NR中，我们使用RSRP而不是RSSI作为主要信号强度指标
    double totalRsrp = 0.0;
    for (auto sinr : sinrVector) {
        totalRsrp += sinr;  // 简化：使用SINR作为RSRP的近似
    }
    double avgRsrp = totalRsrp / sinrVector.size();
    
    // 计算RSRP变化率
    if (lastRsrpRecord_.find(nodeId) != lastRsrpRecord_.end()) {
        // 已有历史记录，计算变化率
        double lastRsrp = lastRsrpRecord_[nodeId].second;
        simtime_t lastTime = lastRsrpRecord_[nodeId].first;
        simtime_t timeDiff = simTime() - lastTime;
        
        if (timeDiff > SIMTIME_ZERO) {
            double changeRate = std::fabs(avgRsrp - lastRsrp) / timeDiff.dbl(); // dB/s
            emit(rsrpChangeRate_, changeRate);
            
            EV << "RSRP变化率: " << changeRate << " dB/s (节点ID: " << nodeId << ")" << endl;
        }
    }
    
    // 更新最新RSRP记录
    lastRsrpRecord_[nodeId] = std::make_pair(simTime(), avgRsrp);
    
    return sinrVector;
}

void IovNRChannelModel::finish()
{
    // 清理资源
    NRChannelModel::finish();
    
    // 停止定期更新
    if (statisticsUpdateMsg_) {
        cancelAndDelete(statisticsUpdateMsg_);
        statisticsUpdateMsg_ = nullptr;
    }
}