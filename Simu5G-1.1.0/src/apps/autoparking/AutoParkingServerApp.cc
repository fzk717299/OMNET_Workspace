//
// 自动泊车服务器应用实现
//

#include "AutoParkingServerApp.h"
#include "inet/common/ModuleAccess.h"
#include "inet/common/TimeTag_m.h"
#include "inet/common/packet/chunk/ByteCountChunk.h"

// XML解析
#include <fstream>
#include <sstream>
#include <cmath>
#include "inet/common/XMLUtils.h"

using namespace inet::xmlutils;

Define_Module(AutoParkingServerApp);

simsignal_t AutoParkingServerApp::parkingCommandRelayedSignal = registerSignal("parkingCommandRelayed");

AutoParkingServerApp::AutoParkingServerApp() :
    processingDelay(0.05),
    parkingAssignmentStrategy("nearest"),
    parkingAreasFile("parkingAreas.xml"),
    numRelayedCommands(0)
{
}

AutoParkingServerApp::~AutoParkingServerApp()
{
    // 清理处理队列中的所有消息
    for (auto& entry : processingQueue) {
        cancelAndDelete(entry.second);
    }
    processingQueue.clear();
}

void AutoParkingServerApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        // 读取参数
        processingDelay = par("processingDelay").doubleValue();
        parkingAssignmentStrategy = par("parkingAssignmentStrategy").stringValue();
        parkingAreasFile = par("parkingAreasFile").stringValue();
        
        // 加载停车区域数据
        loadParkingAreas();
        
        EV_INFO << "AutoParkingServerApp initialized with strategy: " << parkingAssignmentStrategy
                << ", loaded " << parkingAreas.size() << " parking areas" << endl;
    }
}

void AutoParkingServerApp::loadParkingAreas()
{
    try {
        // 打开XML文件
        cXMLElement* root = getEnvir()->getXMLDocument(parkingAreasFile.c_str());
        if (!root) {
            throw cRuntimeError("Could not parse parking areas XML file: %s", parkingAreasFile.c_str());
        }
        
        // 遍历所有parkingArea元素
        cXMLElementList areaNodes = root->getChildrenByTagName("parkingArea");
        for (cXMLElement* areaNode : areaNodes) {
            ParkingAreaInfo area;
            
            // 读取属性
            area.id = areaNode->getAttribute("id");
            
            // 解析类型
            std::string typeStr = areaNode->getAttribute("type");
            if (typeStr == "ROADSIDE") area.type = "ROADSIDE";
            else if (typeStr == "LOT") area.type = "LOT";
            else if (typeStr == "GARAGE") area.type = "GARAGE";
            else area.type = "ROADSIDE"; // 默认为路边停车
            
            area.x = atof(areaNode->getAttribute("x"));
            area.y = atof(areaNode->getAttribute("y"));
            area.capacity = atoi(areaNode->getAttribute("capacity"));
            area.occupied = atoi(areaNode->getAttribute("occupied"));
            
            // 优先级是可选属性
            const char* priorityStr = areaNode->getAttribute("priority");
            area.priority = priorityStr ? atoi(priorityStr) : 1;

            // 解析lane属性
            area.laneId = areaNode->getAttribute("lane");
            
            parkingAreas.push_back(area);
            
            EV_INFO << "Loaded parking area: id=" << area.id
                   << ", type=" << area.type
                   << ", position=(" << area.x << "," << area.y << ")"
                   << ", capacity=" << area.capacity
                   << ", occupied=" << area.occupied
                   << ", priority=" << area.priority << endl;
        }
        
        delete root;
    }
    catch (std::exception& e) {
        EV_ERROR << "Error loading parking areas: " << e.what() << endl;
    }
}

void AutoParkingServerApp::handleMessageWhenUp(cMessage *msg)
{
    // 检查是否是延迟处理的消息
    auto it = processingQueue.begin();
    while (it != processingQueue.end()) {
        if (it->second == msg) {
            handleDelayedMessage(msg);
            processingQueue.erase(it);
            return;
        }
        ++it;
    }
    
    // 不是处理队列中的消息，调用父类处理
    UdpBasicApp::handleMessageWhenUp(msg);
}

void AutoParkingServerApp::socketDataArrived(UdpSocket *socket, Packet *packet)
{
    // 处理收到的数据包
    processReceivedPacket(packet);
    
    // 不要删除数据包，会在处理完成后删除
    // 不调用父类方法，因为我们要自己处理数据包
}

void AutoParkingServerApp::processReceivedPacket(Packet *packet)
{
    EV_INFO << "Received packet: " << packet->getName() << endl;
    
    try {
        // 模拟处理延迟
        std::string packetId = std::string(packet->getName()) + "-" + std::to_string(packet->getId());
        cMessage *processMsg = new cMessage(("process-" + packetId).c_str());
        processMsg->setContextPointer(packet);
        
        // 将消息和处理定时器放入队列
        processingQueue[packetId] = processMsg;
        
        // 调度延迟处理
        scheduleAt(simTime() + processingDelay, processMsg);
        
        EV_INFO << "Scheduled processing of packet " << packetId
                << " with delay " << processingDelay << "s" << endl;
    }
    catch (std::exception& e) {
        EV_ERROR << "Error processing received packet: " << e.what() << endl;
        delete packet;  // 出错时删除数据包
    }
}

void AutoParkingServerApp::handleDelayedMessage(cMessage *msg)
{
    // 从上下文获取原始数据包
    Packet *packet = static_cast<Packet*>(msg->getContextPointer());
    
    if (packet) {
        // 处理泊车请求
        processParkingRequest(packet);
        delete packet;
    }
    
    delete msg;  // 删除定时器消息
}

void AutoParkingServerApp::processParkingRequest(Packet *packet)
{
    try {
        // 提取泊车请求数据
        auto parkingRequest = packet->peekAtFront<AutoParkingPacket>();
        if (!parkingRequest) {
            EV_ERROR << "Received packet is not a AutoParkingPacket" << endl;
            return;
        }
        
        // 提取请求信息
        std::string vehicleId = parkingRequest->getVehicleId();
        double posX = parkingRequest->getPosX();
        double posY = parkingRequest->getPosY();
        
        EV_INFO << "Processing parking request for vehicle " << vehicleId
               << " at position (" << posX << "," << posY << ")" << endl;
        
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
            parkingArea->occupied++;
            
            // 计算距离
            double distance = calculateDistance(posX, posY, parkingArea->x, parkingArea->y);
            
            // 创建泊车指令
            ParkingAreaType parkingType = ROADSIDE; // 默认为路边停车
            if (parkingArea->type == "LOT") parkingType = LOT;
            else if (parkingArea->type == "GARAGE") parkingType = GARAGE;
            
            Packet* command = createParkingCommandPacket(
                vehicleId,
                parkingArea->id,
                parkingType,
                parkingArea->x,
                parkingArea->y,
                distance,
                parkingArea->laneId // 传递laneId
            );
            
            // 发送给车辆
            L3Address destAddress = L3AddressResolver().resolve(vehicleId.c_str());
            socket.sendTo(command, destAddress, destPort);
            numRelayedCommands++;
            emit(parkingCommandRelayedSignal, (long)1);
            
            EV_INFO << "Sent parking command for vehicle " << vehicleId
                   << " to parking area " << parkingArea->id
                   << " at (" << parkingArea->x << "," << parkingArea->y << ")"
                   << ", distance: " << distance << "m"
                   << ", occupied: " << parkingArea->occupied << "/" << parkingArea->capacity
                   << endl;
        }
        else {
            EV_WARN << "No suitable parking area found for vehicle " << vehicleId << endl;
        }
    }
    catch (std::exception& e) {
        EV_ERROR << "Error processing parking request: " << e.what() << endl;
    }
}

ParkingAreaInfo* AutoParkingServerApp::findNearestParkingArea(double x, double y)
{
    ParkingAreaInfo* nearest = nullptr;
    double minDistance = std::numeric_limits<double>::max();
    
    for (auto& area : parkingAreas) {
        // 检查是否有空位
        if (area.occupied < area.capacity) {
            double distance = calculateDistance(x, y, area.x, area.y);
            if (distance < minDistance) {
                minDistance = distance;
                nearest = &area;
            }
        }
    }
    
    return nearest;
}

ParkingAreaInfo* AutoParkingServerApp::findOptimalParkingArea(double x, double y)
{
    // 这个算法考虑距离、容量和优先级
    ParkingAreaInfo* optimal = nullptr;
    double bestScore = -1;
    
    for (auto& area : parkingAreas) {
        // 检查是否有空位
        if (area.occupied < area.capacity) {
            double distance = calculateDistance(x, y, area.x, area.y);
            double occupancyRatio = (double)area.occupied / area.capacity;
            
            // 计算得分：优先级越高、距离越近、占用率越低，得分越高
            double score = area.priority * (1000.0 / (distance + 1.0)) * (1.0 - occupancyRatio);
            
            if (score > bestScore) {
                bestScore = score;
                optimal = &area;
            }
        }
    }
    
    return optimal;
}

double AutoParkingServerApp::calculateDistance(double x1, double y1, double x2, double y2)
{
    return std::sqrt(std::pow(x2 - x1, 2) + std::pow(y2 - y1, 2));
}

Packet* AutoParkingServerApp::createParkingCommandPacket(const std::string& vehicleId,
                                                    const std::string& parkingAreaId,
                                                    ParkingAreaType parkingType,
                                                    double posX, double posY,
                                                    double distanceToParking,
                                                    const std::string& laneId) // 新增laneId参数
{
    B payloadLength = B(par("messageLength"));
    
    // 创建一个新的数据包
    Packet *packet = new Packet("parkingCommand");
    const auto& payload = makeShared<AutoParkingPacket>();
    
    // 设置数据包内容
    payload->setVehicleId(vehicleId.c_str());
    payload->setParkingAreaId(parkingAreaId.c_str());
    payload->setDestinationLaneId(laneId.c_str()); // 新增：设置目标车道ID
    payload->setPosX(posX);
    payload->setPosY(posY);
    payload->setTimestamp(simTime().dbl());
    payload->setDistanceToParking(distanceToParking);
    payload->setParkingType(parkingType);
    
    // 设置数据块长度并插入payload
    payload->setChunkLength(payloadLength);
    payload->addTag<CreationTimeTag>()->setCreationTime(simTime());
    packet->insertAtBack(payload);
    
    return packet;
}

void AutoParkingServerApp::finish()
{
    UdpBasicApp::finish();
    
    // 记录统计信息
    recordScalar("numRelayedCommands", numRelayedCommands);
    
    EV_INFO << "AutoParkingServerApp relayed " << numRelayedCommands
           << " parking commands" << endl;
           
    // 记录停车区域使用情况
    int i = 0;
    for (const auto& area : parkingAreas) {
        std::string scalarName = "parkingArea_" + std::to_string(i) + "_occupancy";
        recordScalar(scalarName.c_str(), (double)area.occupied / area.capacity);
        i++;
    }
} 