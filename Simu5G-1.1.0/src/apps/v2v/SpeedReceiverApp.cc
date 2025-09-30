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

#include "SpeedReceiverApp.h"

#include <cmath>
#include <inet/common/TimeTag_m.h>
#include <inet/common/packet/Packet.h>

Define_Module(SpeedReceiverApp);
using namespace inet;

SpeedReceiverApp::SpeedReceiverApp()
{
    numReceived_ = 0;
}

SpeedReceiverApp::~SpeedReceiverApp()
{
}

void SpeedReceiverApp::initialize(int stage)
{
    cSimpleModule::initialize(stage);

    // 避免重复初始化
    if (stage == inet::INITSTAGE_APPLICATION_LAYER)
    {
        EV << "SpeedReceiverApp初始化..." << endl;
        
        // 读取参数
        localPort_ = par("localPort");
        
        // 获取车辆ID
        rearCarId_ = par("rearCarId");
        if (rearCarId_ == -1) {
            // 默认使用模块索引作为ID
            rearCarId_ = getParentModule()->getIndex();
        }
        
        frontCarId_ = par("frontCarId");
        
        // 初始化UDP套接字
        socket.setOutputGate(gate("socketOut"));
        socket.bind(localPort_);
        
        // 注册统计信号
        receivedPacketSignal = registerSignal("receivedPackets");
        speedInfoSignal = registerSignal("speedInfo");
        positionXSignal = registerSignal("positionX");
        positionYSignal = registerSignal("positionY");
        positionZSignal = registerSignal("positionZ");
        delayInfoSignal = registerSignal("delayInfo");
        
        // 重置统计数据
        numReceived_ = 0;
        
        EV << "SpeedReceiverApp初始化完成，后车ID: " << rearCarId_ 
           << "，监听前车ID: " << (frontCarId_ == -1 ? "任何车辆" : std::to_string(frontCarId_)) 
           << "，监听端口: " << localPort_ << endl;
    }
}

void SpeedReceiverApp::handleMessage(cMessage *msg)
{
    if (!msg->isSelfMessage())
    {
        // 处理接收到的UDP数据包
        Packet* packet = check_and_cast<Packet*>(msg);
        
        // 记录到达时间
        simtime_t arrivalTime = simTime();
        
        // 尝试提取SpeedInfoMessage
        auto speedMsg = packet->peekAtFront<SpeedInfoMessage>();
        if (speedMsg)
        {
            numReceived_++;
            
            // 确认是否来自预期的前车（如果设置了特定的前车ID）
            if (frontCarId_ != -1 && speedMsg->getSenderId() != frontCarId_)
            {
                EV << "接收到来自非预期车辆的速度信息，发送方ID: " << speedMsg->getSenderId() 
                   << "，但期望ID为: " << frontCarId_ << endl;
            }
            else
            {
                // 处理速度信息
                processSpeedInfo(speedMsg.get(), arrivalTime);
            }
            
            // 发出接收信号
            emit(receivedPacketSignal, packet);
        }
        
        // 释放消息
        delete msg;
    }
}

void SpeedReceiverApp::processSpeedInfo(const inet::SpeedInfoMessage* speedMsg, simtime_t arrivalTime)
{
    // 计算延迟
    simtime_t delay = arrivalTime - speedMsg->getSendTime();
    
    // 提取速度、位置信息
    double speed = speedMsg->getSpeed();
    double posX = speedMsg->getPosX();
    double posY = speedMsg->getPosY();
    double posZ = speedMsg->getPosZ();
    double direction = speedMsg->getDirection();
    
    // 创建位置坐标对象用于信号发出
    inet::Coord position(posX, posY, posZ);
    
    // 输出调试信息
    EV << "接收到来自车辆[" << speedMsg->getSenderId() << "]的速度信息: " 
       << "位置(" << posX << "," << posY << ")，速度: " << speed << " m/s，方向: " 
       << direction << "度，延迟: " << delay*1000 << " ms" << endl;
    
    // 发出统计信号
    emit(speedInfoSignal, speed);
    // 分别发送位置坐标的XYZ分量
    emit(positionXSignal, posX);
    emit(positionYSignal, posY);
    emit(positionZSignal, posZ);
    emit(delayInfoSignal, delay);
}

void SpeedReceiverApp::finish()
{
    // 输出统计信息
    EV << "SpeedReceiverApp统计 - 接收到的数据包数: " << numReceived_ << endl;
    
    // 记录标量统计数据
    recordScalar("接收数据包总数", numReceived_);
}
