//
// 事故服务器应用头文件
//

#ifndef __SIMU5G_ACCIDENTSERVERAPP_H_
#define __SIMU5G_ACCIDENTSERVERAPP_H_

#include "inet/applications/udpapp/UdpBasicApp.h"
#include "inet/common/lifecycle/ModuleOperations.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "apps/accident/AccidentPacket_m.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"

using namespace omnetpp;
using namespace inet;
using namespace veins;

/**
 * 事故服务器应用，负责转发变道命令
 */
class AccidentServerApp : public UdpBasicApp
{
protected:
    // 统计信号
    static simsignal_t laneChangeCommandForwardedSignal;
    
    // 处理过的消息计数
    int processedMsgs;
    
    // 服务器处理延迟(秒)
    double processingDelay;

protected:
    virtual int numInitStages() const override { return inet::NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;
    virtual void finish() override;
    
    // 处理接收到的UDP包
    virtual void processPacket(Packet *pk) override;
    
    // 处理并转发变道命令
    virtual void processLaneChangeCommand(const AccidentPacket* data);
    
    // 创建转发的变道命令包
    virtual Packet* createForwardedLaneChangePacket(const AccidentPacket* originalData);
    
    // 获取车道上的所有车辆
    virtual std::vector<std::string> getVehiclesOnLane(const std::string& laneId);
    
    // SUMO ID到OMNeT++模块名的映射
    virtual std::string mapSumoIdToOmnetName(const std::string& sumoId);
    
    // SUMO ID到OMNeT++模块的映射
    virtual cModule* mapSumoIdToModule(const std::string& sumoId);

    // TraCI
    veins::TraCICommandInterface* traci_{nullptr};
    veins::TraCIScenarioManager* manager_{nullptr};
    bool getTraCIInterface();

public:
    AccidentServerApp();
    virtual ~AccidentServerApp();
};

#endif