//
// 自动泊车RSU应用实现
//

#include <omnetpp.h>
#include <string>
#include <vector>
#include <map>
#include <set>
#include <cmath>
#include "apps/autoparking/AutoParkingRsuApp.h"
#include "inet/common/packet/Packet.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "inet/networklayer/common/ModulePathAddress.h"
#include "apps/autoparking/AutoParkingPacket_m.h"
#include "veins/modules/mobility/traci/TraCIColor.h"
#include "inet/applications/udpapp/UdpSink.h"

Define_Module(AutoParkingRsuApp);

// 注册信号
simsignal_t AutoParkingRsuApp::parkingCommandSentSignal = registerSignal("parkingCommandSent");

AutoParkingRsuApp::AutoParkingRsuApp() :
    UdpBasicApp(),
    checkInterval(1.0),
    parkingProbability(0.5),
    parkingAreasFile("parkingAreas.xml"),
    traci(nullptr),
    manager(nullptr),
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
        commandedVehicles.clear(); // 确保集合被清空
        
        // 打印初始化信息
        std::cout << "AutoParkingRsuApp初始化，阶段: LOCAL" << endl;
        std::cout << "checkInterval = " << checkInterval << endl;
        std::cout << "parkingProbability = " << parkingProbability << endl;
        std::cout << "parkingAreasFile = " << parkingAreasFile << endl;
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        std::cout << "AutoParkingRsuApp初始化，阶段: APPLICATION_LAYER" << endl;
        
        // 确保 socket 已正确初始化
        if (!socket.isOpen()) {
            socket.setOutputGate(gate("socketOut"));
            int localPort = par("localPort");
            socket.bind(localPort);
            std::cout << "已初始化UDP socket，本地端口: " << localPort << endl;
        }
        
        // 尝试立即连接TraCI
        std::cout << "尝试立即连接TraCI..." << endl;
        connectToTraCI();
        
        if (!traci || !manager) {
            std::cout << "初始TraCI连接失败，将在定时器触发时重试" << endl;
        } else {
            std::cout << "初始TraCI连接成功" << endl;
        }
        
        // 加载停车场信息
        loadParkingAreas();
        
        // 设置较短的初始检查间隔，以便尽快重试TraCI连接
        scheduleAt(simTime() + 0.1, checkTimer);
        std::cout << "已安排第一次检查，时间: " << simTime() + 0.1 << endl;
        }
}

void AutoParkingRsuApp::connectToTraCI()
{
    // 已经有TraCI接口
    if (traci) {
        std::cout << "TraCI接口已存在，无需重新获取" << endl;
        return;
    }
        
    std::cout << "尝试获取TraCI接口..." << endl;
    
    // 简化版本：直接尝试获取TraCIScenarioManager
    cModule* managerModule = getModuleByPath("<root>.veinsManager");
    if (!managerModule) {
        std::cout << "无法找到veinsManager模块，路径: <root>.veinsManager" << endl;
        EV_ERROR << "Could not find TraCI manager module" << endl;
        return;
    }
    
    // 尝试转换为TraCIScenarioManager
    veins::TraCIScenarioManager* scenarioManager = dynamic_cast<veins::TraCIScenarioManager*>(managerModule);
    if (!scenarioManager) {
        std::cout << "TraCI manager is not of type TraCIScenarioManager" << endl;
        EV_ERROR << "TraCI manager is not of type TraCIScenarioManager" << endl;
        return;
    }
    
    // 检查连接状态
    if (!scenarioManager->isConnected()) {
        std::cout << "TraCIScenarioManager未连接到SUMO" << endl;
        EV_WARN << "TraCI连接尚未建立" << endl;
        return;
    }
    
    // 获取命令接口
    this->manager = scenarioManager;
    traci = scenarioManager->getCommandInterface();
    if (traci) {
        std::cout << "成功获取TraCI命令接口" << endl;
        EV_INFO << "成功获取TraCI命令接口" << endl;
    } else {
        std::cout << "无法获取TraCI命令接口" << endl;
        EV_ERROR << "无法获取TraCI命令接口" << endl;
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
    std::cout << "\n当前仿真时间: " << simTime() << "s" << endl;
    
    // 每次定时器触发时尝试连接TraCI
    if (!traci || !manager) {
        std::cout << "TraCI接口未初始化，尝试重新连接..." << endl;
        connectToTraCI();
    }
    
    // 检查TraCI连接状态
    if (traci && manager) {
        std::cout << "TraCI接口已就绪，执行车辆检查" << endl;
        checkVehiclesForParking();
    } else {
        std::cout << "TraCI接口仍未就绪，跳过车辆检查" << endl;
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
    
    // 创建车道到停车场的映射
    std::map<std::string, ParkingAreaInfo*> laneToParking;
    
    try {
        // 解析XML文件
        cXMLElement* root = nullptr;
        try {
            root = getEnvir()->getXMLDocument(parkingAreasFile.c_str());
        } catch (const std::exception& e) {
            EV_ERROR << "解析XML文件时出错: " << e.what() << endl;
        }
        
        if (!root) {
            EV_ERROR << "无法加载停车场信息文件: " << parkingAreasFile << endl;
            return;
        }
        
        // 查找所有parkingArea元素
        cXMLElementList parkingAreaNodes = root->getChildrenByTagName("parkingArea");
        EV_INFO << "找到 " << parkingAreaNodes.size() << " 个停车区域" << endl;
        
        // 解析每个停车区域
        for (cXMLElement* node : parkingAreaNodes) {
            if (!node) continue;
        
            // 创建新的停车场信息
            ParkingAreaInfo* area = new ParkingAreaInfo();
            
            // 解析属性
            area->id = node->getAttribute("id") ? node->getAttribute("id") : "";
            area->lane = node->getAttribute("lane") ? node->getAttribute("lane") : "";
            area->type = node->getAttribute("type") ? node->getAttribute("type") : "default";
            area->x = node->getAttribute("x") ? atof(node->getAttribute("x")) : 0.0;
            area->y = node->getAttribute("y") ? atof(node->getAttribute("y")) : 0.0;
            area->capacity = node->getAttribute("capacity") ? atoi(node->getAttribute("capacity")) : 10;
            area->occupancy = 0; // 初始为空
            
            // 添加到列表
            parkingAreas.push_back(area);
            
            // 添加到映射
            if (!area->lane.empty()) {
                laneToParking[area->lane] = area;
            }
            
            EV_INFO << "加载停车区域: " << area->id << ", 位置: (" << area->x << "," << area->y 
                    << "), 容量: " << area->capacity << endl;
        }
        
        EV_INFO << "成功加载 " << parkingAreas.size() << " 个停车区域" << endl;
    }
    catch (const std::exception& e) {
        EV_ERROR << "加载停车场信息时出错: " << e.what() << endl;
    }
    catch (...) {
        EV_ERROR << "加载停车场信息时发生未知错误" << endl;
    }
}

void AutoParkingRsuApp::checkVehiclesForParking()
{
    // 检查TraCI接口是否可用
    if (!traci || !manager) {
        EV_ERROR << "TraCI接口或管理器尚未初始化" << endl;
        std::cout << "TraCI接口或管理器尚未初始化" << endl;
        return;
    }
    
    // 在多个时间点尝试发送泊车指令
    double currentTime = simTime().dbl();
    bool shouldSendCommand = false;
    
    // 每隔 5 秒尝试发送一次，从第 5 秒开始
    if (currentTime >= 5.0 && fmod(currentTime, 5.0) < 0.2) {
        shouldSendCommand = true;
    }
    
    if (!shouldSendCommand) {
        return;
    }
    
    std::cout << "执行自动泊车指令，当前时间: " << simTime() << "s" << endl;
    
    try {
        // 使用与SpeedLimitRsuApp相同的方法获取已管理的车辆
        std::map<std::string, cModule*> managedHosts = manager->getManagedHosts();
        std::cout << "成功获取managedHosts，数量: " << managedHosts.size() << endl;
        
        if (managedHosts.empty()) {
            std::cout << "没有找到已管理的车辆" << endl;
            return;
}

        // 目标车辆ID（精确匹配和前缀匹配）
        const std::string exactTargetId = "flow_high_3.0";
        const std::string targetPrefix = "flow_high_3";
        bool targetFound = false;
        
        // 遍历所有车辆，寻找目标车辆
        for (auto it = managedHosts.begin(); it != managedHosts.end(); ++it) {
            std::string sumoId = it->first;
            cModule* module = it->second;
            
            if (sumoId.empty() || !module) {
                continue;
            }

            // 输出所有车辆ID，帮助调试
            std::cout << "发现车辆: " << sumoId << endl;
            
            // 检查是否是目标车辆（精确匹配或前缀匹配）
            if (sumoId == exactTargetId || 
                (sumoId.length() >= targetPrefix.length() && 
                 sumoId.substr(0, targetPrefix.length()) == targetPrefix)) {
                
                targetFound = true;
                std::cout << "找到目标车辆: " << sumoId << endl;
                
                // 检查车辆是否已经接收到命令
                if (commandedVehicles.find(sumoId) != commandedVehicles.end()) {
                    std::cout << "车辆 " << sumoId << " 已经接收过命令，跳过" << endl;
                    continue;
                }
                
                try {
                    if (!traci) {
                        std::cout << "TraCI接口为空，无法控制车辆" << endl;
                        continue;
                    }
                    
                    // 获取车辆当前位置
                    double posX = 0.0;
                    double posY = 0.0;
                    
                    // 使用车道ID和车道位置来估计位置
                    std::string laneId = traci->vehicle(sumoId).getLaneId();
                    double lanePosition = traci->vehicle(sumoId).getLanePosition();
                    
                    std::cout << "车辆 " << sumoId << " 当前车道: " << laneId << ", 车道位置: " << lanePosition << endl;
                    
                    // 查找最近的停车场
                    ParkingAreaInfo* nearestParking = findNearestParkingArea(posX, posY);
                    if (!nearestParking) {
                        std::cout << "未找到可用的停车场" << endl;
                        continue;
            }

                    std::cout << "找到最近的停车场: " << nearestParking->id 
                              << " 位置: (" << nearestParking->x << ", " << nearestParking->y << ")" << endl;
                    
                    // 计算到停车场的距离
                    double dx = nearestParking->x - posX;
                    double dy = nearestParking->y - posY;
                    double distanceToParking = std::sqrt(dx*dx + dy*dy);
                    
                    // 设置车辆颜色为白色
                    traci->vehicle(sumoId).setColor(veins::TraCIColor(255, 255, 255, 255));
                    std::cout << "已将车辆 " << sumoId << " 颜色设置为白色" << endl;
                    
                    // 查找车辆的应用程序模块
                    cModule* carApp = module->getSubmodule("app", 0);
                    
                    if (!carApp) {
                        std::cout << "无法找到车辆 " << sumoId << " 的应用程序模块" << endl;
                        
                        // 打印车辆模块的详细信息，帮助调试
                        std::cout << "车辆模块信息: " << module->getFullPath() << ", 类型: " << module->getClassName() << endl;
                        
                        // 打印车辆模块的子模块
                        for (cModule::SubmoduleIterator it(module); !it.end(); it++) {
                            cModule* submod = *it;
                            std::cout << " - 子模块: " << submod->getFullName() << " (" << submod->getClassName() << ")" << endl;
                            
                            // 打印子模块的子模块
                            for (cModule::SubmoduleIterator subit(submod); !subit.end(); subit++) {
                                cModule* subsubmod = *subit;
                                std::cout << "   - 子子模块: " << subsubmod->getFullName() << " (" << subsubmod->getClassName() << ")" << endl;
                            }
                        }
                        continue;
                    }
                    
                    std::cout << "找到车辆应用程序模块: " << carApp->getFullPath() << ", 类型: " << carApp->getClassName() << endl;
                    
                    // 创建并发送泊车指令数据包
                    Packet* packet = createParkingCommandPacket(sumoId, nearestParking->id, distanceToParking, laneId, nearestParking->lane);
                    
                    // 获取车辆的目的地地址
                    L3Address destAddr;
                    try {
                        // 使用车辆模块的路径解析地址，而不是应用程序模块
                        std::string hostPath = module->getFullPath();
                        std::cout << "尝试解析车辆模块地址: " << hostPath << endl;
                        destAddr = L3AddressResolver().resolve(hostPath.c_str());
                        std::cout << "成功解析车辆模块地址: " << destAddr.str() << endl;
                    } catch (const std::exception& e) {
                        std::cout << "无法解析车辆模块地址: " << e.what() << endl;
                        
                        // 尝试使用其他方法
                        try {
                            // 尝试使用车辆模块的网络层地址
                            cModule* networkLayer = module->getSubmodule("ipv4");
                            if (!networkLayer) {
                                networkLayer = module->getSubmodule("networkLayer");
                                if (networkLayer) {
                                    networkLayer = networkLayer->getSubmodule("ipv4");
                                }
                            }
                            
                            if (networkLayer) {
                                std::string networkPath = networkLayer->getFullPath();
                                std::cout << "尝试解析网络层地址: " << networkPath << endl;
                                destAddr = L3AddressResolver().resolve(networkPath.c_str());
                                std::cout << "成功解析网络层地址: " << destAddr.str() << endl;
                            }
                        } catch (const std::exception& e) {
                            std::cout << "无法解析网络层地址: " << e.what() << endl;
                        }
                    }
                    
                    if (destAddr.isUnspecified()) {
                        std::cout << "无法获取车辆 " << sumoId << " 的地址，放弃发送" << endl;
                        delete packet;
                        continue;
                    }
                    
                    // 计算目标车辆的唯一端口（回退方案）
                    int baseDestPort = par("destPort");
                    int uniqueDestPort = baseDestPort + module->getId();

                    // 优先读取车辆应用实例实际绑定端口
                    int appLocalPort = -1;
                    try {
                        if (carApp->hasPar("localPort")) {
                            appLocalPort = (int)carApp->par("localPort");
                        }
                    } catch (...) {
                        appLocalPort = -1;
                    }

                    int destPortToUse = appLocalPort > 0 ? appLocalPort : uniqueDestPort;
                    std::cout << "将向车辆应用发送，computedPort=" << uniqueDestPort
                              << ", appLocalPort=" << appLocalPort
                              << ", finalDestPort=" << destPortToUse << std::endl;
                    
                    socket.sendTo(packet, destAddr, destPortToUse);
                    EV_INFO << "已向车辆 " << sumoId << " 发送泊车指令，目标地址: " << destAddr.str() << ", 端口: " << destPortToUse;
                    
                    // 增加停车场占用
                    nearestParking->occupancy++;
                    
                    // 将车辆添加到已命令列表
                    commandedVehicles.insert(sumoId);
                    
                    // 统计信息
                    numSentParkingCommands++;
                    
                    // 发出信号
                    emit(parkingCommandSentSignal, 1);
                    
                } catch (const std::exception& e) {
                    std::cout << "控制车辆 " << sumoId << " 时发生异常: " << e.what() << endl;
                }
            }
        }
        
        if (!targetFound) {
            std::cout << "未找到目标车辆: " << exactTargetId << " 或前缀为 " << targetPrefix << " 的车辆，可能尚未生成或已离开仿真" << endl;
    }
    } catch (const std::exception& e) {
        std::cout << "checkVehiclesForParking中发生异常: " << e.what() << endl;
    } catch (...) {
        std::cout << "checkVehiclesForParking中发生未知异常" << endl;
    }
}

ParkingAreaInfo* AutoParkingRsuApp::findNearestParkingArea(double x, double y)
{
    if (parkingAreas.empty()) {
        return nullptr;
    }
    
    ParkingAreaInfo* nearest = nullptr;
    double minDistance = std::numeric_limits<double>::max();
    
    try {
        for (auto area : parkingAreas) {
            if (!area) continue;
            
            // 检查停车场是否已满
            if (area->occupancy >= area->capacity) {
                continue;
            }
            
            // 计算距离
            double dx = area->x - x;
            double dy = area->y - y;
            double distance = std::sqrt(dx*dx + dy*dy);
            
            // 更新最近的停车场
            if (distance < minDistance) {
                minDistance = distance;
                nearest = area;
            }
        }
    } catch (const std::exception& e) {
        EV_ERROR << "查找最近停车场时出错: " << e.what() << endl;
    } catch (...) {
        EV_ERROR << "查找最近停车场时发生未知错误" << endl;
    }
    
    return nearest;
}

Packet* AutoParkingRsuApp::createParkingCommandPacket(const std::string& vehicleId, const std::string& parkingAreaId, double distanceToParking, const std::string& currentLaneId, const std::string& destinationLaneId)
{
    // 创建泊车指令数据包
    auto data = makeShared<AutoParkingPacket>();
    
    // 设置数据包长度
    B messageLength = B(par("messageLength"));
    data->setChunkLength(messageLength);
    
    // 设置数据包内容
    data->setMsgType(AP_PARKING_COMMAND);
    data->setVehicleId(vehicleId.c_str());
    data->setParkingAreaId(parkingAreaId.c_str());
    data->setDistanceToParking(distanceToParking);
    data->setTimestamp(simTime());
    data->setPosX(0);  // 这些值目前未使用
    data->setPosY(0);
    
    // 设置当前车道和目标车道
    if (!currentLaneId.empty()) {
        data->setLaneId(currentLaneId.c_str());
    }
    if (!destinationLaneId.empty()) {
        data->setDestinationLaneId(destinationLaneId.c_str());
    }
    
    // 创建数据包
    std::string packetName = "parkingCommand-" + vehicleId;
    Packet *packet = new Packet(packetName.c_str());
    
    // 插入数据
    packet->insertAtBack(data);
    
    std::cout << "创建泊车指令数据包: " << packetName 
              << ", 目标车辆: " << vehicleId 
              << ", 停车场: " << parkingAreaId 
              << ", 目标车道: " << destinationLaneId
              << ", 长度: " << messageLength << endl;
    
    return packet;
}

void AutoParkingRsuApp::finish()
{
    // 调用基类的finish方法
    UdpBasicApp::finish();
    
    // 输出统计信息
    EV_INFO << "发送的泊车指令数量: " << numSentParkingCommands << endl;
    recordScalar("sentParkingCommands", numSentParkingCommands);
} 
