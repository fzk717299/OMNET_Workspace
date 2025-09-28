//
// 自动泊车服务器应用实现
//

#include "AutoParkingServerApp.h"
#include <cmath>
#include <fstream>
#include <algorithm>
#include "inet/common/ModuleAccess.h"
#include "inet/common/TimeTag_m.h"
#include "inet/common/packet/chunk/ByteCountChunk.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "inet/networklayer/common/L3AddressTag_m.h"
#include "inet/transportlayer/contract/udp/UdpControlInfo_m.h"
#include "inet/transportlayer/common/L4PortTag_m.h"
#include "inet/applications/base/ApplicationPacket_m.h"
using namespace inet;

Define_Module(AutoParkingServerApp);

simsignal_t AutoParkingServerApp::parkingCommandRelayedSignal = registerSignal("parkingCommandRelayed");

AutoParkingServerApp::AutoParkingServerApp() :
    parkingAssignmentStrategy("nearest"),
    parkingAreasFile(""),
    processDelayedMsg(nullptr),
    numRelayedCommands(0)
{
}

AutoParkingServerApp::~AutoParkingServerApp()
{
    // 清理停车场信息
    for (auto area : parkingAreas) {
        delete area;
    }
    
    // 清理延迟消息
    cancelAndDelete(processDelayedMsg);
}

void AutoParkingServerApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        parkingAssignmentStrategy = par("parkingAssignmentStrategy").stdstringValue();
        parkingAreasFile = par("parkingAreasFile").stdstringValue();
        
        // 创建延迟处理定时器
        processDelayedMsg = new cMessage("processDelayedMsg");
        
        EV_INFO << "AutoParkingServerApp initialized with strategy: " << parkingAssignmentStrategy << endl;
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        // 加载停车场信息
        if (!parkingAreasFile.empty()) {
            loadParkingAreas();
        }
    }
}

void AutoParkingServerApp::loadParkingAreas()
{
    // 简化版本 - 创建一个默认停车场
    ParkingAreaInfo* area1 = new ParkingAreaInfo();
    area1->id = "parkingArea_1";
    area1->type = "ROADSIDE";
    area1->x = 30.0;
    area1->y = 5.0;
    area1->capacity = 10;
    area1->occupancy = 0;
    area1->priority = 1;
    area1->lane = "0/0to1/0_0";
    
    parkingAreas.push_back(area1);
    
    EV_INFO << "已创建默认停车场: " << area1->id << endl;
}

void AutoParkingServerApp::handleMessageWhenUp(cMessage *msg)
{
    // 简化版本 - 直接调用父类处理
    UdpBasicApp::handleMessageWhenUp(msg);
}

void AutoParkingServerApp::socketDataArrived(UdpSocket *socket, Packet *packet)
{
    // 接收数据包并记录详细信息
    EV_INFO << "【服务器】收到数据包: " << packet->getName() << ", 大小: " << packet->getByteLength() << " 字节" << endl;
    std::cout << "【服务器】收到数据包: " << packet->getName() << ", 大小: " << packet->getByteLength() << " 字节" << endl;
    
    // 尝试获取源地址信息
    auto addressInd = packet->findTag<L3AddressInd>();
    if (addressInd) {
        EV_INFO << "【服务器】数据包来源: " << addressInd->getSrcAddress() << endl;
        std::cout << "【服务器】数据包来源: " << addressInd->getSrcAddress() << endl;
    }
    
    // 处理泊车请求
    processParkingRequest(packet);
    
    // 删除数据包
    delete packet;
}

void AutoParkingServerApp::processReceivedPacket(Packet *packet)
{
    // 简化版本
    processParkingRequest(packet);
}

void AutoParkingServerApp::handleDelayedMessage(cMessage *msg)
{
    // 简化版本 - 基本处理
    delete msg;
}

void AutoParkingServerApp::processParkingRequest(Packet *packet)
{
    EV_INFO << "【服务器】开始处理泊车请求..." << endl;
    std::cout << "【服务器】开始处理泊车请求..." << endl;
    
    try {
        auto parkingRequest = packet->peekAtFront<AutoParkingPacket>();
        if (!parkingRequest) {
            EV_ERROR << "【服务器】收到的不是AutoParkingPacket类型的数据包" << endl;
            std::cout << "【服务器】收到的不是AutoParkingPacket类型的数据包" << endl;
            return;
        }
        
        // 提取请求信息
        std::string vehicleId = parkingRequest->getVehicleId();
        double posX = parkingRequest->getPosX();
        double posY = parkingRequest->getPosY();
        std::string currentLaneId = parkingRequest->getLaneId();
        
        EV_INFO << "【服务器】处理车辆 " << vehicleId << " 的泊车请求, 位置: (" << posX << "," << posY << ")" << endl;
        std::cout << "【服务器】处理车辆 " << vehicleId << " 的泊车请求, 位置: (" << posX << "," << posY << ")" << endl;
        
        // 根据策略找到合适的停车区域
        ParkingAreaInfo* parkingArea = nullptr;
        if (parkingAssignmentStrategy == "nearest") {
            parkingArea = findNearestParkingArea(posX, posY);
        }
        else {
            parkingArea = findOptimalParkingArea(posX, posY);
        }
        
        // 如果找到停车区域
        if (parkingArea) {
            // 增加占用计数
            parkingArea->occupancy++;
            
            // 计算距离
            double distance = calculateDistance(posX, posY, parkingArea->x, parkingArea->y);
            
            EV_INFO << "【服务器】为车辆 " << vehicleId << " 分配停车场 " << parkingArea->id << endl;
            std::cout << "【服务器】为车辆 " << vehicleId << " 分配停车场 " << parkingArea->id << endl;
            
            // 创建泊车指令包
            Packet* cmdPacket = createParkingCommandPacket(
                vehicleId,
                parkingArea->id,
                distance,
                currentLaneId,
                parkingArea->lane
            );
            
            // 关键部分: 使用veinsManager查找车辆并转发数据包
            std::string omnetModuleName = mapSumoIdToOmnetName(vehicleId.c_str());
            
            if (!omnetModuleName.empty()) {
                // 解析地址并发送命令
                L3Address destAddr = L3AddressResolver().resolve(omnetModuleName.c_str());
                
                if (!destAddr.isUnspecified()) {
                    EV_INFO << "【服务器】发送指令到 " << omnetModuleName << ", 地址: " << destAddr << endl;
                    std::cout << "【服务器】发送指令到 " << omnetModuleName << ", 地址: " << destAddr << endl;
                    
                    // 发送命令包
                    socket.sendTo(cmdPacket, destAddr, destPort);
                    
                    // 更新统计
                    numRelayedCommands++;
                    emit(parkingCommandRelayedSignal, (long)1);
                    
                    EV_INFO << "【服务器】指令发送成功" << endl;
                    std::cout << "【服务器】指令发送成功" << endl;
                } else {
                    EV_ERROR << "【服务器】无法解析模块 " << omnetModuleName << " 的地址" << endl;
                    std::cout << "【服务器】无法解析模块 " << omnetModuleName << " 的地址" << endl;
                    delete cmdPacket;
                }
            } else {
                EV_ERROR << "【服务器】无法将SUMO ID " << vehicleId << " 映射到OMNeT++模块" << endl;
                std::cout << "【服务器】无法将SUMO ID " << vehicleId << " 映射到OMNeT++模块" << endl;
                delete cmdPacket;
            }
        }
        else {
            EV_WARN << "【服务器】没有找到合适的停车场" << endl;
            std::cout << "【服务器】没有找到合适的停车场" << endl;
        }
    } catch (std::exception& e) {
        EV_ERROR << "【服务器】处理泊车请求时出错: " << e.what() << endl;
        std::cout << "【服务器】处理泊车请求时出错: " << e.what() << endl;
    }
}

ParkingAreaInfo* AutoParkingServerApp::findNearestParkingArea(double x, double y)
{
    if (parkingAreas.empty()) return nullptr;
    return parkingAreas[0];
}

ParkingAreaInfo* AutoParkingServerApp::findOptimalParkingArea(double x, double y)
{
    return findNearestParkingArea(x, y);
}

double AutoParkingServerApp::calculateDistance(double x1, double y1, double x2, double y2)
{
    return std::sqrt(std::pow(x2 - x1, 2) + std::pow(y2 - y1, 2));
}

Packet* AutoParkingServerApp::createParkingCommandPacket(const std::string& vehicleId,
                                                    const std::string& parkingAreaId,
                                                    double distanceToParking,
                                                    const std::string& currentLaneId,
                                                    const std::string& destinationLaneId)
{
    // 基本的包创建
    Packet* packet = new Packet("ParkingCommand");
    auto command = makeShared<AutoParkingPacket>();
    command->setMsgType(AP_PARKING_COMMAND);
    command->setVehicleId(vehicleId.c_str());
    command->setParkingAreaId(parkingAreaId.c_str());
    command->setDistanceToParking(distanceToParking);
    command->setLaneId(currentLaneId.c_str());
    command->setDestinationLaneId(destinationLaneId.c_str());
    command->setTimestamp(simTime().dbl());
    command->setChunkLength(B(par("messageLength").intValue()));
    packet->insertAtBack(command);
    return packet;
}

std::string AutoParkingServerApp::mapSumoIdToOmnetName(const char* sumoId)
{
    // 获取VeinsInetManager
    cModule* manager = getModuleByPath("<root>.veinsManager");
    if (!manager) {
        EV_ERROR << "【服务器】找不到veinsManager模块" << endl;
        std::cout << "【服务器】找不到veinsManager模块" << endl;
        return "";
    }
    
    // 获取映射表
    veins::TraCIScenarioManager* scenarioManager = dynamic_cast<veins::TraCIScenarioManager*>(manager);
    if (!scenarioManager) {
        EV_ERROR << "【服务器】veinsManager不是TraCIScenarioManager类型" << endl;
        std::cout << "【服务器】veinsManager不是TraCIScenarioManager类型" << endl;
        return "";
    }
    
    std::map<std::string, cModule*> managedHosts = scenarioManager->getManagedHosts();
    
    // 在映射表中查找对应的模块
    auto it = managedHosts.find(sumoId);
    if (it != managedHosts.end()) {
        cModule* module = it->second;
        std::string moduleName = module->getFullName();
        EV_INFO << "【服务器】找到SUMO ID " << sumoId << " 对应的模块 " << moduleName << endl;
        std::cout << "【服务器】找到SUMO ID " << sumoId << " 对应的模块 " << moduleName << endl;
        return moduleName;
    }
    
    EV_ERROR << "【服务器】找不到SUMO ID " << sumoId << " 对应的模块" << endl;
    std::cout << "【服务器】找不到SUMO ID " << sumoId << " 对应的模块" << endl;
    return "";
}

void AutoParkingServerApp::finish()
{
    UdpBasicApp::finish();
    
    // 记录统计信息
    recordScalar("numRelayedCommands", numRelayedCommands);
    
    EV_INFO << "AutoParkingServerApp relayed " << numRelayedCommands
           << " parking commands" << endl;
}