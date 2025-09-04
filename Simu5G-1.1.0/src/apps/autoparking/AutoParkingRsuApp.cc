//
// 自动泊车RSU应用实现
//

#include <omnetpp.h>
#include <string>
#include <vector>
#include <map>
#include <set>
#include <cmath>
#include "AutoParkingRsuApp.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "inet/common/packet/Packet.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins/base/utils/Coord.h"
#include "veins_inet/VeinsInetManager.h"
#include "AutoParkingPacket_m.h"

Define_Module(AutoParkingRsuApp);

// 注册信号
simsignal_t AutoParkingRsuApp::parkingCommandSentSignal = registerSignal("parkingCommandSent");

AutoParkingRsuApp::AutoParkingRsuApp() :
    UdpBasicApp(),
    isParkingSlotAssigned(false),
    checkInterval(1.0),
    parkingProbability(0.5),
    parkingAreasFile("parkingAreas.xml"),
    traci(nullptr),
    manager(nullptr),
    veinsManager(nullptr),
    checkTimer(nullptr),
    numSentParkingCommands(0)
{
}

AutoParkingRsuApp::~AutoParkingRsuApp()
{
    cancelAndDelete(checkTimer);
    
    // 释放停车场信息内存
    for (auto area : parkingAreas) {
        delete area;
    }
    parkingAreas.clear();
}

void AutoParkingRsuApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        checkInterval = par("checkInterval");
        parkingProbability = par("parkingProbability");
        parkingAreasFile = par("parkingAreasFile").stringValue();
        numSentParkingCommands = 0;
        checkTimer = new cMessage("checkTimer");
        commandedVehicles.clear();
        isParkingSlotAssigned = false;
        
        // 打印初始化信息
        EV_INFO << "AutoParkingRsuApp初始化，阶段: LOCAL" << endl;
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        EV_INFO << "AutoParkingRsuApp初始化，阶段: APPLICATION_LAYER" << endl;
        
        // 获取VeinsManager - 不再使用dynamic_cast，避免不完整类型问题
        cModule* managerModule = getModuleByPath("veinsManager");
        if (managerModule) {
            // 仅保存指针，不尝试转换类型
            veinsManager = nullptr; // 将使用替代方法找车辆
        }
        
        // 加载停车场信息
        loadParkingAreas();
        
        // 初始化UDP socket
        socket.setOutputGate(gate("socketOut"));
        const char *localAddress = par("localAddress");
        socket.bind(*localAddress ? L3AddressResolver().resolve(localAddress) : L3Address(), localPort);
        
        // 设置socket选项
        int timeToLive = par("timeToLive");
        if (timeToLive != -1)
            socket.setTimeToLive(timeToLive);
        
        int dscp = par("dscp");
        if (dscp != -1)
            socket.setDscp(dscp);
            
        socket.setCallback(this);
        
        // 启动定时器
        scheduleAt(simTime() + checkInterval, checkTimer);
    }
}

void AutoParkingRsuApp::connectToTraCI()
{
    if (traci && manager) {
        return;
    }
    
    cModule* module = getModuleByPath("veinsManager");
    if (!module) {
        EV_ERROR << "无法找到veinsManager模块" << endl;
        return;
    }
    
    manager = dynamic_cast<veins::TraCIScenarioManager*>(module);
    if (!manager) {
        EV_ERROR << "veinsManager模块不是TraCIScenarioManager类型" << endl;
        return;
    }
    
    if (!manager->isConnected()) {
        EV_INFO << "TraCIScenarioManager尚未连接" << endl;
        return;
    }
    
    traci = manager->getCommandInterface();
    if (traci) {
        EV_INFO << "成功获取TraCI命令接口" << endl;
    }
}

void AutoParkingRsuApp::handleMessageWhenUp(cMessage *msg)
{
    if (msg == checkTimer) {
        handleCheckTimer();
        return;
    }
    
    UdpBasicApp::handleMessageWhenUp(msg);
}

void AutoParkingRsuApp::handleCheckTimer()
{
    EV_INFO << "RSU: handleCheckTimer called at t=" << simTime() << endl;
    // 如果已经处理了两辆车，不再检查
    if (commandedVehicles.size() >= 2) {
        EV_INFO << "RSU: 已处理 " << commandedVehicles.size() << " 辆车，停止检查。" << endl;
        return;
    }
    
    // 尝试连接TraCI
    if (!traci || !manager) {
        connectToTraCI();
    }
    
    // 检查TraCI连接状态
    if (traci && manager) {
        checkVehiclesForParking();
    }
    
    // 重新调度下一次检查
    scheduleAt(simTime() + checkInterval, checkTimer);
}

void AutoParkingRsuApp::loadParkingAreas()
{
    // 清空现有数据
    for (auto area : parkingAreas) {
        delete area;
    }
    parkingAreas.clear();
    
    // 硬编码 parkingArea_1 的信息
    ParkingAreaInfo* area1 = new ParkingAreaInfo();
    area1->id = "parkingArea_1";
    area1->lane = "0/0to1/0_0";
    area1->type = "ROADSIDE";
    area1->startPos = 10.0;
    area1->endPos = 50.0;
    area1->x = 30.0;
    area1->y = 5.0;
    area1->capacity = 10;
    area1->occupancy = 0;
    
    parkingAreas.push_back(area1);
    
    EV_INFO << "加载停车场: " << area1->id 
           << ", 车道: " << area1->lane
           << ", 位置: [" << area1->startPos << ", " << area1->endPos << "]" << endl;
}

void AutoParkingRsuApp::checkVehiclesForParking()
{
    if (!traci || !manager) {
        EV_ERROR << "RSU: TraCI 接口未初始化，无法检查车辆。" << endl;
        return;
    }
    
    EV_INFO << "RSU: 开始检查车辆是否存在并发送指令..." << endl;
    
    // 由于Veins不直接提供获取所有车辆的方法，直接检查我们关心的目标车辆
    EV_INFO << "RSU: 直接检查目标车辆状态" << endl;
    
    // 尝试获取目标车辆信息
    std::vector<std::string> targetIds = {"flow_high_1.0", "flow_high_3.0"};
    for (const auto& vid : targetIds) {
        try {
            // 尝试获取车辆信息，如果车辆存在不会抛出异常
            auto vehicle = traci->vehicle(vid);
            std::string vlane = vehicle.getLaneId();
            double vpos = vehicle.getLanePosition();
            EV_INFO << "  检测到车辆 " << vid << " 在车道 " << vlane << " 位置 " << vpos << endl;
        } catch (const std::exception& e) {
            EV_WARN << "  车辆 " << vid << " 不在仿真中或无法获取信息: " << e.what() << endl;
        }
    }
    try {
        // 硬编码目标车辆：car[2] 和 car[9]
        // 使用用户确认的SUMO ID
        std::vector<std::pair<int, std::string>> targetVehicles = {
            {2, "flow_high_1.0"},  // 修正：car[2] 对应 flow_high_1.0
            {9, "flow_high_3.0"}   // 修正：car[9] 对应 flow_high_3.0
        };
        
        for (const auto& target : targetVehicles) {
            int carIndex = target.first;
            std::string sumoId = target.second;
            
            EV_INFO << "RSU: 正在处理目标 car[" << carIndex << "] with SUMO ID: " << sumoId << endl;
            // 检查是否已经处理过这辆车
            if (commandedVehicles.find(sumoId) != commandedVehicles.end()) {
                EV_INFO << "RSU: 车辆 " << sumoId << " 已处理过，跳过。" << endl;
                continue;
            }
            
            // 检查车辆是否存在 - 使用替代方法获取车辆列表
            // 在Veins 5.2中，我们需要改用命令接口直接检查车辆是否存在
            bool vehicleExists = false;
            
            try {
                // 直接尝试获取车辆信息，如果存在就不会抛出异常
                veins::TraCICommandInterface::Vehicle vehicle = traci->vehicle(sumoId);
                // 如果车辆存在，尝试获取其ID确认
                vehicleExists = true;
                EV_INFO << "RSU: 成功通过主ID找到车辆: " << sumoId << endl;
            } catch (std::exception& e) {
                // 车辆不存在，保持vehicleExists为false
                EV_DETAIL << "RSU: 主ID " << sumoId << " 未找到，尝试备选ID..." << endl;
            }
            
            if (!vehicleExists) {
                // 尝试多种可能的ID格式，包括特别关注索引0
                std::vector<std::string> altIds = {
                    // 用户确认的特定ID
                    carIndex == 2 ? "flow_high_3.0" : "",  // car[2] 的确认ID
                    carIndex == 9 ? "flow_high_1.0" : "",  // car[9] 的确认ID
                    
                    // 常规索引匹配
                    "flow_high_1." + std::to_string(carIndex),
                    "flow_high_3." + std::to_string(carIndex),
                    "flow_fast_1." + std::to_string(carIndex),
                    
                    // 特殊考虑索引0的车辆
                    "flow_high_1.0",
                    "flow_high_3.0",
                    
                    // 其他可能形式
                    "flow_low_1." + std::to_string(carIndex),
                    "flow_medium_1." + std::to_string(carIndex),
                    "flow." + std::to_string(carIndex),
                    "flow_0." + std::to_string(carIndex)
                };
                
                // 检查所有备用ID
                for (const std::string& altId : altIds) {
                    // 跳过空字符串
                    if (altId.empty()) continue;
                    
                    try {
                        // 尝试访问车辆
                        veins::TraCICommandInterface::Vehicle vehicle = traci->vehicle(altId);
                        // 如果成功，更新sumoId并设置为找到
                        sumoId = altId;
                        vehicleExists = true;
                        EV_INFO << "RSU: 成功通过备选ID找到车辆: " << altId << " for car[" << carIndex << "]" << endl;
                        break;
                    } catch (std::exception& e) {
                        // 车辆不存在，继续尝试下一个ID
                        continue;
                    }
                }
                
                if (!vehicleExists) {
                    EV_INFO << "RSU: car[" << carIndex << "] 的所有ID都未在仿真中找到，跳过。" << endl;
                    continue;  // 车辆还未生成
                }
            }
            
            std::string currentLane = traci->vehicle(sumoId).getLaneId();
            EV_INFO << "RSU: 车辆 " << sumoId << " 当前所在车道: " << currentLane << endl;
            
            bool onMonitoredLane = false;
            if (monitoredLanes.find(currentLane) != std::string::npos) {
                onMonitoredLane = true;
            }
            
            if (onMonitoredLane) {
                EV_INFO << "RSU: 车辆 " << sumoId << " 在监控车道上，准备发送指令。" << endl;
                
                // 查找对应的OMNeT++模块
                cModule* carModule = nullptr;
                std::string carModuleName = "car[" + std::to_string(carIndex) + "]";
                
                for (cModule::SubmoduleIterator it(getSimulation()->getSystemModule()); !it.end(); ++it) {
                    cModule* submod = *it;
                    if (std::string(submod->getFullName()) == carModuleName) {
                        carModule = submod;
                        break;
                    }
                }
                
                if (!carModule) {
                    EV_WARN << "RSU: 找不到模块 " << carModuleName << endl;
                    continue;
                }
                
                // 发送泊车指令
                sendParkingCommandToModule(carModule, sumoId, "parkingArea_1");
                
                // 标记已处理
                commandedVehicles.insert(sumoId);
                
                EV_INFO << "RSU: 已向 " << carModuleName << " 发送泊车指令" << endl;
            }
        }
        
    } catch (const std::exception& e) {
        EV_ERROR << "RSU: 检查车辆时出错: " << e.what() << endl;
    }
}

void AutoParkingRsuApp::sendParkingCommandToModule(cModule* carModule, const std::string& sumoId, const std::string& parkingAreaId)
{
    EV_INFO << "RSU: 进入 sendParkingCommandToModule for vehicle " << sumoId << endl;
    try {
        // 获取停车场信息
        ParkingAreaInfo* parkingArea = nullptr;
        for (auto area : parkingAreas) {
            if (area->id == parkingAreaId) {
                parkingArea = area;
                break;
            }
        }
        
        if (!parkingArea) {
            EV_ERROR << "RSU: 找不到停车场 " << parkingAreaId << endl;
            return;
        }
        
        // 获取车辆地址
        std::string fullPath = carModule->getFullPath();
        L3Address destAddr = L3AddressResolver().resolve(fullPath.c_str());
        EV_INFO << "RSU: 解析得到目标地址: " << destAddr.str() << " for path " << fullPath << endl;
        
        // 获取车辆应用端口
        cModule* appModule = carModule->getSubmodule("app", 0);
        if (!appModule) {
            EV_ERROR << "RSU: 找不到车辆应用模块" << endl;
            return;
        }
        int destPort = appModule->par("localPort");
        EV_INFO << "RSU: 解析得到目标端口: " << destPort << endl;
        
        // 获取车辆当前车道
        std::string currentLane = "";
        try {
            currentLane = traci->vehicle(sumoId).getLaneId();
            EV_INFO << "RSU: 车辆 " << sumoId << " 当前所在车道: " << currentLane << endl;
        } catch (const std::exception& e) {
            EV_ERROR << "RSU: 获取车辆 " << sumoId << " 当前车道失败: " << e.what() << endl;
        }
        
        // 创建泊车指令数据包
        auto data = inet::makeShared<AutoParkingPacket>();
        data->setChunkLength(inet::B(256));
        data->setVehicleId(sumoId.c_str());
        data->setParkingAreaId(parkingAreaId.c_str());
        data->setTimestamp(simTime());
        data->setParkingDuration(300.0);
        data->setDestinationLaneId(parkingArea->lane.c_str());
        data->setLaneId(currentLane.c_str());  // 设置车辆当前车道
        data->setParkingStartPos(parkingArea->startPos);
        data->setParkingEndPos(parkingArea->endPos);
        
        EV_INFO << "RSU: 创建泊车指令 - 车辆ID: " << sumoId 
               << ", 停车场ID: " << parkingAreaId
               << ", 目标车道: " << parkingArea->lane
               << ", 停车位置: [" << parkingArea->startPos << ", " << parkingArea->endPos << "]" << endl;
        
        std::string packetName = "parkingCmd-" + sumoId;
        inet::Packet *packet = new inet::Packet(packetName.c_str());
        packet->insertAtBack(data);
        
        EV_INFO << "RSU: 准备发送UDP包到 " << destAddr.str() << ":" << destPort << endl;
        // 发送数据包
        socket.sendTo(packet, destAddr, destPort);
        
        numSentParkingCommands++;
        emit(parkingCommandSentSignal, 1);
        
        EV_INFO << "RSU: 发送泊车指令到 " << destAddr.str() << ":" << destPort 
               << " 停车场: " << parkingAreaId << endl;
        
    } catch (const std::exception& e) {
        EV_ERROR << "RSU: 发送泊车指令时出错: " << e.what() << endl;
    }
}

// 以下是辅助函数的简单实现

ParkingAreaInfo* AutoParkingRsuApp::findNearestParkingArea(double x, double y)
{
    if (parkingAreas.empty()) {
        return nullptr;
    }
    return parkingAreas[0];  // 返回第一个（也是唯一的）停车场
}

double AutoParkingRsuApp::calculateDistance(double x1, double y1, double x2, double y2)
{
    double dx = x2 - x1;
    double dy = y2 - y1;
    return std::sqrt(dx*dx + dy*dy);
}

bool AutoParkingRsuApp::getTraCIInterface()
{
    return (traci != nullptr && manager != nullptr);
}

void AutoParkingRsuApp::findAndSendParkingCommand(const std::string& vehId)
{
    // 这个函数在简化版本中不使用
}

Packet* AutoParkingRsuApp::createParkingCommandPacket(const std::string& vehicleId, const std::string& parkingAreaId, 
                                              double distanceToParking, const std::string& currentLaneId, 
                                              const std::string& destinationLaneId)
{
    // 这个函数在简化版本中不使用
    return nullptr;
}

void AutoParkingRsuApp::finish()
{
    UdpBasicApp::finish();
    
    EV_INFO << "发送的泊车指令数量: " << numSentParkingCommands << endl;
    recordScalar("sentParkingCommands", numSentParkingCommands);
}