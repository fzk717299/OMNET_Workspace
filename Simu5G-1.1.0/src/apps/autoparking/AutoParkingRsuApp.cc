//
// 自动泊车RSU应用实现
//

#include <omnetpp.h>
#include <string>
#include <vector>
#include <map>
#include <set>
#include <cmath>
#include <fstream>
#include "apps/autoparking/AutoParkingRsuApp.h"
#include "inet/common/packet/Packet.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "inet/networklayer/common/ModulePathAddress.h"
#include "apps/autoparking/AutoParkingPacket_m.h"
#include "veins/modules/mobility/traci/TraCIColor.h"
#include "inet/applications/udpapp/UdpSink.h"

Define_Module(AutoParkingRsuApp);

// 泊车命令发送信号
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
        serverDestAddrName = par("serverDestAddr").stringValue();
        serverDestPort = par("serverDestPort");
        numSentParkingCommands = 0;
        checkTimer = new cMessage("checkTimer");
        commandedVehicles.clear(); // 确保集合被清空
        
        // 打印初始化信息
        std::cout << "AutoParkingRsuApp初始化，阶段: LOCAL" << endl;
        std::cout << "checkInterval = " << checkInterval << endl;
        std::cout << "parkingProbability = " << parkingProbability << endl;
        std::cout << "parkingAreasFile = " << parkingAreasFile << endl;
        std::cout << "serverDestAddr = " << serverDestAddrName << endl;
        std::cout << "serverDestPort = " << serverDestPort << endl;
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        std::cout << "AutoParkingRsuApp初始化，阶段: APPLICATION_LAYER" << endl;
        
        // 加载停车场信息
        if (!parkingAreasFile.empty()) {
            loadParkingAreas();
        }
        
        // 启动定时器, 第一次检查时再连接TraCI
        scheduleAt(simTime() + checkInterval, checkTimer);
    }
}

bool AutoParkingRsuApp::getTraCIInterface()
{
    if (!traci) {
        cModule* managerModule = getSimulation()->getModuleByPath("<root>.veinsManager");
        if (managerModule) {
            manager = dynamic_cast<veins::TraCIScenarioManager*>(managerModule);
            if (manager) {
                traci = manager->getCommandInterface();
            }
        }
        if (!traci) {
            EV_ERROR << "无法找到TraCI接口." << endl;
            return false;
        }
        EV_INFO << "成功连接到TraCI" << endl;
    }
    return true;
}

void AutoParkingRsuApp::handleMessageWhenUp(cMessage *msg)
{
    if (msg == checkTimer) {
        handleCheckTimer();
    }
    else {
        UdpBasicApp::handleMessageWhenUp(msg);
    }
}

void AutoParkingRsuApp::handleCheckTimer()
{
    // 在定时器触发时，尝试获取TraCI接口并执行逻辑
    if (getTraCIInterface()) {
        checkVehiclesForParking();
    }
    
    // 重新调度定时器
    scheduleAt(simTime() + checkInterval, checkTimer);
}

void AutoParkingRsuApp::loadParkingAreas()
{
    if (parkingAreasFile.empty()) {
        EV_WARN << "未指定停车场信息文件" << endl;
        return;
    }
    
    try {
        // 使用简单的文本解析方式读取XML文件
        std::ifstream file(parkingAreasFile.c_str());
        if (!file.is_open()) {
            EV_ERROR << "无法打开停车场信息文件: " << parkingAreasFile << endl;
            return;
        }
        
        // 创建车道到停车场的映射
        std::map<std::string, ParkingAreaInfo*> laneToParking;
        
        // 简单解析XML
        std::string line;
        while (std::getline(file, line)) {
            // 查找停车区域定义行
            if (line.find("<parkingArea") != std::string::npos) {
                ParkingAreaInfo* area = new ParkingAreaInfo();
                
                // 解析ID
                size_t idPos = line.find("id=\"");
                if (idPos != std::string::npos) {
                    idPos += 4; // 跳过 id="
                    size_t idEnd = line.find("\"", idPos);
                    if (idEnd != std::string::npos) {
                        area->id = line.substr(idPos, idEnd - idPos);
                    }
                }
                
                // 解析lane
                size_t lanePos = line.find("lane=\"");
                if (lanePos != std::string::npos) {
                    lanePos += 6; // 跳过 lane="
                    size_t laneEnd = line.find("\"", lanePos);
                    if (laneEnd != std::string::npos) {
                        area->lane = line.substr(lanePos, laneEnd - lanePos);
                    }
                }
                
                // 解析type
                size_t typePos = line.find("type=\"");
                if (typePos != std::string::npos) {
                    typePos += 6; // 跳过 type="
                    size_t typeEnd = line.find("\"", typePos);
                    if (typeEnd != std::string::npos) {
                        area->type = line.substr(typePos, typeEnd - typePos);
                    }
                } else {
                    area->type = "ROADSIDE"; // 默认值
                }
                
                // 解析x坐标
                size_t xPos = line.find("x=\"");
                if (xPos != std::string::npos) {
                    xPos += 3; // 跳过 x="
                    size_t xEnd = line.find("\"", xPos);
                    if (xEnd != std::string::npos) {
                        area->x = std::stod(line.substr(xPos, xEnd - xPos));
                    }
                }
                
                // 解析y坐标
                size_t yPos = line.find("y=\"");
                if (yPos != std::string::npos) {
                    yPos += 3; // 跳过 y="
                    size_t yEnd = line.find("\"", yPos);
                    if (yEnd != std::string::npos) {
                        area->y = std::stod(line.substr(yPos, yEnd - yPos));
                    }
                }
                
                // 解析容量
                size_t capPos = line.find("capacity=\"");
                if (capPos != std::string::npos) {
                    capPos += 10; // 跳过 capacity="
                    size_t capEnd = line.find("\"", capPos);
                    if (capEnd != std::string::npos) {
                        area->capacity = std::stoi(line.substr(capPos, capEnd - capPos));
                    }
                }
                
                // 解析占用
                size_t occPos = line.find("occupied=\"");
                if (occPos != std::string::npos) {
                    occPos += 10; // 跳过 occupied="
                    size_t occEnd = line.find("\"", occPos);
                    if (occEnd != std::string::npos) {
                        area->occupancy = std::stoi(line.substr(occPos, occEnd - occPos));
                    }
                }
                
                // 添加到列表
                parkingAreas.push_back(area);
                
                // 添加到映射
                if (!area->lane.empty()) {
                    laneToParking[area->lane] = area;
                }
                
                EV_INFO << "加载停车区域: " << area->id << ", 位置: (" << area->x << "," << area->y 
                        << "), 容量: " << area->capacity << endl;
            }
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

        // 目标车辆ID
        const std::string targetVehicleId = "flow_high_3.0";
        
        // 遍历所有车辆，寻找目标车辆
        for (auto const& [sumoId, module] : managedHosts) {
            
            // 只处理目标车辆
            if (sumoId != targetVehicleId) {
                continue;
            }

            // 检查是否已经为该车辆发送过泊车命令
            if (commandedVehicles.find(sumoId) != commandedVehicles.end()) {
                std::cout << "车辆 " << sumoId << " 已经收到过泊车命令，跳过" << endl;
                continue;
            }
            
            // 获取车辆位置
            try {
                auto vehicleCommand = traci->vehicle(sumoId);
                
                // Veins中Vehicle类没有直接的getPosition方法，需要通过其他方式获取位置
                // 使用getLaneId和getLanePosition来获取车辆位置
                std::string laneId = vehicleCommand.getLaneId();
                double lanePos = vehicleCommand.getLanePosition();
                
                // 简单估算坐标 - 在实际应用中可能需要更复杂的计算
                // 这里我们简单地使用车道位置作为x坐标，y坐标设为固定值
                double posX = lanePos;
                double posY = 0.0;
                
                // 获取车辆当前车道
                std::string currentLaneId = vehicleCommand.getLaneId();
                
                // 查找最近的停车场
                ParkingAreaInfo* nearestParking = findNearestParkingArea(posX, posY);
                if (!nearestParking) {
                    std::cout << "未找到合适的停车场" << endl;
                    continue;
                }
                
                // 计算到停车场的距离
                double dx = nearestParking->x - posX;
                double dy = nearestParking->y - posY;
                double distance = std::sqrt(dx*dx + dy*dy);
                
                // 创建泊车指令数据包
                Packet* packet = createParkingCommandPacket(
                    sumoId, nearestParking->id, distance, 
                    currentLaneId, nearestParking->lane
                );
                
                // 发送到服务器而不是直接发送到车辆
                try {
                    L3Address serverAddr = L3AddressResolver().resolve(serverDestAddrName.c_str());
                    socket.sendTo(packet, serverAddr, serverDestPort);
                    
                    // 添加到已命令车辆集合
                    commandedVehicles.insert(sumoId);
                    
                    // 更新统计
                    numSentParkingCommands++;
                    emit(parkingCommandSentSignal, 1);
                    
                    EV_INFO << "向服务器发送泊车指令，车辆: " << sumoId 
                            << ", 目标停车场: " << nearestParking->id 
                            << ", 距离: " << distance << "m" << endl;
                    std::cout << "向服务器发送泊车指令，车辆: " << sumoId 
                            << ", 目标停车场: " << nearestParking->id 
                            << ", 距离: " << distance << "m" << endl;
                    
                    // 每次只发送一个指令，避免同时发送多个
                    break;
                }
                catch (const std::exception& e) {
                    EV_ERROR << "发送泊车指令时出错: " << e.what() << endl;
                    std::cout << "发送泊车指令时出错: " << e.what() << endl;
                    delete packet;
                }
            }
            catch (const std::exception& e) {
                EV_ERROR << "获取车辆信息时出错: " << e.what() << endl;
                std::cout << "获取车辆信息时出错: " << e.what() << endl;
            }
        }
    }
    catch (const std::exception& e) {
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
    Packet *packet = new Packet("ParkingCommand");
    packet->insertAtBack(data);
    
    return packet;
}

void AutoParkingRsuApp::finish()
{
    UdpBasicApp::finish();
    
    // 输出统计信息
    EV_INFO << "AutoParkingRsuApp sent " << numSentParkingCommands << " parking commands" << endl;
} 
