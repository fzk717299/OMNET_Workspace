//
// 速度限制服务器应用实现
//

#include "apps/speedlimit/SpeedLimitServerApp.h"
#include "inet/common/packet/chunk/Chunk.h"
#include "inet/common/packet/Packet.h"
#include "inet/common/Units.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"

using namespace inet::units::values;

Define_Module(SpeedLimitServerApp);

SpeedLimitServerApp::SpeedLimitServerApp() :
    UdpBasicApp(),
    hasMapSpeedLimit(false),
    processedMsgs(0),
    processingDelay(0.05)
{
}

SpeedLimitServerApp::~SpeedLimitServerApp()
{
    // 清理资源（如果有）
}

void SpeedLimitServerApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        // 读取参数
        hasMapSpeedLimit = par("hasMapSpeedLimit").boolValue();
        processingDelay = par("processingDelay").doubleValue();
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        EV_INFO << "SpeedLimitServerApp initialized with hasMapSpeedLimit=" 
                << (hasMapSpeedLimit ? "true" : "false") << endl;
    }
}

void SpeedLimitServerApp::processPacket(Packet *pk)
{
    // 首先调用父类方法处理包
    UdpBasicApp::processPacket(pk);
    
    // 尝试解析为SpeedLimitPacket - 使用try-catch处理可能的错误
    try {
        // 使用更安全的方式检查和获取数据
        const auto& chunk = pk->peekData<Chunk>();
        if (chunk) {
            // 尝试将chunk转换为SpeedLimitPacket
            const auto speedData = dynamicPtrCast<const SpeedLimitPacket>(chunk);
            if (speedData && speedData->getMsgType() == SL_DETECTOR_DATA) {
                // 处理检测器数据
                processDetectorData(speedData.get());
                processedMsgs++;
            }
        }
    }
    catch (const std::exception& e) {
        EV_WARN << "Error processing packet: " << e.what() << endl;
    }
}

void SpeedLimitServerApp::processDetectorData(const SpeedLimitPacket* data)
{
    // 获取数据
    const char* vehicleId = data->getVehicleId();
    const char* detectorId = data->getDetectorId();
    double currentSpeed = data->getCurrentSpeed() * 3.6;  // 转换为km/h
    double targetSpeed = data->getTargetSpeed() * 3.6;    // 转换为km/h
    
    EV_INFO << "Server received detector data: vehicle=" << vehicleId
            << ", detector=" << detectorId
            << ", speed=" << currentSpeed << " km/h"
            << ", target speed=" << targetSpeed << " km/h" << endl;
    
    // 检查高精地图是否有该位置的限速信息
    bool mapHasLimit = checkMapHasSpeedLimit(detectorId);
    
    // 如果高精地图中没有限速信息，则需要发送控制命令
    if (!mapHasLimit) {
        EV_INFO << "Map doesn't have speed limit for detector " << detectorId
                << ", preparing control command for vehicle " << vehicleId << endl;
        
        // 创建控制命令包
        Packet* cmdPacket = createControlCommandPacket(vehicleId, currentSpeed, targetSpeed);
        
        try {
            // 获取车辆对应的OMNeT++模块名称
            std::string omnetModuleName = mapSumoIdToOmnetName(vehicleId);
            
            if (!omnetModuleName.empty()) {
                // 解析地址并发送命令
                L3Address destAddr = L3AddressResolver().resolve(omnetModuleName.c_str());
                
                if (!destAddr.isUnspecified()) {
                    EV_INFO << "Sending command to " << omnetModuleName << " at address " << destAddr << endl;
                    socket.sendTo(cmdPacket, destAddr, destPort);
                } else {
                    EV_ERROR << "Failed to resolve address for node " << omnetModuleName << endl;
                    delete cmdPacket;
                }
            } else {
                EV_ERROR << "Could not map SUMO ID " << vehicleId << " to any OMNeT++ module" << endl;
                delete cmdPacket;
            }
        } catch (const std::exception& e) {
            EV_ERROR << "Error sending command to vehicle " << vehicleId << ": " << e.what() << endl;
            delete cmdPacket;
        }
    }
}

bool SpeedLimitServerApp::checkMapHasSpeedLimit(const std::string& detectorId)
{
    // 这里应该查询高精地图数据库
    // 在我们的简化模型中，直接返回配置的值
    return hasMapSpeedLimit;
}

Packet* SpeedLimitServerApp::createControlCommandPacket(const char* vehicleId, double currentSpeed, double targetSpeed)
{
    // 创建控制命令包
    auto data = makeShared<SpeedLimitPacket>();
    data->setChunkLength(B(par("messageLength")));
    data->setMsgType(SL_CONTROL_COMMAND);
    data->setVehicleId(vehicleId);
    data->setCurrentSpeed(currentSpeed / 3.6);  // 转换为m/s
    data->setTargetSpeed(targetSpeed / 3.6);    // 转换为m/s
    data->setTimestamp(simTime());
    data->setControlReason(0);  // 0 = 地图缺失
    
    // 创建数据包
    Packet *packet = new Packet("speedLimitCommand");
    packet->insertAtBack(data);
    
    return packet;
}

std::string SpeedLimitServerApp::mapSumoIdToOmnetName(const char* sumoId)
{
    // 获取VeinsInetManager
    cModule* manager = getModuleByPath("<root>.veinsManager");
    if (!manager) {
        EV_ERROR << "Could not find veinsManager module" << endl;
        return "";
    }
    
    // 获取映射表
    veins::TraCIScenarioManager* scenarioManager = dynamic_cast<veins::TraCIScenarioManager*>(manager);
    if (!scenarioManager) {
        EV_ERROR << "veinsManager is not a TraCIScenarioManager" << endl;
        return "";
    }
    
    std::map<std::string, cModule*> managedHosts = scenarioManager->getManagedHosts();
    
    // 在映射表中查找对应的模块
    auto it = managedHosts.find(sumoId);
    if (it != managedHosts.end()) {
        cModule* module = it->second;
        std::string moduleName = module->getFullName();
        EV_INFO << "Found managed module " << moduleName << " for SUMO ID " << sumoId << endl;
        return moduleName;
    }
    
    EV_ERROR << "No managed module found for SUMO ID " << sumoId << endl;
    return "";
}

void SpeedLimitServerApp::finish()
{
    UdpBasicApp::finish();
    
    EV_INFO << "SpeedLimitServerApp processed " << processedMsgs << " detector messages" << endl;
}