//
// 事故RSU应用头文件
//

#ifndef __SIMU5G_ACCIDENTRSUAPP_H_
#define __SIMU5G_ACCIDENTRSUAPP_H_

#include "inet/applications/udpapp/UdpBasicApp.h"
#include "inet/common/lifecycle/ModuleOperations.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "apps/accident/AccidentPacket_m.h"

using namespace omnetpp;
using namespace inet;
using namespace veins;

// RSU应用，仅负责检测事故并发送变道指令
class AccidentRsuApp : public UdpBasicApp {
public:
    AccidentRsuApp();
    virtual ~AccidentRsuApp();

protected:
    // TraCI
    TraCICommandInterface* traci_{nullptr};
    TraCIScenarioManager* manager_{nullptr};

    // Parameters
    std::vector<std::string> monitoredLanes_;
    simtime_t checkInterval_;
    double stoppedSpeedThreshold_; // 车辆被认为停止的速度阈值(m/s)
    double minStopTime_;           // 车辆停止的最小时间(s)
    
    // 停车车辆跟踪
    struct StoppedVehicleInfo {
        simtime_t firstDetectedTime;
        std::string laneId;
        double posX;
        double posY;
        bool alarmSent;
    };
    std::map<std::string, StoppedVehicleInfo> stoppedVehicles_;

    // Self messages
    cMessage *checkTimer_{nullptr};

    // Signals - 只保留与事故检测和变道指令相关的
    static simsignal_t accidentDetectedSignal;
    static simsignal_t laneChangeCommandSentSignal;

protected:
    virtual int numInitStages() const override { return inet::NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg) override;
    virtual void finish() override;

    bool getTraCIInterface();
    void checkVehicles();
    virtual void processStoppedVehicle(const std::string& vehicleId, const std::string& laneId, double posX, double posY);
    virtual std::string getTargetLane(const std::string& originalLane);
    // 保持函数签名一致，统一使用 veins::Coord
    virtual inet::Packet* createLaneChangePacket(const veins::Coord& accidentPos, const std::string& originalLane, const std::string& targetLane);
    
    // 用于防止对同一起事故重复发送指令
    std::set<std::string> reportedAccidents_;
};

#endif 