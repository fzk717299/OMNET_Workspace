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

#ifndef _LTE_IOVNRCHANNELMODEL_H_
#define _LTE_IOVNRCHANNELMODEL_H_

#include "stack/phy/ChannelModel/NRChannelModel.h"
#include <map>
#include <vector>
#include "common/binder/Binder.h"

/**
 * @class IovNRChannelModel
 * @brief 专为IoV场景5定制的5G-NR通道模型
 *
 * 继承NRChannelModel并增加针对IoV场景的额外指标统计：
 * 1. RSRP变化率
 * 2. 交通密度
 * 3. 并发连接数
 */
class IovNRChannelModel : public NRChannelModel
{
  protected:
    // 添加5G特有的信号
    static omnetpp::simsignal_t rsrpChangeRate_;     // RSRP变化率信号
    static omnetpp::simsignal_t trafficDensity_;     // 交通密度信号
    static omnetpp::simsignal_t concurrentConnections_;  // 并发连接数信号
    
    // 记录每个节点的上次RSRP值和时间
    std::map<MacNodeId, std::pair<inet::simtime_t, double>> lastRsrpRecord_;
    
    // 定期更新统计数据的消息
    omnetpp::cMessage *statisticsUpdateMsg_;
    
    // 统计更新间隔
    double statsUpdateInterval_;
    
    // 处理自定义消息
    virtual void handleMessage(omnetpp::cMessage *msg) override;
    
    // 更新交通统计
    void updateTrafficStats();
    
  public:
    // 构造函数和析构函数
    IovNRChannelModel();
    virtual ~IovNRChannelModel();
    
    // 初始化方法
    virtual void initialize(int stage) override;
    
    // 信号处理方法
    virtual std::vector<double> getSINR(LteAirFrame *frame, UserControlInfo* lteInfo) override;
    
    // 重载finish方法，清理资源
    virtual void finish() override;
};

#endif
