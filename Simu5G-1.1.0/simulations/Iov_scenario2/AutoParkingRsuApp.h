//
// 自动泊车RSU应用头文件
//

#ifndef __AUTOPARKINGRSUSAPP_H_
#define __AUTOPARKINGRSUSAPP_H_

#include <string>
#include <vector>
#include "inet/applications/udpapp/UdpBasicApp.h"
#include "inet/common/packet/Packet.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "AutoParkingPacket_m.h"

// 前向声明
namespace veins {
    class TraCICommandInterface;
}

using namespace inet;

class AutoParkingRsuApp : public UdpBasicApp
{
  protected:
    // 配置参数
    std::string traciModulePath;
    double checkInterval;
    double detectionRadius;
    int maxVehiclesToCheck;
    
    // 直接泊车命令参数
    bool enableDirectParking;     // 是否启用直接泊车命令
    double directParkingTime;     // 何时发送直接泊车命令
    std::string targetVehicleId;  // 目标车辆ID
    
    // TraCI接口
    veins::TraCICommandInterface* traci;
    cModule* traciModule;
    bool traciInitialized;
    
    // 定时器和状态变量
    cMessage *checkTimer;
    cMessage *directParkingTimer;  // 直接泊车命令定时器
    int numSentParkingCommands;
    
    // 信号声明
    static simsignal_t parkingCommandSentSignal;
    
  protected:
    // 获取TraCI连接
    virtual bool getTraCIConnection();
    
    // 检测需要泊车的车辆
    virtual void checkVehiclesForParking();
    
    // 创建泊车请求数据包
    virtual Packet* createParkingRequestPacket(const std::string& vehicleId, 
                                             double posX, double posY);
    
    // 判断车辆是否需要泊车（根据速度、状态等）
    virtual bool vehicleNeedsParking(const std::string& vehicleId, 
                                   double speed, double stopTime);
                                   
    // 直接发送泊车命令
    virtual void sendDirectParkingCommand();
    
  public:
    AutoParkingRsuApp();
    virtual ~AutoParkingRsuApp();
    
  protected:
    virtual int numInitStages() const override { return NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg) override;
    virtual void finish() override;
    
    // 处理检测定时器
    virtual void handleCheckTimer();
};

#endif 