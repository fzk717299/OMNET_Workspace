//
// 自动泊车服务器应用头文件
//

#ifndef __AUTOPARKINGSERVERAPP_H_
#define __AUTOPARKINGSERVERAPP_H_

#include <omnetpp.h>
#include <string>
#include <vector>
#include <map>
#include "inet/applications/udpapp/UdpBasicApp.h"
#include "inet/transportlayer/contract/udp/UdpSocket.h"
#include "AutoParkingPacket_m.h"
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
    int priority;
};

/**
 * 自动泊车服务器应用
 */
class AutoParkingServerApp : public UdpBasicApp
{
protected:
    // 参数
    std::string parkingAssignmentStrategy;
    std::string parkingAreasFile;
    
    // 停车场信息
    std::vector<ParkingAreaInfo*> parkingAreas;
    std::map<std::string, int> parkingAreaOccupancy;
    
    // 延迟消息
    struct DelayedMessage {
        Packet* packet;
        L3Address destAddr;
        int destPort;
        simtime_t sendTime;
    };
    
    std::vector<DelayedMessage*> delayedMessages;
    cMessage* processDelayedMsg;
    
    // 统计
    int numRelayedCommands;
    static simsignal_t parkingCommandRelayedSignal;
    
protected:
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg) override;
    virtual void finish() override;
    
    // 加载停车场信息
    virtual void loadParkingAreas();
    
    // 处理收到的数据包
    virtual void socketDataArrived(UdpSocket *socket, Packet *packet) override;
    virtual void processReceivedPacket(Packet *packet);
    
    // 处理延迟消息
    virtual void handleDelayedMessage(cMessage *msg);
    
    // 处理泊车请求
    virtual void processParkingRequest(Packet *packet);
    
    // 查找最近的停车场
    virtual ParkingAreaInfo* findNearestParkingArea(double x, double y);
    
    // 查找最优的停车场
    virtual ParkingAreaInfo* findOptimalParkingArea(double x, double y);
    
    // 计算距离
    virtual double calculateDistance(double x1, double y1, double x2, double y2);
    
    // 创建泊车命令数据包
    virtual Packet* createParkingCommandPacket(const std::string& vehicleId,
                                             const std::string& parkingAreaId,
                                             double distanceToParking,
                                             const std::string& currentLaneId,
                                             const std::string& destinationLaneId);
                                             
    // 将SUMO ID映射到OMNeT++模块名
    std::string mapSumoIdToOmnetName(const char* sumoId);
    
public:
    AutoParkingServerApp();
    virtual ~AutoParkingServerApp();
};

#endif