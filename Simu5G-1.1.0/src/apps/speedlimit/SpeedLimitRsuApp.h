//
// 速度限制RSU应用头文件
//

#ifndef _SPEEDLIMITRSUAPP_H_
#define _SPEEDLIMITRSUAPP_H_

#include "inet/applications/udpapp/UdpBasicApp.h"
#include "apps/speedlimit/SpeedLimitPacket_m.h"

using namespace inet;

// 前向声明
namespace veins {
    class TraCICommandInterface;
}

/**
 * 速度限制RSU应用模块
 * 继承自UdpBasicApp，用于处理速度检测器数据
 */
class SpeedLimitRsuApp : public UdpBasicApp
{
  protected:
    // 统计信号
    static simsignal_t speedLimitDetectedSignal;
    
    // 配置参数
    std::string speedLimitDetectorId;  // 速度检测器ID
    double maxSpeed;  // 最大速度(km/h)
    double checkInterval;  // 检查间隔(s)
    
    // TraCI接口指针，不负责创建和销毁
    veins::TraCICommandInterface* traci;
    
    // 检查计时器消息
    cMessage *checkTimer;
    
    // 已处理的车辆列表
    std::set<std::string> processedVehicles;
    
  protected:
    // 从UdpBasicApp继承的方法
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg) override;
    virtual void finish() override;
    
    // 检查速度检测器
    virtual void checkSpeedDetector();
    
    // 获取TraCI接口
    virtual bool getTraCIInterface();
    
    // 创建速度限制包
    virtual Packet* createSpeedLimitPacket(const std::string& vehicleId, double speed);
    
  public:
    SpeedLimitRsuApp();
    virtual ~SpeedLimitRsuApp();
};

#endif