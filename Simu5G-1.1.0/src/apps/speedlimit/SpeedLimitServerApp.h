//
// 速度限制服务器应用头文件
//

#ifndef _SPEEDLIMITSERVERAPP_H_
#define _SPEEDLIMITSERVERAPP_H_

#include "inet/applications/udpapp/UdpBasicApp.h"
#include "apps/speedlimit/SpeedLimitPacket_m.h"

using namespace inet;

/**
 * 速度限制服务器应用模块
 * 继承自UdpBasicApp，用于处理来自RSU的速度检测数据
 * 并向车辆发送控制命令
 */
class SpeedLimitServerApp : public UdpBasicApp
{
  protected:
    // 统计信号
    static simsignal_t speedLimitCommandSentSignal;
    static simsignal_t messagesProcessedSignal;  // 新增：处理消息数量信号
    
    // 高精地图中是否有限速信息
    bool hasMapSpeedLimit;
    
    // 处理过的消息计数
    int processedMsgs;
    
    // 服务器处理延迟(秒)
    double processingDelay;
    
  protected:
    // 从UdpBasicApp继承的方法
    virtual void initialize(int stage) override;
    virtual void finish() override;
    
    // 处理接收到的UDP包
    virtual void processPacket(Packet *pk) override;
    
    // 处理速度检测器数据
    virtual void processDetectorData(const SpeedLimitPacket* data);
    
    // 检查高精地图是否有限速信息
    virtual bool checkMapHasSpeedLimit(const std::string& detectorId);
    
    // 创建控制命令包
    virtual Packet* createControlCommandPacket(const char* vehicleId, double currentSpeed, double targetSpeed);
    
    // SUMO ID到OMNeT++模块名的映射
    virtual std::string mapSumoIdToOmnetName(const char* sumoId);
    
  public:
    SpeedLimitServerApp();
    virtual ~SpeedLimitServerApp();
};

#endif