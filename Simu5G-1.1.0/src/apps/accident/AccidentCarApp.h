//
// 事故车辆应用头文件
//

#ifndef __SIMU5G_ACCIDENTCARAPP_H_
#define __SIMU5G_ACCIDENTCARAPP_H_

#include "inet/applications/udpapp/UdpSink.h"
#include "apps/accident/AccidentPacket_m.h"
#include "veins/base/utils/Coord.h" // Add this include for Coord
#include "veins_inet/VeinsInetMobility.h" // Add this include for mobility

using namespace omnetpp;
using namespace inet;

// 前向声明
namespace veins {
    class TraCICommandInterface;
}

/**
 * 事故车辆应用模块
 * 继承自UdpSink，用于接收和执行停车命令
 */
class AccidentCarApp : public UdpSink
{
protected:
    // 车辆状态枚举 - 移除STOPPING
    enum AccidentCarState {
        NORMAL,         // 正常行驶
        STOPPED,        // 已停车 (用于事故车自身)
        EVADING         // 正在避让
    };

    // 统计信号 - 移除与停车相关的
    static simsignal_t endToEndDelaySignal;
    
    // TraCI接口指针，不负责创建和销毁
    veins::TraCICommandInterface* traci_;
    
    // Mobility module pointer
    veins::VeinsInetMobility* mobility_;
    
    // 是否启用平滑减速
    bool smoothDeceleration_;
    
    // 停车响应时间(秒)
    double responseTime_;
    
    // 是否是事故车辆
    bool isAccidentVehicle_;
    
    // 车辆当前状态
    AccidentCarState state_;

    // --- 新增避让逻辑成员 ---
    bool isEvading_;
    std::string originalLaneId_;
    std::string targetLaneId_;
    Coord accidentPos_;
    cMessage *checkPositionTimer_{nullptr};
    
    // 处理的命令计数
    int processedCmds_;

    // 事故发生时间
    simtime_t accidentTime_;
    
    // 事故计时器
    cMessage *accidentTimer_{nullptr};
    
protected:
    // 从UdpSink继承的方法
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg) override;
    virtual void finish() override;
    
    // 处理收到的数据包 (现在只处理变道命令)
    virtual void processPacket(Packet *packet) override;
    
    // --- 避让逻辑方法 ---
    virtual void processLaneChangeCommand(const inet::AccidentPacket* cmd);
    virtual void startEvasionManeuver();
    virtual void checkEvasionStatus();
    virtual void finishEvasionManeuver();
    
    // 获取TraCI接口
    virtual bool getTraCIInterface();
    
    // 获取自己的SUMO ID
    virtual std::string getSumoId();

    // 触发事故 (事故车自身使用)
    virtual void triggerAccident();
    
    // 手动确保socket绑定
    virtual void ensureSocketBinding();

public:
    AccidentCarApp();
    virtual ~AccidentCarApp() override;
};

#endif