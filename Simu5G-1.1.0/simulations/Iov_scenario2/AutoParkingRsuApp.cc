//
// 自动泊车RSU应用实现
//

#include "AutoParkingRsuApp.h"
#include "AutoParkingPacket_m.h"
#include "inet/common/ModuleAccess.h"
#include "inet/common/TimeTag_m.h"
#include "inet/common/packet/chunk/ByteCountChunk.h"

// TraCI 相关头文件
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins_inet/VeinsInetMobility.h"

Define_Module(AutoParkingRsuApp);

simsignal_t AutoParkingRsuApp::parkingCommandSentSignal = registerSignal("parkingCommandSent");

AutoParkingRsuApp::AutoParkingRsuApp() :
    traciModulePath("veinsManager"),
    checkInterval(1.0),
    detectionRadius(100.0),
    maxVehiclesToCheck(10),
    enableDirectParking(false),
    directParkingTime(5.0),
    targetVehicleId("0"),
    traci(nullptr),
    traciModule(nullptr),
    traciInitialized(false),
    checkTimer(nullptr),
    directParkingTimer(nullptr),
    numSentParkingCommands(0)
{
}

AutoParkingRsuApp::~AutoParkingRsuApp()
{
    cancelAndDelete(checkTimer);
    if (directParkingTimer)
        cancelAndDelete(directParkingTimer);
}

void AutoParkingRsuApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        // 读取参数
        traciModulePath = par("traciModulePath").stringValue();
        checkInterval = par("checkInterval").doubleValue();
        detectionRadius = par("detectionRadius").doubleValue();
        maxVehiclesToCheck = par("maxVehiclesToCheck");
        
        // 读取直接泊车命令参数
        enableDirectParking = par("enableDirectParking").boolValue();
        directParkingTime = par("directParkingTime").doubleValue();
        targetVehicleId = par("targetVehicleId").stringValue();
        
        // 初始化定时器
        checkTimer = new cMessage("checkVehiclesTimer");
        if (enableDirectParking) {
            directParkingTimer = new cMessage("directParkingTimer");
        }
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        // 启动检测定时器
        scheduleAt(simTime() + 2.0, checkTimer);
        
        // 如果启用直接泊车命令，设置定时器
        if (enableDirectParking) {
            scheduleAt(simTime() + directParkingTime, directParkingTimer);
            EV_INFO << "直接泊车命令将在 " << directParkingTime 
                   << " 秒后发送给车辆 " << targetVehicleId << endl;
        }
        
        EV_INFO << "AutoParkingRsuApp initialized with check interval: " << checkInterval
                << "s, detection radius: " << detectionRadius << "m" << endl;
    }
}

void AutoParkingRsuApp::handleMessageWhenUp(cMessage *msg)
{
    if (msg == checkTimer) {
        handleCheckTimer();
    }
    else if (msg == directParkingTimer) {
        sendDirectParkingCommand();
        delete msg;  // 这是一个一次性定时器
        directParkingTimer = nullptr;
    }
    else {
        UdpBasicApp::handleMessageWhenUp(msg);
    }
}

void AutoParkingRsuApp::handleCheckTimer()
{
    // 初始化TraCI连接（如果尚未初始化）
    if (!traciInitialized) {
        traciInitialized = getTraCIConnection();
    }
    
    // 检查需要泊车的车辆
    if (traciInitialized) {
        checkVehiclesForParking();
    }
    else {
        EV_WARN << "TraCI connection not initialized yet, trying again later" << endl;
    }
    
    // 重新调度定时器
    scheduleAt(simTime() + checkInterval, checkTimer);
}

void AutoParkingRsuApp::sendDirectParkingCommand()
{
    // 初始化TraCI连接（如果尚未初始化）
    if (!traciInitialized) {
        traciInitialized = getTraCIConnection();
    }
    
    if (!traciInitialized || !traci) {
        EV_ERROR << "无法发送直接泊车命令: TraCI未连接" << endl;
        return;
    }
    
    EV_INFO << "发送直接泊车命令给车辆 " << targetVehicleId << endl;
    
    try {
        // 获取车辆信息
        auto vehicle = traci->vehicle(targetVehicleId);
        veins::TraCICoord position = vehicle.getPosition();
        
        // 创建并发送泊车请求
        Packet* packet = createParkingRequestPacket(targetVehicleId, position.x, position.y);
        if (packet) {
            socket.sendTo(packet, destAddr, destPort);
            numSentParkingCommands++;
            emit(parkingCommandSentSignal, (long)1);
            
            EV_INFO << "已发送直接泊车命令给车辆 " << targetVehicleId 
                   << " 在位置 (" << position.x << ", " << position.y << ")" << endl;
        }
    }
    catch (std::exception& e) {
        EV_ERROR << "发送直接泊车命令时出错: " << e.what() << endl;
        EV_ERROR << "车辆 " << targetVehicleId << " 可能不在仿真中" << endl;
    }
}

bool AutoParkingRsuApp::getTraCIConnection()
{
    // 查找TraCI模块
    traciModule = getModuleByPath(traciModulePath.c_str());
    if (!traciModule) {
        EV_ERROR << "Could not find TraCI module at path: " << traciModulePath << endl;
        return false;
    }
    
    // 获取TraCIScenarioManager
    auto* manager = dynamic_cast<veins::TraCIScenarioManager*>(traciModule);
    if (!manager) {
        EV_ERROR << "TraCI module is not a TraCIScenarioManager" << endl;
        return false;
    }
    
    // 获取TraCI命令接口
    traci = manager->getCommandInterface();
    if (!traci) {
        EV_ERROR << "Could not get TraCI Command Interface" << endl;
        return false;
    }
    
    EV_INFO << "TraCI connection initialized successfully" << endl;
    return true;
}

void AutoParkingRsuApp::checkVehiclesForParking()
{
    if (!traci) return;
    
    try {
        // 获取仿真中的所有车辆
        std::list<std::string> vehicles = traci->getVehicleIds(); // 修正: 使用getVehicleIds()获取车辆ID，而不是getVehicleTypeIds()
        int checked = 0;
        
        // 遍历车辆
        for (const std::string& vehicleId : vehicles) {
            // 跳过已指定直接泊车的车辆
            if (enableDirectParking && vehicleId == targetVehicleId) {
                continue;
            }
            
            // 如果达到最大检测数量，停止检测
            if (checked >= maxVehiclesToCheck) break;
            
            try {
                // 获取车辆接口
                auto vehicle = traci->vehicle(vehicleId);
                
                // 获取车辆状态信息
                double speed = vehicle.getSpeed();
                double stopTime = vehicle.getStopTime(); // 车辆停止的时间
                
                // 检查车辆是否需要泊车
                if (vehicleNeedsParking(vehicleId, speed, stopTime)) {
                    // 获取车辆位置
                    veins::TraCICoord position = vehicle.getPosition();
                    
                    // 创建并发送泊车请求
                    Packet* packet = createParkingRequestPacket(vehicleId, position.x, position.y);
                    if (packet) {
                        socket.sendTo(packet, destAddr, destPort);
                        numSentParkingCommands++;
                        emit(parkingCommandSentSignal, (long)1);
                        
                        EV_INFO << "Sent parking request for vehicle " << vehicleId 
                               << " at position (" << position.x << ", " << position.y << ")" << endl;
                    }
                }
                
                checked++;
            }
            catch (std::exception& e) {
                EV_ERROR << "Error processing vehicle " << vehicleId << ": " << e.what() << endl;
            }
        }
    }
    catch (std::exception& e) {
        EV_ERROR << "Error checking vehicles for parking: " << e.what() << endl;
    }
}

bool AutoParkingRsuApp::vehicleNeedsParking(const std::string& vehicleId, double speed, double stopTime)
{
    // 判断车辆是否需要泊车的逻辑：
    // 1. 车辆速度很低（接近停止）
    // 2. 车辆已经停止一段时间
    // 这里使用简单的判断标准，实际应用中可能需要更复杂的逻辑
    
    // 速度接近0且停止时间超过10秒
    bool needsParking = (speed < 0.5) && (stopTime > 10.0);
    
    if (needsParking) {
        EV_INFO << "Vehicle " << vehicleId << " needs parking: speed=" 
               << speed << "m/s, stopTime=" << stopTime << "s" << endl;
    }
    
    return needsParking;
}

Packet* AutoParkingRsuApp::createParkingRequestPacket(const std::string& vehicleId, 
                                                  double posX, double posY)
{
    B payloadLength = B(par("messageLength"));
    
    // 创建一个新的数据包
    Packet *packet = new Packet("parkingRequest");
    const auto& payload = makeShared<AutoParkingPacket>();
    
    // 设置数据包内容
    payload->setVehicleId(vehicleId.c_str());
    payload->setParkingAreaId(""); // 服务器将分配停车区域
    payload->setPosX(posX);
    payload->setPosY(posY);
    payload->setTimestamp(simTime().dbl());
    payload->setDistanceToParking(0.0); // 未知，由服务器计算
    payload->setParkingType(ROADSIDE); // 默认类型，由服务器决定
    
    // 设置数据块长度并插入payload
    payload->setChunkLength(payloadLength);
    payload->addTag<CreationTimeTag>()->setCreationTime(simTime());
    packet->insertAtBack(payload);
    
    return packet;
}

void AutoParkingRsuApp::finish()
{
    UdpBasicApp::finish();
    
    // 记录统计信息
    recordScalar("numSentParkingCommands", numSentParkingCommands);
    
    EV_INFO << "AutoParkingRsuApp sent " << numSentParkingCommands 
           << " parking commands" << endl;
} 