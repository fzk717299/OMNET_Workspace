//
// 车辆跟驰RSU应用头文�?
//

#ifndef __SIMU5G_FOLLOWRSUAPP_H_
#define __SIMU5G_FOLLOWRSUAPP_H_

#include "inet/applications/udpapp/UdpBasicApp.h"
#include "inet/common/lifecycle/ModuleOperations.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "apps/follow/FollowPacket_m.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"

using namespace omnetpp;
using namespace inet;
using namespace veins;

/**
 * @brief RSU application for the Follow-Car scenario.
 *
 * This module is responsible for monitoring the leader and follower cars
 * via TraCI, calculating the distance between them, and sending a
 * FollowPacket with the leader's speed and the distance to the server
 * for forwarding.
 */
class FollowRsuApp : public UdpBasicApp
{
  protected:
    // Parameters
    std::string leaderCarId_;
    std::string followerCarId_;
    std::string serverDestAddrName_;  // 服务器地址名称（动态解析）
    int serverDestPort_;
    simtime_t checkInterval_;

    // Self message for periodic checks
    cMessage *checkTimer_{nullptr};

    // TraCI interface
    veins::TraCICommandInterface* traci_{nullptr};
    veins::TraCIScenarioManager* manager_{nullptr};
    
    // Statistics signals
    simsignal_t sentPkSignal;

  protected:
    virtual int numInitStages() const override { return inet::NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg) override;
    virtual void finish() override;

    // This app only sends, it does not receive UDP packets
    virtual void processPacket(Packet *pk) override;

    // Helper methods
    virtual bool getTraCIInterface();
    virtual void checkCarsAndSendInfo();
    
    // Lifecycle operations
    virtual void handleStartOperation(LifecycleOperation *operation) override;
    virtual void handleStopOperation(LifecycleOperation *operation) override;

  public:
    FollowRsuApp();
    virtual ~FollowRsuApp();
};

#endif 