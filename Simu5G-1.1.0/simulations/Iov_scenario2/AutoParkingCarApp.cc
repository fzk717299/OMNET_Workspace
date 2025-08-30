//
// 自动泊车车辆应用实现
//

#include "AutoParkingCarApp.h"
#include "inet/common/ModuleAccess.h"
#include "inet/common/TimeTag_m.h"
#include <cmath>

// TraCI 相关头文件
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCIConnection.h"
#include "veins_inet/VeinsInetMobility.h"

Define_Module(AutoParkingCarApp);

simsignal_t AutoParkingCarApp::parkingCommandReceivedSignal = registerSignal("parkingCommandReceived");
simsignal_t AutoParkingCarApp::parkingExecutedSignal = registerSignal("parkingExecuted");
simsignal_t AutoParkingCarApp::endToEndDelaySignal = registerSignal("endToEndDelay");

AutoParkingCarApp::AutoParkingCarApp() :
    smoothParking(true),
    responseTime(1.0),
    maxWaitingTime(300.0),
    traci(nullptr),
    parkingState(NOT_PARKING),
    parkingTimer(nullptr),
    receivedCommands(0),
    executedParkings(0)
{
}

AutoParkingCarApp::~AutoParkingCarApp()
{
    cancelAndDelete(parkingTimer);
}

void AutoParkingCarApp::initialize(int stage)
{
    UdpSink::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        // 读取参数
        smoothParking = par("smoothParking").boolValue();
        responseTime = par("responseTime").doubleValue();
        maxWaitingTime = par("maxWaitingTime").doubleValue();
        
        // 初始化定时器
        parkingTimer = new cMessage("parkingTimer");
        
        // 初始化状态
        parkingState = NOT_PARKING;
    }
}

void AutoParkingCarApp::handleMessage(cMessage *msg)
{
    if (msg == parkingTimer) {
        // 处理泊车定时器
        executeParkingOperation();
    }
    else {
        // 其他消息由父类处理
        UdpSink::handleMessage(msg);
    }
}

void AutoParkingCarApp::processPacket(Packet *packet)
{
    // 首先调用父类方法处理包，确保基本统计收集
    UdpSink::processPacket(packet);
    
    // 提取泊车指令
    try {
        auto parkingCmd = packet->peekAtFront<AutoParkingPacket>();
        if (parkingCmd) {
            processParkingCommand(parkingCmd.get(), packet->getArrivalTime());
        }
        else {
            EV_WARN << "Received packet is not a AutoParkingPacket" << endl;
        }
    }
    catch (std::exception& e) {
        EV_WARN << "Could not process packet: " << e.what() << endl;
    }
}

void AutoParkingCarApp::processParkingCommand(const AutoParkingPacket* cmd, simtime_t arrivalTime)
{
    std::string vehicleId = cmd->getVehicleId();
    std::string parkingAreaId = cmd->getParkingAreaId();
    double posX = cmd->getPosX();
    double posY = cmd->getPosY();
    double timestamp = cmd->getTimestamp();
    double distanceToParking = cmd->getDistanceToParking();
    
    // 计算端到端延迟
    double delay = arrivalTime.dbl() - timestamp;
    emit(endToEndDelaySignal, delay);
    
    // 增加接收计数
    receivedCommands++;
    emit(parkingCommandReceivedSignal, (long)1);
    
    // 检查是否是给我的指令
    std::string myId = getParentModule()->getFullName();
    if (vehicleId != myId) {
        EV_INFO << "Ignoring parking command for vehicle " << vehicleId 
               << " (I am " << myId << ")" << endl;
        return;
    }
    
    // 如果已经在泊车或已停车，忽略指令
    if (parkingState != NOT_PARKING) {
        EV_INFO << "Ignoring parking command because I'm already parking or parked" << endl;
        return;
    }
    
    EV_INFO << "Received parking command for area " << parkingAreaId 
           << " at position (" << posX << "," << posY << ")"
           << ", distance: " << distanceToParking << "m"
           << ", delay: " << delay << "s" << endl;
    
    // 保存目标停车区域
    targetParkingAreaId = parkingAreaId;
    
    // 更新状态为正在前往停车区域
    parkingState = DRIVING_TO_PARKING;
    
    // 获取TraCI接口
    if (!getTraCIInterface()) {
        EV_ERROR << "Failed to get TraCI interface, cannot execute parking command" << endl;
        parkingState = NOT_PARKING;
        return;
    }
    
    // 收到泊车指令后立即将车辆设为白色
    try {
        auto vehicle = traci->vehicle(myId);
        vehicle.setColor(veins::TraCIColor(255, 255, 255, 255)); // 白色表示已收到泊车指令
        EV_INFO << "Vehicle " << myId << " changed color to WHITE after receiving parking command" << endl;
    }
    catch (std::exception& e) {
        EV_ERROR << "Error setting vehicle color: " << e.what() << endl;
    }
    
    // 驾驶到停车区域（经过响应时间延迟）
    scheduleAt(simTime() + responseTime, parkingTimer);
    
    EV_INFO << "Will start driving to parking area after " << responseTime << "s" << endl;
}

bool AutoParkingCarApp::getTraCIInterface()
{
    // 已经有TraCI接口，直接返回
    if (traci) return true;
    
    // 查找车辆的移动模块
    auto mobilityModule = getParentModule()->getSubmodule("mobility");
    if (!mobilityModule) {
        EV_ERROR << "Could not find mobility module" << endl;
        return false;
    }
    
    // 检查是否是VeinsInetMobility
    auto veinsMobility = dynamic_cast<veins::VeinsInetMobility*>(mobilityModule);
    if (!veinsMobility) {
        EV_ERROR << "Mobility module is not VeinsInetMobility" << endl;
        return false;
    }
    
    // 获取TraCIScenarioManager
    auto manager = veins::TraCIScenarioManagerAccess().get();
    if (!manager) {
        EV_ERROR << "Could not find TraCIScenarioManager" << endl;
        return false;
    }
    
    // 获取TraCI命令接口
    traci = manager->getCommandInterface();
    if (!traci) {
        EV_ERROR << "Could not get TraCI Command Interface" << endl;
        return false;
    }
    
    return true;
}

void AutoParkingCarApp::executeParkingOperation()
{
    if (!traci) {
        EV_ERROR << "No TraCI interface available, cannot execute parking operation" << endl;
        return;
    }
    
    std::string myId = getParentModule()->getFullName();
    
    switch (parkingState) {
        case DRIVING_TO_PARKING: {
            // 获取停车区域位置
            double posX = 0.0;
            double posY = 0.0;
            
            // 这里简化处理，实际中应从TraCI获取停车区域位置
            // 现在我们只是通过ID解析位置
            try {
                // 提取坐标（这是一个简化实现）
                std::size_t xPos = targetParkingAreaId.find("_x");
                std::size_t yPos = targetParkingAreaId.find("_y");
                if (xPos != std::string::npos && yPos != std::string::npos) {
                    posX = std::stod(targetParkingAreaId.substr(xPos+2, yPos-xPos-2));
                    posY = std::stod(targetParkingAreaId.substr(yPos+2));
                }
                else {
                    // 默认值
                    posX = 200.0;
                    posY = 200.0;
                }
            }
            catch (...) {
                // 出错时使用默认值
                posX = 200.0;
                posY = 200.0;
            }
            
            // 驾驶到停车区域
            driveToParking(targetParkingAreaId, posX, posY);
            
            // 更新状态
            parkingState = PARKING;
            
            // 设置定时器，模拟泊车过程
            scheduleAt(simTime() + 5.0, parkingTimer);
            break;
        }
        
        case PARKING: {
            // 执行泊车操作
            try {
                auto vehicle = traci->vehicle(myId);
                
                // 停车
                vehicle.setSpeed(0.0);
                
                // 在SUMO中停车
                vehicle.setColor(veins::TraCIColor(0, 255, 0, 255)); // 绿色表示已停车
                
                // 完成泊车
                finishParking();
            }
            catch (std::exception& e) {
                EV_ERROR << "Error executing parking: " << e.what() << endl;
            }
            break;
        }
        
        case PARKED:
            // 车辆已停车，等待最大等待时间后可以重置状态
            EV_INFO << "Vehicle is parked, state will reset after " << maxWaitingTime << "s" << endl;
            scheduleAt(simTime() + maxWaitingTime, parkingTimer);
            parkingState = NOT_PARKING;
            break;
            
        case NOT_PARKING:
            // 不应该到这里
            EV_WARN << "Parking timer expired but vehicle is not parking" << endl;
            break;
    }
}

void AutoParkingCarApp::driveToParking(const std::string& parkingAreaId, double posX, double posY)
{
    if (!traci) return;
    
    std::string myId = getParentModule()->getFullName();
    
    try {
        auto vehicle = traci->vehicle(myId);
        
        // 设置车辆颜色为黄色，表示正在前往停车区域
        vehicle.setColor(veins::TraCIColor(255, 255, 0, 255));
        
        // 设置新目的地
        vehicle.changeTarget(parkingAreaId);
        
        // 如果需要平滑驾驶，逐渐减速
        if (smoothParking) {
            double currentSpeed = vehicle.getSpeed();
            double targetSpeed = std::max(5.0, currentSpeed * 0.7); // 降低到当前速度的70%，但不低于5m/s
            vehicle.setSpeed(targetSpeed);
        }
        
        EV_INFO << "Vehicle " << myId << " is driving to parking area " << parkingAreaId
               << " at (" << posX << "," << posY << ") and changed color to YELLOW" << endl;
    }
    catch (std::exception& e) {
        EV_ERROR << "Error driving to parking: " << e.what() << endl;
    }
}

void AutoParkingCarApp::finishParking()
{
    // 完成泊车，更新状态和统计
    parkingState = PARKED;
    executedParkings++;
    emit(parkingExecutedSignal, (long)1);
    
    EV_INFO << "Vehicle " << getParentModule()->getFullName()
           << " has successfully parked at " << targetParkingAreaId << " and changed color to GREEN" << endl;
}

void AutoParkingCarApp::finish()
{
    UdpSink::finish();
    
    // 记录统计信息
    recordScalar("receivedCommands", receivedCommands);
    recordScalar("executedParkings", executedParkings);
    
    EV_INFO << "AutoParkingCarApp received " << receivedCommands
           << " parking commands and executed " << executedParkings
           << " parking operations" << endl;
} 