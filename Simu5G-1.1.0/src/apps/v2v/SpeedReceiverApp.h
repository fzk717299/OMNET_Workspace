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

#ifndef _SPEEDRECEIVERAPP_H_
#define _SPEEDRECEIVERAPP_H_

#include <string.h>
#include <omnetpp.h>

#include <inet/networklayer/common/L3AddressResolver.h>
#include <inet/transportlayer/contract/udp/UdpSocket.h>
#include <inet/common/geometry/common/Coord.h>

// 当消息文件编译完成后会生成的头文件
#include "apps/v2v/SpeedInfoMessage_m.h"

/**
 * 速度信息接收应用
 * 用于后车接收前车发送的包含速度信息的数据包
 */
class SpeedReceiverApp : public omnetpp::cSimpleModule
{
private:
    // 通信相关
    inet::UdpSocket socket;
    int localPort_;
    
    // 车辆ID
    int rearCarId_;
    int frontCarId_;
    
    // 统计信号
    omnetpp::simsignal_t receivedPacketSignal;
    omnetpp::simsignal_t speedInfoSignal;
    omnetpp::simsignal_t positionXSignal;
    omnetpp::simsignal_t positionYSignal;
    omnetpp::simsignal_t positionZSignal;
    omnetpp::simsignal_t delayInfoSignal;
    
    // 统计数据
    int numReceived_;
    
protected:
    virtual int numInitStages() const override { return inet::NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;
    virtual void handleMessage(omnetpp::cMessage *msg) override;
    virtual void finish() override;
    
    // 处理接收到的速度信息
    void processSpeedInfo(const inet::SpeedInfoMessage* speedMsg, omnetpp::simtime_t arrivalTime);
    
public:
    SpeedReceiverApp();
    virtual ~SpeedReceiverApp();
};

#endif
