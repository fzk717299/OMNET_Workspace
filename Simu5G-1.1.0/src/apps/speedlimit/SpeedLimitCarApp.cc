//
// 速度限制车辆应用实现
//

#include "apps/speedlimit/SpeedLimitCarApp.h"
#include "inet/common/packet/chunk/Chunk.h"
#include "inet/common/Units.h"

using namespace inet::units::values;

// TraCI 相关头文件
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCIConnection.h"
#include "veins_inet/VeinsInetMobility.h"

Define_Module(SpeedLimitCarApp);

// 静态信号声明和注册
simsignal_t SpeedLimitCarApp::speedCommandReceivedSignal = registerSignal("speedCommandReceived");
simsignal_t SpeedLimitCarApp::speedLimitAppliedSignal = registerSignal("speedLimitApplied");
simsignal_t SpeedLimitCarApp::endToEndDelaySignal = registerSignal("endToEndDelay");

SpeedLimitCarApp::SpeedLimitCarApp() : 
    UdpSink(),
    traci(nullptr),
    smoothDeceleration(true),
    responseTime(2.0),
    processedCmds(0)
{
}

SpeedLimitCarApp::~SpeedLimitCarApp()
{
    // 不需要销毁traci，因为它是外部管理的
}

void SpeedLimitCarApp::initialize(int stage)
{
    UdpSink::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        // 读取参数
        smoothDeceleration = par("smoothDeceleration").boolValue();
        responseTime = par("responseTime").doubleValue();
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        EV_INFO << "SpeedLimitCarApp initialized for " << getParentModule()->getFullName() << endl;
    }
}

void SpeedLimitCarApp::processPacket(Packet *packet)
{
    // 首先调用父类方法处理包，确保基本统计收集
    UdpSink::processPacket(packet);
    
    // 计算端到端延迟
    simtime_t delay = simTime() - packet->getCreationTime();
    emit(endToEndDelaySignal, delay);  // 记录延迟统计
    
    // 尝试解析为SpeedLimitPacket
    try {
        // 使用更安全的方式检查和获取数据
        const auto& chunk = packet->peekData<Chunk>();
        if (chunk) {
            // 尝试将chunk转换为SpeedLimitPacket
            const auto speedCmd = dynamicPtrCast<const SpeedLimitPacket>(chunk);
            if (speedCmd && speedCmd->getMsgType() == SL_CONTROL_COMMAND) {
                // 记录接收到速度命令的统计信息
                emit(speedCommandReceivedSignal, (long)1);
                
                // 处理控制命令
                processSpeedControlCommand(speedCmd.get());
                processedCmds++;
            }
        }
    }
    catch (const std::exception& e) {
        EV_WARN << "Error processing packet: " << e.what() << endl;
    }
}

bool SpeedLimitCarApp::getTraCIInterface()
{
    // 已经有TraCI接口
    if (traci)
        return true;
        
    // 尝试获取TraCI接口
    cModule* manager = getModuleByPath("<root>.veinsManager");
    if (!manager) {
        EV_ERROR << "Could not find TraCI manager module" << endl;
        return false;
    }
    
    // 尝试获取TraCI命令接口 - VeinsInetManager继承自TraCIScenarioManagerLaunchd，后者继承自TraCIScenarioManager
    veins::TraCIScenarioManager* scenarioManager = dynamic_cast<veins::TraCIScenarioManager*>(manager);
    if (!scenarioManager) {
        EV_ERROR << "TraCI manager is not of type TraCIScenarioManager" << endl;
        return false;
    }
    
    // 获取命令接口 - getCommandInterface()返回指针，不需要取地址
    if (scenarioManager->isConnected()) {
        traci = scenarioManager->getCommandInterface();
        return traci != nullptr;
    }
    
    return false;
}

void SpeedLimitCarApp::processSpeedControlCommand(const SpeedLimitPacket* cmd)
{
    // 获取命令中的SUMO ID
    const char* commandSumoId = cmd->getVehicleId();
    double targetSpeed = cmd->getTargetSpeed() * 3.6;  // 转换为km/h
    int reason = cmd->getControlReason();
    
    // 获取自己的SUMO ID
    cModule* mobilityModule = getParentModule()->getSubmodule("mobility");
    auto* veinsMobility = dynamic_cast<veins::VeinsInetMobility*>(mobilityModule);
    if (!veinsMobility) {
        EV_ERROR << "Could not get VeinsInetMobility module" << endl;
        return;
    }
    
    // 获取自己的SUMO ID
    std::string mySumoId = veinsMobility->getExternalId();
    
    EV_INFO << "Received speed control command: "
            << "My SUMO ID=" << mySumoId 
            << ", Command SUMO ID=" << commandSumoId
            << ", Target speed=" << targetSpeed << " km/h" << endl;
    
    // 直接比较SUMO ID
    if (mySumoId == commandSumoId) {
        // ID匹配，执行限速
        EV_INFO << "ID match! Applying speed limit to vehicle " << mySumoId 
                << ", target speed: " << targetSpeed << " km/h, reason: " << reason << endl;
        
        // 应用速度限制
        applySpeedLimit(mySumoId, targetSpeed);
    } else {
        EV_INFO << "Command not for me. My ID: " << mySumoId << ", command ID: " << commandSumoId << endl;
    }
}

void SpeedLimitCarApp::applySpeedLimit(const std::string& vehicleId, double targetSpeed)
{
    // 获取TraCI接口
    if (!getTraCIInterface()) {
        EV_ERROR << "TraCI interface not available, cannot apply speed limit" << endl;
        return;
    }
    
    try {
        // targetSpeed是km/h，需要转换为m/s给TraCI API
        double speedMs = targetSpeed / 3.6;  // 转换为m/s
        
        EV_INFO << "Applying speed limit to vehicle " << vehicleId 
                << ", target speed: " << targetSpeed << " km/h (" 
                << speedMs << " m/s)" << endl;
                
        // 发射统计信号记录应用的速度限制
        emit(speedLimitAppliedSignal, targetSpeed);
                
        // 应用速度限制
        if (smoothDeceleration) {
            // 平滑减速
            EV_INFO << "Using smooth deceleration over " << responseTime << " seconds" << endl;
            traci->vehicle(vehicleId).slowDown(speedMs, responseTime);
        }
        else {
            // 立即设置速度
            EV_INFO << "Setting speed immediately" << endl;
            traci->vehicle(vehicleId).setSpeed(speedMs);
        }
        
        EV_INFO << "Successfully applied speed limit to vehicle " << vehicleId << endl;
    }
    catch (const std::exception& e) {
        EV_ERROR << "Error applying speed limit for vehicle " << vehicleId << ": " << e.what() << endl;
    }
}

void SpeedLimitCarApp::finish()
{
    // 调用基类的finish方法确保统计收集完整
    UdpSink::finish();
    
    // 添加兼容性统计记录 - 使与标准UDP指标兼容
    recordScalar("rcvdPk:count", processedCmds);
    
    // 记录自定义应用层指标
    recordScalar("speedCommandsReceived", processedCmds);
    
    EV_INFO << "SpeedLimitCarApp processed " << processedCmds << " control commands" << endl;
}