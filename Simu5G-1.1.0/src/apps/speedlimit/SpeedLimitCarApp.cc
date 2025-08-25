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
    // 首先调用父类方法处理包
    UdpSink::processPacket(packet);
    
    // 尝试解析为SpeedLimitPacket - 使用try-catch处理可能的错误
    try {
        // 使用更安全的方式检查和获取数据
        const auto& chunk = packet->peekData<Chunk>();
        if (chunk) {
            // 尝试将chunk转换为SpeedLimitPacket
            const auto speedCmd = dynamicPtrCast<const SpeedLimitPacket>(chunk);
            if (speedCmd && speedCmd->getMsgType() == SL_CONTROL_COMMAND) {
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
    // 获取命令数据
    const char* vehicleId = cmd->getVehicleId();
    double targetSpeed = cmd->getTargetSpeed() * 3.6;  // 转换为km/h
    int reason = cmd->getControlReason();
    
    // 检查命令是否适用于此车辆
    std::string myId = getParentModule()->getFullName();
    
    // 从车辆的移动模块获取其SUMO ID
    cModule* mobilityModule = getParentModule()->getSubmodule("mobility");
    auto* veinsMobility = dynamic_cast<veins::VeinsInetMobility*>(mobilityModule);
    if (!veinsMobility) {
        EV_ERROR << "Could not get VeinsInetMobility module for " << myId << endl;
        return;
    }
    std::string mySumoId = veinsMobility->getExternalId();

    // 检查命令中的车辆ID是否与此车辆的SUMO ID匹配
    if (mySumoId == vehicleId) {
        EV_INFO << "Received speed control command for my vehicle (SUMO ID: " << mySumoId << "): targetSpeed=" << targetSpeed
                << " km/h, reason=" << reason << endl;
                
        // 应用速度限制，传递SUMO ID
        applySpeedLimit(mySumoId, targetSpeed);
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
        // 应用速度限制
        if (smoothDeceleration) {
            // 平滑减速
            EV_INFO << "Applying smooth deceleration to " << targetSpeed << " km/h over " 
                    << responseTime << " seconds for vehicle " << vehicleId << endl;
            traci->vehicle(vehicleId).slowDown(targetSpeed / 3.6, responseTime); // Veins 5.2+ API, responseTime is in seconds
        }
        else {
            // 立即设置速度
            EV_INFO << "Setting speed immediately to " << targetSpeed << " km/h for vehicle " << vehicleId << endl;
            traci->vehicle(vehicleId).setSpeed(targetSpeed / 3.6); // Veins 5.2+ API
        }
        
        // 修改车辆颜色以可视化控制（可选）
        // 注意：Veins 5.2中不再支持setColor方法
    }
    catch (const std::exception& e) {
        EV_ERROR << "Error applying speed limit for vehicle " << vehicleId << ": " << e.what() << endl;
    }
}

void SpeedLimitCarApp::finish()
{
    UdpSink::finish();
    
    EV_INFO << "SpeedLimitCarApp processed " << processedCmds << " control commands" << endl;
}
