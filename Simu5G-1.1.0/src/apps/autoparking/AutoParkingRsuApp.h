//
// 自动泊车RSU应用头文件
//

#ifndef __AUTOPARKINGRSUCAPP_H_
#define __AUTOPARKINGRSUCAPP_H_

#include <omnetpp.h>
#include <string>
#include <vector>
#include <set>
#include "inet/applications/udpapp/UdpBasicApp.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"

using namespace omnetpp;
using namespace inet;

// 停车区域信息结构体
struct ParkingAreaInfo {
    std::string id;
    std::string lane; // The lane the parking area is attached to
    std::string type;
    double x;
    double y;
    int capacity;
    int occupancy;
};

/**
 * RSU自动泊车应用
 */
class AutoParkingRsuApp : public UdpBasicApp
{
  protected:
    // 参数
    double checkInterval;
    double parkingProbability;
    std::string parkingAreasFile;
    
    // TraCI相关
    veins::TraCICommandInterface* traci;
    veins::TraCIScenarioManager* manager;
    
    // 定时器
    cMessage* checkTimer;
    
    // 停车场信息
    std::vector<ParkingAreaInfo*> parkingAreas;
    
    // 已经发送命令的车辆集合
    std::set<std::string> commandedVehicles;
    
    // 统计
    int numSentParkingCommands;
    static simsignal_t parkingCommandSentSignal;
    
  protected:
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg) override;
    virtual void finish() override;
    
    // 连接到TraCI
    virtual void connectToTraCI();
    
    // 加载停车场信息
    virtual void loadParkingAreas();
    
    // 处理检查定时器
    virtual void handleCheckTimer();
    
    // 检查车辆是否需要泊车
    virtual void checkVehiclesForParking();
    
    // 创建泊车命令数据包
    virtual Packet* createParkingCommandPacket(const std::string& vehicleId, const std::string& parkingAreaId, double distanceToParking, const std::string& currentLaneId, const std::string& destinationLaneId);
                                   
    // 查找最近的停车场
    virtual ParkingAreaInfo* findNearestParkingArea(double x, double y);
    
  public:
    AutoParkingRsuApp();
    virtual ~AutoParkingRsuApp();
};

#endif 