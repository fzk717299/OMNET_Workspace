//
// 自动泊车车辆应用头文件
//

#ifndef __AUTOPARKINGCARAPP_H_
#define __AUTOPARKINGCARAPP_H_

#include <string>
#include "inet/applications/udpapp/UdpSink.h"
#include "AutoParkingPacket_m.h"

// 前向声明
namespace veins {
    class TraCICommandInterface;
}

using namespace inet;

// 泊车状态枚举
enum ParkingState {
    NOT_PARKING,       // 未开始泊车
    DRIVING_TO_PARKING, // 正在前往泊车位
    PARKING,           // 正在执行泊车操作
    PARKED             // 已停车
};

class AutoParkingCarApp : public UdpSink
{
  protected:
    // 配置参数
    bool smoothParking;
    double responseTime;
    double maxWaitingTime;
    
    // TraCI接口指针，不负责创建和销毁
    veins::TraCICommandInterface* traci;
    
    // 泊车状态
    ParkingState parkingState;
    std::string targetParkingAreaId;
    
    // 定时器
    cMessage* parkingTimer;
    
    // 统计信息
    int receivedCommands;
    int executedParkings;
    
    // 信号声明
    static simsignal_t parkingCommandReceivedSignal;
    static simsignal_t parkingExecutedSignal;
    static simsignal_t endToEndDelaySignal;
    
  protected:
    // 获取TraCI接口
    virtual bool getTraCIInterface();
    
    // 处理收到的泊车指令
    virtual void processParkingCommand(const AutoParkingPacket* cmd, simtime_t arrivalTime);
    
    // 执行泊车操作
    virtual void executeParkingOperation();
    
    // 驾驶到停车区域
    virtual void driveToParking(const std::string& parkingAreaId, double posX, double posY);
    
    // 完成泊车
    virtual void finishParking();
    
  public:
    AutoParkingCarApp();
    virtual ~AutoParkingCarApp();
    
  protected:
    virtual int numInitStages() const override { return NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;
    virtual void handleMessage(cMessage *msg) override;
    virtual void processPacket(Packet *packet) override;
    virtual void finish() override;
};

#endif 