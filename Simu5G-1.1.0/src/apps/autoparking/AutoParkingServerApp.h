//
// 自动泊车服务器应用头文件
//

#ifndef __AUTOPARKINGSERVERAPP_H_
#define __AUTOPARKINGSERVERAPP_H_

#include <string>
#include <vector>
#include <map>
#include "inet/applications/udpapp/UdpBasicApp.h"
#include "inet/common/packet/Packet.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "AutoParkingPacket_m.h"

using namespace inet;

// 停车区域类型枚举
enum ParkingAreaType {
    ROADSIDE,   // 路边停车
    LOT,        // 停车场
    GARAGE      // 车库
};

// 停车区域信息结构体
struct ParkingAreaInfo {
    std::string id;          // 停车区域ID
    std::string type;        // 停车区域类型
    std::string laneId;      // 停车场所在的车道ID
    double x;                // X坐标
    double y;                // Y坐标
    int capacity;            // 容量
    int occupied;            // 已占用空间
    int priority;            // 优先级(高优先级的停车区域优先分配)
};

class AutoParkingServerApp : public UdpBasicApp
{
  protected:
    // 配置参数
    double processingDelay;
    std::string parkingAssignmentStrategy;
    std::string parkingAreasFile;
    
    // 停车区域信息
    std::vector<ParkingAreaInfo> parkingAreas;
    
    // 处理消息的队列
    typedef std::map<std::string, cMessage*> ProcessingQueue;
    ProcessingQueue processingQueue;
    
    // 统计信息
    int numRelayedCommands;
    
    // 信号声明
    static simsignal_t parkingCommandRelayedSignal;
    
  protected:
    // 加载停车区域信息
    virtual void loadParkingAreas();
    
    // 处理接收到的泊车请求
    virtual void processParkingRequest(Packet *packet);
    
    // 找到最近的可用停车区域
    virtual ParkingAreaInfo* findNearestParkingArea(double x, double y);
    
    // 找到最优的停车区域（考虑距离、容量等）
    virtual ParkingAreaInfo* findOptimalParkingArea(double x, double y);
    
    // 计算两点之间的距离
    virtual double calculateDistance(double x1, double y1, double x2, double y2);
    
    // 创建泊车指令数据包
    virtual Packet* createParkingCommandPacket(const std::string& vehicleId,
                                             const std::string& parkingAreaId,
                                             ParkingAreaType parkingType,
                                             double posX, double posY,
                                             double distanceToParking,
                                             const std::string& laneId = "");
    
    // 处理延迟发送的消息
    virtual void handleDelayedMessage(cMessage *msg);
    
  public:
    AutoParkingServerApp();
    virtual ~AutoParkingServerApp();
    
  protected:
    virtual int numInitStages() const override { return NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg) override;
    virtual void socketDataArrived(UdpSocket *socket, Packet *packet) override;
    virtual void finish() override;
    
    // 处理收到的请求
    virtual void processReceivedPacket(Packet *packet);
};

#endif 