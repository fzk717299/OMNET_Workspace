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

#ifndef _SPEEDSENDERAPP_H_
#define _SPEEDSENDERAPP_H_

#include <string.h>
#include <omnetpp.h>

#include <inet/networklayer/common/L3AddressResolver.h>
#include <inet/transportlayer/contract/udp/UdpSocket.h>
#include <veins_inet/VeinsInetMobility.h>
#include <inet/common/geometry/common/Coord.h>

// 当消息文件编译完成后会生成的头文件
#include "apps/v2v/SpeedInfoMessage_m.h"

/**
 * 速度信息发送应用
 * 用于前车持续向后车发送包含速度信息的数据包
 */
class SpeedSenderApp : public omnetpp::cSimpleModule
{
private:
    // 通信相关
    inet::UdpSocket socket;
    int localPort_;
    int destPort_;
    inet::L3Address destAddress_;
    int packetSize_;
    
    // 车辆ID
    int frontCarId_;
    int rearCarId_;
    
    // 定时器
    omnetpp::cMessage *sendSpeedTimer_;
    omnetpp::simtime_t sendInterval_;
    omnetpp::simtime_t startTime_;    // 开始发送的时间
    
    // 移动性模型引用，用于获取位置和速度信息
    veins::VeinsInetMobility *mobility_;
    
    // 信号
    omnetpp::simsignal_t sentPacketSignal;

protected:
    virtual int numInitStages() const override { return inet::NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;
    virtual void handleMessage(omnetpp::cMessage *msg) override;
    virtual void finish() override;
    
    // 发送速度信息
    void sendSpeedInfo();
    
public:
    SpeedSenderApp();
    virtual ~SpeedSenderApp();
};

#endif
