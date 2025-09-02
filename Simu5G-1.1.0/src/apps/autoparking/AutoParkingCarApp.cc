//
// 自动泊车车辆应用实现
//

#include <omnetpp.h>
#include <string>
#include "apps/autoparking/AutoParkingCarApp.h"
#include "inet/common/packet/Packet.h"
#include "inet/networklayer/common/L3AddressTag_m.h"
#include "inet/common/ModuleAccess.h"
#include "veins/modules/mobility/traci/TraCIColor.h"
#include "veins/modules/mobility/traci/TraCIMobility.h"
#include "veins_inet/VeinsInetMobility.h"
#include <iostream>

using namespace inet;

Define_Module(AutoParkingCarApp);

// 移除这些静态注册，因为信号现在是实例成员
// simsignal_t AutoParkingCarApp::parkingCommandReceivedSignal = registerSignal("parkingCommandReceived");
// simsignal_t AutoParkingCarApp::parkingCompletedSignal = registerSignal("parkingCompleted");
// simsignal_t AutoParkingCarApp::endToEndDelaySignal = registerSignal("endToEndDelay");

AutoParkingCarApp::AutoParkingCarApp() :
    UdpSink(),
    smoothParking(true),
    responseTime(1.0),
    maxWaitingTime(300.0),
    parkingState(NOT_PARKING),
    targetParkingAreaId(""),
    targetLaneId(""),
    parkingTimer(nullptr),
    traci(nullptr),
    numReceivedCommands(0),
    numExecutedCommands(0),
    parkingCommandReceivedSignal(SIMSIGNAL_NULL),
    parkingCompletedSignal(SIMSIGNAL_NULL),
    endToEndDelaySignal(SIMSIGNAL_NULL)
{
}

AutoParkingCarApp::~AutoParkingCarApp()
{
    cancelAndDelete(parkingTimer);
}

void AutoParkingCarApp::initialize(int stage)
{
    if (stage == INITSTAGE_LOCAL) {
        // 注册信号
        parkingCommandReceivedSignal = registerSignal("parkingCommandReceived");
        parkingCompletedSignal = registerSignal("parkingCompleted");
        endToEndDelaySignal = registerSignal("endToEndDelay");

        // 初始化参数
        smoothParking = par("smoothParking");
        responseTime = par("responseTime");
        maxWaitingTime = par("maxWaitingTime");
        
        // 计算并设置唯一本地端口，供基类在 APPLICATION_LAYER 阶段绑定
        int basePort = par("localPort");
        int uniquePort = basePort + getParentModule()->getId();
        par("localPort").setIntValue(uniquePort);
        std::cout << getFullPath() << ": LOCAL 阶段设置唯一本地端口为 " << uniquePort << std::endl;
        
        // 初始化状态
        parkingState = NOT_PARKING;
        targetParkingAreaId = "";
        targetLaneId = "";
        numReceivedCommands = 0;
        numExecutedCommands = 0;

        // 创建定时器
        parkingTimer = new cMessage("parkingTimer");

        std::cout << getFullPath() << ": AutoParkingCarApp LOCAL 初始化完成" << std::endl;
    }

    // 基类初始化放在参数设置之后执行，确保其读取到已更新的端口参数
    UdpSink::initialize(stage);

    if (stage == INITSTAGE_APPLICATION_LAYER) {
        // 端口绑定由基类完成，这里打印确认最终端口
        int finalPort = par("localPort");
        std::cout << getFullPath() << ": APPLICATION_LAYER 已由基类绑定端口: " << finalPort << std::endl;
    }
}

void AutoParkingCarApp::handleMessage(cMessage *msg)
{
    std::cout << "AutoParkingCarApp::handleMessage: " << msg->getName() << endl;
    
    if (msg == parkingTimer) {
        std::cout << "收到泊车定时器消息，执行泊车操作" << endl;
        executeParkingOperation();
    }
    else {
        UdpSink::handleMessage(msg);
    }
}

void AutoParkingCarApp::processPacket(Packet *packet)
{
    // 添加调试信息（放在基类处理之前，避免基类删除数据包）
    std::cout << "\n收到数据包: " << packet->getName() << ", 大小: " << packet->getByteLength() << " 字节" << endl;
    std::cout << "数据包详情: " << packet->str() << endl;

    // 尝试获取源地址和目的地址
    try {
        auto addressInd = packet->findTag<L3AddressInd>();
        if (addressInd) {
            std::cout << "数据包来源: " << addressInd->getSrcAddress().str() << endl;
            std::cout << "数据包目的地: " << addressInd->getDestAddress().str() << endl;
        } else {
            std::cout << "数据包没有 L3AddressInd 标签" << endl;
        }
    } catch (const std::exception& e) {
        std::cout << "获取地址标签时出错: " << e.what() << endl;
    }
    
    // 提取泊车指令
    try {
        auto chunk = packet->peekAtFront<Chunk>();
        if (chunk) {
            std::cout << "数据包内容类型: " << chunk->getClassName() << endl;

            auto parkingCmd = dynamicPtrCast<const AutoParkingPacket>(chunk);
        if (parkingCmd) {
                std::cout << "成功解析为 AutoParkingPacket，处理泊车指令..." << endl;
            processParkingCommand(parkingCmd.get(), packet->getArrivalTime());
            }
            else {
                std::cout << "动态转换失败，尝试使用 peekAtFront<AutoParkingPacket>()..." << endl;
                auto packetDup = packet->dup();
                packetDup->removeAtFront<Chunk>();
                auto parkingData = packetDup->peekAtFront<AutoParkingPacket>();
                if (parkingData) {
                    std::cout << "成功解析为 AutoParkingPacket (方法2)" << endl;
                    processParkingCommand(parkingData.get(), packet->getArrivalTime());
                    delete packetDup;
                }
                else {
                    delete packetDup;
                    std::cout << "尝试方法3: 直接从数据包中提取 AutoParkingPacket..." << endl;
                    auto data = packet->peekData<AutoParkingPacket>();
                    if (data) {
                        std::cout << "成功解析为 AutoParkingPacket (方法3)" << endl;
                        processParkingCommand(data.get(), packet->getArrivalTime());
        }
        else {
            EV_WARN << "Received packet is not a AutoParkingPacket" << endl;
                        std::cout << "收到的数据包不是 AutoParkingPacket" << endl;
                        std::cout << "数据包头部信息: 长度=" << packet->getBitLength() << "bits, 到达时间=" 
                                  << packet->getArrivalTime() << ", 创建时间=" << packet->getCreationTime() << endl;
                    }
                }
            }
        } else {
            std::cout << "无法获取数据包内容" << endl;
        }
    }
    catch (std::exception& e) {
        EV_WARN << "Could not process packet: " << e.what() << endl;
        std::cout << "处理数据包时出错: " << e.what() << endl;
    }

    // 最后调用基类进行统计和删除数据包
    UdpSink::processPacket(packet);
}

// 修改processParkingCommand函数，增强日志输出并确保命令执行成功
void AutoParkingCarApp::processParkingCommand(const AutoParkingPacket* cmd, simtime_t arrivalTime)
{
    EV << "收到泊车指令，开始处理..." << endl;
    std::cout << "收到泊车指令，开始处理..." << endl;
    
    // 获取命令详情
    std::string targetVehicleId = cmd->getVehicleId();
    std::string parkingAreaId = cmd->getParkingAreaId();
    double distanceToParking = cmd->getDistanceToParking();
    std::string laneId = cmd->getLaneId() ? cmd->getLaneId() : "";
    std::string destLaneId = cmd->getDestinationLaneId() ? cmd->getDestinationLaneId() : "";
    
    std::cout << "命令详情: 目标车辆=" << targetVehicleId 
              << ", 停车场=" << parkingAreaId 
              << ", 距离=" << distanceToParking 
              << ", 当前车道=" << laneId
              << ", 目标车道=" << destLaneId << endl;
    
    // 检查命令是否针对本车辆
    std::string myId = getParentModule()->getFullName();
    
    // 获取SUMO ID
    std::string mySumoId;
    auto mobility = dynamic_cast<veins::VeinsInetMobility*>(getParentModule()->getSubmodule("mobility"));
    if (mobility) {
        mySumoId = mobility->getExternalId();
        std::cout << "命令目标车辆ID: " << targetVehicleId << ", 本车辆ID: " << myId << ", SUMO ID: " << mySumoId << endl;
    } else {
        std::cout << "命令目标车辆ID: " << targetVehicleId << ", 本车辆ID: " << myId << ", 无法获取SUMO ID" << endl;
    }
    
    // 如果不是针对本车辆的命令，忽略
    // 匹配模块名称或SUMO ID
    bool isForMe = (targetVehicleId == myId || targetVehicleId == mySumoId);
    
    // 如果车辆ID以数字开头，可能是OMNeT++自动生成的名称，尝试匹配后缀
    if (!isForMe && mySumoId.length() > 0 && targetVehicleId.length() > 0) {
        // 尝试匹配后缀，例如 "flow_high_3.0" 与 "3"
        std::string::size_type pos = mySumoId.find_last_of("_.");
        if (pos != std::string::npos) {
            std::string suffix = mySumoId.substr(pos + 1);
            if (targetVehicleId.find(suffix) != std::string::npos) {
                isForMe = true;
                std::cout << "通过后缀匹配: 目标车辆ID包含本车辆ID的后缀 " << suffix << endl;
            }
        }
    }
    
    if (!isForMe) {
        EV_WARN << "收到的泊车指令不是针对本车辆的，忽略" << endl;
        std::cout << "收到的泊车指令不是针对本车辆的，忽略" << endl;
        return;
    }
    
    std::cout << "确认泊车指令是针对本车辆的，继续处理" << endl;
    
    // 计算延迟
    simtime_t timestamp = cmd->getTimestamp();
    simtime_t now = simTime();
    simtime_t delay = now - timestamp;
    
    EV << "命令时间戳: " << timestamp << ", 当前时间: " << now << ", 延迟: " << delay << "s" << endl;
    std::cout << "命令时间戳: " << timestamp << ", 当前时间: " << now << ", 延迟: " << delay << "s" << endl;
    
    // 记录统计信息
    numReceivedCommands++;
    emit(parkingCommandReceivedSignal, 1);
    emit(endToEndDelaySignal, delay);
    
    // 如果已经在泊车，忽略重复命令
    if (parkingState != NOT_PARKING) {
        EV_WARN << "车辆已经在泊车过程中，忽略重复命令" << endl;
        std::cout << "车辆已经在泊车过程中，忽略重复命令" << endl;
        return;
    }
    
    // 设置泊车目标
    targetParkingAreaId = parkingAreaId;
    if (!destLaneId.empty()) {
        targetLaneId = destLaneId;
    } else if (!laneId.empty()) {
        targetLaneId = laneId;
    }
    
    std::cout << "设置泊车目标: 停车场=" << targetParkingAreaId << ", 目标车道=" << targetLaneId << endl;
    
    // 尝试获取TraCI接口
    if (!getTraCIInterface()) {
        EV_ERROR << "无法获取TraCI接口，泊车操作失败" << endl;
        std::cout << "无法获取TraCI接口，泊车操作失败" << endl;
        return;
    }
    
    // 获取车辆在SUMO中的ID
    std::string sumoVehicleId;
    if (mobility) {
        sumoVehicleId = mobility->getExternalId();
        EV << "成功获取自身SUMO ID: " << sumoVehicleId << endl;
        std::cout << "成功获取自身SUMO ID: " << sumoVehicleId << endl;
    }
    else {
        EV_ERROR << "无法获取VeinsInetMobility模块，无法确定SUMO ID" << endl;
        std::cout << "无法获取VeinsInetMobility模块，无法确定SUMO ID" << endl;
        return;
    }
    
    try {
        // 获取车辆对象
        auto vehicle = traci->vehicle(sumoVehicleId);
        
        // 设置车辆颜色为白色，表示已收到泊车指令
        vehicle.setColor(veins::TraCIColor(255, 255, 255, 255));
        EV << "已将车辆颜色改为白色，表示已收到泊车指令" << endl;
        std::cout << "已将车辆颜色改为白色，表示已收到泊车指令" << endl;
        
        // 更新状态
        parkingState = DRIVING_TO_PARKING;
        
        // 调度泊车操作
        scheduleAt(simTime() + 0.1, parkingTimer);
        
        EV << "泊车指令处理成功，已调度泊车操作" << endl;
        std::cout << "泊车指令处理成功，已调度泊车操作" << endl;
    }
    catch (const std::exception& e) {
        EV_ERROR << "处理泊车指令时出错: " << e.what() << endl;
        std::cout << "处理泊车指令时出错: " << e.what() << endl;
    }
}

bool AutoParkingCarApp::getTraCIInterface()
{
    if (traci) {
        return true; // 已经有TraCI接口
    }
    
    std::cout << "AutoParkingCarApp::getTraCIInterface: 尝试获取TraCI接口..." << endl;
    
    // 尝试获取TraCIScenarioManager
    cModule* manager = getModuleByPath("<root>.veinsManager");
    if (!manager) {
        std::cout << "AutoParkingCarApp::getTraCIInterface: 无法找到veinsManager模块" << endl;
        return false;
    }
    
    // 尝试转换为TraCIScenarioManager
    auto scenarioManager = dynamic_cast<veins::TraCIScenarioManager*>(manager);
    if (!scenarioManager) {
        std::cout << "AutoParkingCarApp::getTraCIInterface: veinsManager不是TraCIScenarioManager类型" << endl;
        return false;
    }
    
    // 检查连接状态
    if (!scenarioManager->isConnected()) {
        std::cout << "AutoParkingCarApp::getTraCIInterface: TraCIScenarioManager未连接到SUMO" << endl;
        return false;
    }
    
    // 获取命令接口
    traci = scenarioManager->getCommandInterface();
    if (!traci) {
        std::cout << "AutoParkingCarApp::getTraCIInterface: 无法获取TraCI命令接口" << endl;
        return false;
    }
    
    std::cout << "AutoParkingCarApp::getTraCIInterface: 成功获取TraCI接口" << endl;
    return true;
}

void AutoParkingCarApp::executeParkingOperation()
{
    std::cout << "执行泊车操作，当前状态: " << getParkingStateName() << endl;
    
    // 检查TraCI接口是否可用
    if (!getTraCIInterface()) {
        EV_ERROR << "无法获取TraCI接口，泊车操作失败" << endl;
        std::cout << "无法获取TraCI接口，泊车操作失败" << endl;
        return;
    }
    
    // 获取车辆在SUMO中的ID
    std::string sumoVehicleId;
    auto mobility = dynamic_cast<veins::VeinsInetMobility*>(getParentModule()->getSubmodule("mobility"));
    if (mobility) {
        sumoVehicleId = mobility->getExternalId();
        std::cout << "获取到车辆SUMO ID: " << sumoVehicleId << endl;
                }
                else {
        EV_ERROR << "无法获取VeinsInetMobility模块，无法确定SUMO ID" << endl;
        std::cout << "无法获取VeinsInetMobility模块，无法确定SUMO ID" << endl;
        return;
    }
    
    try {
        // 获取车辆对象
        auto vehicle = traci->vehicle(sumoVehicleId);
        
        // 根据当前状态执行不同操作
        switch (parkingState) {
            case DRIVING_TO_PARKING: {
                std::cout << "状态: 驾驶前往停车场，执行driveToParking()..." << endl;
                driveToParking();
            
                // 更新状态为泊车中
            parkingState = PARKING;
            
                // 调度下一次检查
                scheduleAt(simTime() + 1.0, parkingTimer);
            break;
        }
        
        case PARKING: {
                std::cout << "状态: 正在泊车..." << endl;
                
                // 获取当前位置和速度
                std::string currentLaneId = vehicle.getLaneId();
                double currentSpeed = vehicle.getSpeed();
                double lanePosition = vehicle.getLanePosition();
                
                std::cout << "当前车道: " << currentLaneId << ", 位置: " << lanePosition << ", 速度: " << currentSpeed << endl;
                
                // 检查是否已到达目标位置
                bool arrived = false;
                
                // 如果有目标车道，检查是否在目标车道上
                if (!targetLaneId.empty()) {
                    if (currentLaneId.find(targetLaneId) != std::string::npos) {
                        arrived = true;
                        std::cout << "已到达目标车道: " << targetLaneId << endl;
                    }
                }
                
                // 如果没有目标车道或者已经在目标车道上，检查速度
                if (arrived || targetLaneId.empty()) {
                    if (currentSpeed < 0.5) {  // 速度很低，认为已经停下
                        arrived = true;
                        std::cout << "车辆速度已降至 " << currentSpeed << "，认为已停车" << endl;
                    }
                }
                
                if (arrived) {
                    // 完全停车
                vehicle.setSpeed(0.0);
                
                    // 设置车辆颜色为绿色，表示已完成泊车
                    vehicle.setColor(veins::TraCIColor(0, 255, 0, 255));
                    std::cout << "已将车辆颜色设置为绿色，表示完成泊车" << endl;
                    
                    // 更新状态
                    parkingState = PARKED;
                    
                    // 记录统计信息
                    numExecutedCommands++;
                    emit(parkingCompletedSignal, 1);
                    
                    // 调度等待时间结束
                    scheduleAt(simTime() + maxWaitingTime, parkingTimer);
                    std::cout << "泊车完成，将在 " << maxWaitingTime << " 秒后恢复行驶" << endl;
                }
                else {
                    // 继续减速
                    if (smoothParking) {
                        double targetSpeed = 1.0;  // 目标低速
                        double responseTime = 2.0; // 响应时间
                        vehicle.slowDown(targetSpeed, responseTime);
                        std::cout << "继续减速至 " << targetSpeed << " m/s，响应时间: " << responseTime << " 秒" << endl;
                    }
                    else {
                        vehicle.setSpeed(1.0);
                        std::cout << "设置车速为 1.0 m/s" << endl;
                    }
                    
                    // 调度下一次检查
                    scheduleAt(simTime() + 1.0, parkingTimer);
            }
            break;
        }
        
            case PARKED: {
                std::cout << "状态: 已泊车，等待时间结束..." << endl;
                
                // 恢复正常行驶
            parkingState = NOT_PARKING;
                
                // 设置车辆颜色为默认颜色
                vehicle.setColor(veins::TraCIColor(255, 255, 255, 255));
                std::cout << "泊车等待时间结束，恢复正常行驶" << endl;
            break;
            }
            
            default:
                // 不应该到达这里
                EV_WARN << "未知的泊车状态: " << parkingState << endl;
                std::cout << "未知的泊车状态: " << parkingState << endl;
            break;
    }
    }
    catch (const std::exception& e) {
        EV_ERROR << "执行泊车操作时出错: " << e.what() << endl;
        std::cout << "执行泊车操作时出错: " << e.what() << endl;
    }
}

void AutoParkingCarApp::driveToParking()
{
    std::cout << "开始导航至停车场: " << targetParkingAreaId << endl;
    
    // 检查TraCI接口是否可用
    if (!getTraCIInterface()) {
        EV_ERROR << "无法获取TraCI接口，无法导航至停车场" << endl;
        std::cout << "无法获取TraCI接口，无法导航至停车场" << endl;
        return;
    }
    
    // 获取车辆在SUMO中的ID
    std::string sumoVehicleId;
    auto mobility = dynamic_cast<veins::VeinsInetMobility*>(getParentModule()->getSubmodule("mobility"));
    if (mobility) {
        sumoVehicleId = mobility->getExternalId();
        std::cout << "获取到车辆SUMO ID: " << sumoVehicleId << endl;
    }
    else {
        EV_ERROR << "无法获取VeinsInetMobility模块，无法确定SUMO ID" << endl;
        std::cout << "无法获取VeinsInetMobility模块，无法确定SUMO ID" << endl;
        return;
    }
    
    try {
        // 获取车辆对象
        auto vehicle = traci->vehicle(sumoVehicleId);
        
        // 设置车辆颜色为黄色，表示正在前往停车场
        vehicle.setColor(veins::TraCIColor(255, 255, 0, 255));
        std::cout << "已将车辆颜色设置为黄色，表示正在前往停车场" << endl;
        
        // 获取当前位置和车道
        std::string currentLaneId = vehicle.getLaneId();
        double currentSpeed = vehicle.getSpeed();
        
        std::cout << "车辆当前状态: 车道=" << currentLaneId << ", 速度=" << currentSpeed << endl;
        
        // 如果有目标车道，优先使用目标车道
        if (!targetLaneId.empty()) {
            std::string targetEdgeId = targetLaneId;
            size_t last_underscore = targetLaneId.find_last_of('_');
            if (last_underscore != std::string::npos) {
                targetEdgeId = targetLaneId.substr(0, last_underscore);
            }
            std::cout << "使用目标车道导航: " << targetLaneId << ", 提取的目标边缘: " << targetEdgeId << endl;
            vehicle.changeTarget(targetEdgeId.c_str());
        }
        // 否则使用停车场ID作为目标
        else if (!targetParkingAreaId.empty()) {
            std::cout << "使用停车场ID导航: " << targetParkingAreaId << endl;
            vehicle.changeTarget(targetParkingAreaId.c_str());
        }
        else {
            std::cout << "没有目标车道或停车场ID，无法导航" << endl;
            return;
        }
        
        // 如果启用平滑泊车，逐渐减速
        if (smoothParking) {
            double targetSpeed = 2.0;  // 目标低速
            double responseTime = 5.0; // 响应时间
            vehicle.slowDown(targetSpeed, responseTime);
            std::cout << "开始减速至 " << targetSpeed << " m/s，响应时间: " << responseTime << " 秒" << endl;
        }
        
        std::cout << "导航指令已发送，车辆正在前往停车场" << endl;
    }
    catch (const std::exception& e) {
        EV_ERROR << "导航至停车场时出错: " << e.what() << endl;
        std::cout << "导航至停车场时出错: " << e.what() << endl;
    }
}

void AutoParkingCarApp::finishParking()
{
    // 获取SUMO ID
    cModule* mobilityModule = getParentModule()->getSubmodule("mobility");
    if (!mobilityModule) {
        EV_ERROR << "找不到mobility模块" << endl;
        return;
    }
    veins::TraCIMobility* mobility = check_and_cast<veins::TraCIMobility*>(mobilityModule);
    if (!mobility) {
        EV_ERROR << "mobility模块类型不正确" << endl;
        return;
    }
    std::string sumoId = mobility->getExternalId();

    if (sumoId.empty()) {
        EV_ERROR << "无法获取SUMO ID，无法完成泊车" << endl;
        return;
    }

    // 获取车辆的TraCI接口
    auto vehicle = traci->vehicle(sumoId);

    // 强制将车速设置为0，确保车辆停止
    vehicle.setSpeed(0);
    std::cout << "已命令车辆 " << sumoId << " 速度设置为0" << endl;

    // 改变车辆颜色为绿色，表示已泊车
    vehicle.setColor(veins::TraCIColor(0, 255, 0, 255));
    std::cout << "已将车辆颜色设置为绿色，表示泊车完成" << endl;

    // 使用setParking命令使车辆在当前位置附近的停车场停车
    vehicle.setParking();
    std::cout << "已命令车辆 " << sumoId << " 在当前位置附近寻找停车场泊车" << endl;

    // 更新状态
    parkingState = PARKED;
    EV_INFO << "泊车完成，当前状态: " << getParkingStateName() << endl;

    // 发送泊车完成信号
    emit(parkingCompletedSignal, true);
    numExecutedCommands++;
}

// 新增：直接执行停车的公共方法（用于调试）
// 删除 directStopVehicle 函数的实现

void AutoParkingCarApp::finish()
{
    UdpSink::finish();
    
    // 记录统计信息
    recordScalar("receivedCommands", numReceivedCommands);
    recordScalar("executedParkings", numExecutedCommands);
    
    EV_INFO << "AutoParkingCarApp received " << numReceivedCommands
           << " parking commands and executed " << numExecutedCommands
           << " parking operations" << endl;
} 

const char* AutoParkingCarApp::getParkingStateName() const
{
    switch (parkingState) {
        case NOT_PARKING:
            return "NOT_PARKING";
        case DRIVING_TO_PARKING:
            return "DRIVING_TO_PARKING";
        case PARKING:
            return "PARKING";
        case PARKED:
            return "PARKED";
        default:
            return "UNKNOWN";
    }
} 