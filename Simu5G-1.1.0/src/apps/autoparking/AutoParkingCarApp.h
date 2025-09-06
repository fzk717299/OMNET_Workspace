//
// 自动泊车车辆应用头文件
//

#ifndef __AUTOPARKINGCARAPP_H_
#define __AUTOPARKINGCARAPP_H_

#include <omnetpp.h>
#include <string>
#include "inet/applications/udpapp/UdpSink.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "apps/autoparking/AutoParkingPacket_m.h"

using namespace omnetpp;
using namespace inet;

/**
 * 自动泊车车辆应用
 */
class AutoParkingCarApp : public UdpSink {
protected:
// 泊车状态枚举
enum ParkingState {
        NOT_PARKING,      // 未泊车
        DRIVING_TO_PARKING,  // 正在驶向停车场
        PARKING,          // 正在泊车中
        PARKED           // 已停车
};

    // 参数
    bool smoothParking;      // 是否平滑泊车
    double responseTime;     // 响应时间
    double maxWaitingTime;   // 最大等待时间
    
    // 状态
    ParkingState parkingState;
    std::string targetParkingAreaId;
    std::string targetLaneId;
    
    // 定时器
    cMessage* parkingTimer;
    
    // TraCI接口
    veins::TraCICommandInterface* traci;
    
    // 统计
    int numReceivedCommands;
    int numExecutedCommands;
    
    // 信号
    simsignal_t parkingCommandReceivedSignal;
    simsignal_t parkingCompletedSignal;
    simsignal_t endToEndDelaySignal;
    
  protected:
    virtual void initialize(int stage) override;
    virtual void handleMessage(cMessage *msg) override;
    virtual void finish() override;
    
    virtual void processPacket(Packet *packet) override;
    virtual void processParkingCommand(const AutoParkingPacket* cmd, simtime_t arrivalTime);
    
    virtual bool getTraCIInterface();
    virtual void executeParkingOperation();
    virtual void driveToParking();
    virtual void finishParking();
    
    const char* getParkingStateName() const;
    
  public:
    AutoParkingCarApp();
    virtual ~AutoParkingCarApp();
};

#endif 