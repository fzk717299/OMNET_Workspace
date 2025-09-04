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
#include "inet/common/packet/Packet.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"

// Forward declaration for VeinsInetManager
namespace org {
    namespace car2x {
        namespace veins {
            namespace subprojects {
                namespace veins_inet {
                    class VeinsInetManager;
                }
            }
        }
    }
}


using namespace omnetpp;
using namespace inet;

// 停车区域信息结构体
struct ParkingAreaInfo {
    std::string id;           // 停车场ID
    std::string lane;         // 停车场附着的车道
    std::string type;         // 停车场类型
    double x;                 // X坐标
    double y;                 // Y坐标
    double startPos;          // 在车道上的起始位置
    double endPos;            // 在车道上的结束位置
    int capacity;             // 容量
    int occupancy;            // 当前占用数
};

/**
 * RSU自动泊车应用
 */
class AutoParkingRsuApp : public UdpBasicApp
{
  protected:
    // Flag to ensure only one parking command is sent
    bool isParkingSlotAssigned;

    // 参数
    double checkInterval;
    double parkingProbability;
    std::string parkingAreasFile;
    std::string monitoredLanes; // **FIX: Add missing member variable declaration**
    
    // TraCI相关
    veins::TraCICommandInterface* traci;
    veins::TraCIScenarioManager* manager;
    
    // Pointer to the Veins manager to resolve SUMO IDs to module pointers
    org::car2x::veins::subprojects::veins_inet::VeinsInetManager* veinsManager;

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
    virtual Packet* createParkingCommandPacket(const std::string& vehicleId, const std::string& parkingAreaId, 
                                   double distanceToParking, const std::string& currentLaneId, 
                                   const std::string& destinationLaneId);

    // 查找最近的可用停车场
    virtual ParkingAreaInfo* findNearestParkingArea(double x, double y);
    
    // 找到并发送停车指令
    virtual void findAndSendParkingCommand(const std::string& vehId);
    
    // 计算距离
    virtual double calculateDistance(double x1, double y1, double x2, double y2);
    
    // 获取TraCI接口
    virtual bool getTraCIInterface();
    
    // 发送泊车指令到指定模块
    virtual void sendParkingCommandToModule(cModule* carModule, const std::string& sumoId, const std::string& parkingAreaId);
    
  public:
    AutoParkingRsuApp();
    virtual ~AutoParkingRsuApp();
};

#endif