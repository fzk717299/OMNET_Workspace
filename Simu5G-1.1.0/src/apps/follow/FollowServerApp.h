//
// 车辆跟驰服务器应用头文件
//

#ifndef __SIMU5G_FOLLOWSERVERAPP_H_
#define __SIMU5G_FOLLOWSERVERAPP_H_

#include "inet/applications/udpapp/UdpBasicApp.h"
#include "inet/common/lifecycle/ModuleOperations.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "apps/follow/FollowPacket_m.h"

using namespace omnetpp;
using namespace inet;

/**
 * 车辆跟驰服务器应�? (轏��?)
 * 接收来自RSU的数捌�，并将其轏�给后�?
 */
class FollowServerApp : public UdpBasicApp
{
protected:
    // ʹ��followerCarId����������car[1]
    std::string followerCarId_;
    
    // Statistics signals
    simsignal_t rcvdPkSignal;
    simsignal_t sentPkSignal;

protected:
    virtual int numInitStages() const override { return inet::NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;
    
    // Main forwarding logic
    virtual void processPacket(Packet *pk) override;
    
    // This app does not use self-messages
    virtual void handleMessageWhenUp(cMessage *msg) override { UdpBasicApp::handleMessageWhenUp(msg); }

public:
    FollowServerApp();
    virtual ~FollowServerApp();
};

#endif