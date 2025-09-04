// AutoParkingCarApp.h

#ifndef __AUTOPARKINGCARAPP_H_
#define __AUTOPARKINGCARAPP_H_

#include "inet/applications/udpapp/UdpSink.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "AutoParkingPacket_m.h"

// 必须的前向声明
namespace veins {
    class TraCICommandInterface;
}

class AutoParkingCarApp : public inet::UdpSink {
protected:
    enum ParkingState {
        NOT_PARKING,
        DRIVING_TO_PARKING,
        PARKING,
        PARKED
    };

    // 参数
    double maxWaitingTime;
    double checkInterval; // 新增：检查车辆位置的时间间隔

    // 状态
    ParkingState parkingState;
    std::string targetParkingAreaId;
    std::string targetLaneId;
    double parkingStartPos; // 新增
    double parkingEndPos;   // 新增

    // 定时器
    omnetpp::cMessage* parkingTimer;

    // TraCI接口
    veins::TraCICommandInterface* traci;

    // 统计
    int numReceivedCommands;
    int numExecutedCommands;
    omnetpp::simsignal_t parkingCommandReceivedSignal;
    omnetpp::simsignal_t parkingCompletedSignal;
    omnetpp::simsignal_t endToEndDelaySignal;

protected:
    void initialize(int stage) override;
    void handleMessage(omnetpp::cMessage *msg) override;
    void finish() override;

    void processPacket(inet::Packet *packet) override;
    void processParkingCommand(const AutoParkingPacket* cmd);

    bool getTraCIInterface();
    void executeParkingOperation();
    void driveToParking();

    const char* getParkingStateName() const;

public:
    AutoParkingCarApp();
    virtual ~AutoParkingCarApp();
};

#endif