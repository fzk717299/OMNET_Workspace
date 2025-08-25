//
// 速度限制车辆应用头文件
//

#ifndef _SPEEDLIMITCARAPP_H_
#define _SPEEDLIMITCARAPP_H_

#include "inet/applications/udpapp/UdpSink.h"
#include "apps/speedlimit/SpeedLimitPacket_m.h"

using namespace inet;

// 前向声明
namespace veins {
    class TraCICommandInterface;
}

/**
 * 速度限制车辆应用模块
 * 继承自UdpSink，用于接收和执行速度控制命令
 */
class SpeedLimitCarApp : public UdpSink
{
  protected:
    // TraCI接口指针，不负责创建和销毁
    veins::TraCICommandInterface* traci;
    
    // 是否启用平滑减速
    bool smoothDeceleration;
    
    // 减速响应时间(秒)
    double responseTime;
    
    // 处理的命令计数
    int processedCmds;
    
  protected:
    // 从UdpSink继承的方法
    virtual void initialize(int stage) override;
    virtual void finish() override;
    
    // 处理收到的数据包
    virtual void processPacket(Packet *packet) override;
    
    // 处理速度控制命令
    virtual void processSpeedControlCommand(const SpeedLimitPacket* cmd);
    
    // 获取TraCI接口
    virtual bool getTraCIInterface();
    
    // 应用速度限制
    virtual void applySpeedLimit(const std::string& vehicleId, double targetSpeed);
    
  public:
    SpeedLimitCarApp();
    virtual ~SpeedLimitCarApp();
};

#endif
