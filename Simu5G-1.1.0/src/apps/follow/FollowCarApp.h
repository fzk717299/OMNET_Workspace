//
// 车辆跟驰应用头文件
//

#ifndef __SIMU5G_FOLLOWCARAPP_H_
#define __SIMU5G_FOLLOWCARAPP_H_

#include "inet/applications/udpapp/UdpSink.h"
#include "apps/follow/FollowPacket_m.h"
#include "veins/base/utils/Coord.h"
#include "veins_inet/VeinsInetMobility.h"

using namespace omnetpp;
using namespace inet;

// Forward declaration
namespace veins {
    class TraCICommandInterface;
}

/**
 * 车辆跟驰应用模块
 * 继承自UdpSink，用于接收服务器发来的前方车辆信息并调整自身速度
 */
class FollowCarApp : public UdpSink
{
protected:
    // TraCI
    veins::TraCICommandInterface* traci_{nullptr};
    veins::VeinsInetMobility* mobility_{nullptr};
    
    // Parameters
    double safetyDistance_; // 安全距离 (m)
    double maxSpeed_;       // 车辆最大速度 (m/s)

    // State
    std::string sumoId_;

protected:
    // Overridden from UdpSink
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg) override;
    virtual void finish() override;
    
    // Main logic for processing packets from the server
    virtual void processPacket(Packet *packet) override;
    
    // Helper methods
    virtual bool getTraCIInterface();
    virtual std::string getSumoId();
    virtual void adjustSpeed(double leaderSpeed, double distance);

public:
    FollowCarApp();
    virtual ~FollowCarApp() override;
};

#endif