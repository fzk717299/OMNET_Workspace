//
// 速度限制RSU应用实现
//

#include "apps/speedlimit/SpeedLimitRsuApp.h"

// TraCI 相关头文件
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCIConnection.h"

// INET相关头文件
#include "inet/networklayer/common/L3AddressResolver.h"

Define_Module(SpeedLimitRsuApp);

// 统计信号声明和注册（简化）
simsignal_t SpeedLimitRsuApp::speedLimitDetectedSignal = registerSignal("speedLimitDetected");

SpeedLimitRsuApp::SpeedLimitRsuApp() : 
    UdpBasicApp(),
    speedLimitDetectorId("speedLimitDetector_1"),
    maxSpeed(60.0),
    checkInterval(0.1),
    traci(nullptr),
    checkTimer(nullptr)
{
}

SpeedLimitRsuApp::~SpeedLimitRsuApp()
{
    cancelAndDelete(checkTimer);
}

void SpeedLimitRsuApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        // 读取NED参数
        speedLimitDetectorId = par("speedLimitDetectorId").stringValue();
        maxSpeed = par("maxSpeed").doubleValue();
        checkInterval = par("checkInterval").doubleValue();
        
        // 创建检查计时器
        checkTimer = new cMessage("speedLimitCheckTimer");
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        EV_INFO << "SpeedLimitRsuApp initialized with detector " << speedLimitDetectorId 
                << " and max speed " << maxSpeed << " km/h" << endl;
        
        // 启动定期检查
        scheduleAt(simTime() + 1.0, checkTimer);  // 1秒后开始第一次检查
    }
}

void SpeedLimitRsuApp::handleMessageWhenUp(cMessage *msg)
{
    if (msg == checkTimer) {
        checkSpeedDetector();
        scheduleAt(simTime() + checkInterval, checkTimer);
        return;
    }
    
    // 处理其他消息
    UdpBasicApp::handleMessageWhenUp(msg);
}

bool SpeedLimitRsuApp::getTraCIInterface()
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
    
    // 尝试获取TraCI命令接口
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

void SpeedLimitRsuApp::checkSpeedDetector()
{
    // 获取TraCI接口
    if (!getTraCIInterface()) {
        EV_WARN << "TraCI interface not available yet, will try later" << endl;
        return;
    }
    
    try {
        // 之前错误使用了不存在的API方法
        // 使用正确的方式获取车辆：从TraCIScenarioManager获取已管理的模块
        std::map<std::string, cModule*> managedHosts = dynamic_cast<veins::TraCIScenarioManager*>(getModuleByPath("<root>.veinsManager"))->getManagedHosts();
        
        if (!managedHosts.empty()) {
            EV_INFO << "Found " << managedHosts.size() << " managed vehicles in the simulation." << endl;
        }
        
        // 遍历所有车辆 - 使用传统的迭代器语法以兼容C++11/14
        for (auto it = managedHosts.begin(); it != managedHosts.end(); ++it) {
            std::string sumoId = it->first;
            cModule* module = it->second;
            try {
                // 检查这是否是一个车辆模块 - 我们只处理车辆
                if (module->getParentModule() != getSimulation()->getSystemModule()) continue;
                
                // 优化：首先检查车辆是否在目标路段，如果不是，则跳过，减少TraCI调用
                std::string vehRoadId = traci->vehicle(sumoId).getRoadId();
                if (vehRoadId != "0/0to0/1") {
                    EV_INFO << "Vehicle " << sumoId << " on road " << vehRoadId << ", not on target road 0/0to0/1, skipping" << endl;
                    continue;
                }

                // 获取车辆在车道上的位置
                double vehPos = traci->vehicle(sumoId).getLanePosition();
                
                // 检查车辆是否在检测器附近10米范围内
                if (fabs(vehPos - 107.81) < 10.0) {
                    double vehSpeed = traci->vehicle(sumoId).getSpeed() * 3.6; // 转换为km/h
                    EV_INFO << "Vehicle " << sumoId << " detected near speed detector on road " << vehRoadId
                            << " at position " << vehPos << " with speed " << vehSpeed << " km/h." << endl;

                    // 检查是否超速且尚未处理
                    if (vehSpeed > maxSpeed) {
                        EV_INFO << "Vehicle " << sumoId << " is speeding! Current speed: " << vehSpeed 
                                << " km/h, limit: " << maxSpeed << " km/h. Sending control command." << endl;
                               
                        // 创建并发送速度限制数据包
                        Packet* packet = createSpeedLimitPacket(sumoId, vehSpeed);
                        
                        // 发射统计信号
                        emit(speedLimitDetectedSignal, vehSpeed);
                        
                        // 发送数据包
                        auto dest = L3AddressResolver().resolve("server");
                        socket.sendTo(packet, dest, destPort);
                        
                        // 添加到已处理列表，防止重复发送
                        processedVehicles.insert(sumoId);
                        
                        EV_INFO << "Speed limit command sent for vehicle " << sumoId << endl;
                    } else {
                        EV_INFO << "Vehicle " << sumoId << " not speeding, speed: " << vehSpeed 
                                << " km/h, limit: " << maxSpeed << " km/h." << endl;
                    }
                }
            }
            catch (const std::exception& e) {
                // 捕获处理单个车辆时可能发生的异常（例如，车辆刚离开模拟）
                EV_WARN << "Error processing vehicle " << sumoId << ": " << e.what() << endl;
            }
        }
    }
    catch (const std::exception& e) {
        EV_ERROR << "Error in checkSpeedDetector: " << e.what() << endl;
    }
}

Packet* SpeedLimitRsuApp::createSpeedLimitPacket(const std::string& vehicleId, double speed)
{
    // 创建速度限制包
    auto data = makeShared<SpeedLimitPacket>();
    data->setChunkLength(B(par("messageLength")));
    data->setMsgType(SL_DETECTOR_DATA);
    data->setVehicleId(vehicleId.c_str());
    data->setCurrentSpeed(speed / 3.6);  // 转换为m/s
    data->setTargetSpeed(maxSpeed / 3.6); // 转换为m/s
    data->setTimestamp(simTime());
    data->setDetectorId(speedLimitDetectorId.c_str());
    
    // 创建数据包
    Packet *packet = new Packet("speedLimitData");
    packet->insertAtBack(data);
    
    return packet;
}

void SpeedLimitRsuApp::finish()
{
    // 调用基类的finish方法确保统计收集完整
    UdpBasicApp::finish();
    
    // 添加兼容性统计记录 - 使与标准UDP指标兼容
    recordScalar("sentPk:count", processedVehicles.size());
    
    // 记录自定义应用层指标
    recordScalar("speedLimitDetections", processedVehicles.size());
    
    EV_INFO << "SpeedLimitRsuApp processed " << processedVehicles.size() << " vehicles" << endl;
}