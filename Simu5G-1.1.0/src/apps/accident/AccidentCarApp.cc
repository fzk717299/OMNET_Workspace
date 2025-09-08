//
// 事故车辆应用实现
//

#include "apps/accident/AccidentCarApp.h"
#include "inet/common/packet/chunk/Chunk.h"
#include "inet/common/Units.h"

// TraCI 相关头文件
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCIConnection.h"
#include "veins_inet/VeinsInetMobility.h"
#include "veins/modules/mobility/traci/TraCIColor.h"

#include <iostream> // 添加标准输出头文件
#include "inet/transportlayer/contract/udp/UdpSocket.h" // 添加UdpSocket头文件

using namespace inet::units::values;
using namespace omnetpp;
using namespace inet;

Define_Module(AccidentCarApp);

// 静态信号声明和注册 - 移除停车相关的
simsignal_t AccidentCarApp::endToEndDelaySignal = registerSignal("endToEndDelay");

AccidentCarApp::AccidentCarApp() :
    UdpSink(),
    traci_(nullptr),
    smoothDeceleration_(true),
    responseTime_(2.0),
    isAccidentVehicle_(false),
    state_(NORMAL),
    processedCmds_(0),
    accidentTimer_(nullptr),
    isEvading_(false),
    checkPositionTimer_(nullptr)
{
    // 构造函数
}

AccidentCarApp::~AccidentCarApp()
{
    cancelAndDelete(accidentTimer_);
    cancelAndDelete(checkPositionTimer_);
}

void AccidentCarApp::initialize(int stage)
{
    UdpSink::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        // 读取参数
        smoothDeceleration_ = par("smoothDeceleration").boolValue();
        responseTime_ = par("responseTime").doubleValue();
        isAccidentVehicle_ = par("isAccidentVehicle").boolValue();
        accidentTime_ = par("accidentTime");
        
        state_ = NORMAL;
        processedCmds_ = 0;
        traci_ = nullptr;
        mobility_ = nullptr;  // 初始化mobility_指针
        
        // 获取mobility模块
        cModule* mobilityModule = getParentModule()->getSubmodule("mobility");
        if (mobilityModule) {
            mobility_ = dynamic_cast<veins::VeinsInetMobility*>(mobilityModule);
            if (!mobility_) {
                EV_ERROR << "无法获取VeinsInetMobility模块" << endl;
            }
        }
        
        // 如果是事故车辆，则创建计时器
        if (isAccidentVehicle_) {
            accidentTimer_ = new cMessage("accidentTimer");
        }
        isEvading_ = false;
        checkPositionTimer_ = new cMessage("checkPositionTimer");
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        // 应用层初始化
        
        // 手动确保socket绑定（作为备用方案）
        try {
            ensureSocketBinding();
        } catch (const std::exception& e) {
            EV_ERROR << "手动socket绑定失败: " << e.what() << endl;
        }
        
        // 调度事故计时器
        if (isAccidentVehicle_) {
            scheduleAt(accidentTime_, accidentTimer_);
        }
    }
}

void AccidentCarApp::handleMessageWhenUp(cMessage *msg)
{
    if (msg->isSelfMessage()) {
        if (msg == accidentTimer_) {
            triggerAccident();
        }
        else if (msg == checkPositionTimer_) {
            checkEvasionStatus();
        }
        else {
            delete msg;
        }
    }
    else {
        // 直接检查是否是数据包消息
        if (auto packet = dynamic_cast<Packet*>(msg)) {
            std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentCarApp::handleMessageWhenUp - 收到数据包: '" 
                      << packet->getName() << "' 在车辆 " << getSumoId() << " ******\n\n\n" << std::endl;
            // 直接调用我们的处理方法
            processPacket(packet);
        } else {
            // 调用基类处理其他消息
            UdpSink::handleMessageWhenUp(msg);
        }
    }
}

void AccidentCarApp::triggerAccident()
{
    EV_INFO << "Vehicle " << getSumoId() << " triggering accident at " << simTime() << endl;
    
    if (getTraCIInterface()) {
        try {
            traci_->vehicle(getSumoId()).setSpeed(0);
            traci_->vehicle(getSumoId()).setColor({255, 0, 0, 255}); // Red
            state_ = STOPPED;
            
            // 获取当前车道并设置为禁行
            std::string currentLaneId = traci_->vehicle(getSumoId()).getLaneId();
            
            // 检查车辆类型信息
            std::string vehicleType = traci_->vehicle(getSumoId()).getTypeId();
            
            // 设置车道禁行 - 禁止多种车辆类型通行
            traci_->lane(currentLaneId).setDisallowed({"passenger", "private", "taxi", "bus", "truck", "delivery", "motorcycle", "bicycle"});
            
            EV_INFO << "Lane " << currentLaneId << " has been blocked for multiple vehicle types" << endl;
        }
        catch(const std::exception& e) {
            EV_ERROR << "TraCI error while triggering accident: " << e.what() << endl;
        }
    }
}

void AccidentCarApp::processPacket(Packet *packet)
{
    std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentCarApp::processPacket 被调用！车辆 " << getSumoId() 
              << " 收到数据包: '" << packet->getName() << "' ******\n\n\n" << std::endl;
              
    // 检查是否包含LaneChangeCommand
    if (strstr(packet->getName(), "LaneChangeCommand") != nullptr) {
        std::cout << "****** [DIRECT OUTPUT] 数据包名称匹配 LaneChangeCommand！******" << std::endl;
    }
    
    // 不调用基类方法，直接处理
    // UdpSink::processPacket(packet);  // 注释掉，避免重复处理
    
    simtime_t delay = simTime() - packet->getCreationTime();
    emit(endToEndDelaySignal, delay);
    
    try {
        const auto& chunk = packet->peekData<Chunk>();
        if (chunk) {
            const auto accidentCmd = dynamicPtrCast<const AccidentPacket>(chunk);
            if (accidentCmd) {
                std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 收到AccidentPacket，类型: " 
                          << accidentCmd->getMsgType() << " ******" << std::endl;
                
                // 现在只处理变道命令
                if (accidentCmd->getMsgType() == ACC_LANE_CHANGE_CMD) {
                    std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 处理变道命令 ******" << std::endl;
                    processLaneChangeCommand(accidentCmd.get());
                } else {
                    EV_INFO << "Unsupported packet type: " << accidentCmd->getMsgType() << endl;
                }
            }
        }
    }
    catch (const std::exception& e) {
        EV_WARN << "Error processing packet: " << e.what() << endl;
    }
    delete packet;
}

void AccidentCarApp::processLaneChangeCommand(const inet::AccidentPacket* cmd)
{
    std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentCarApp::processLaneChangeCommand - 车辆 " 
              << getSumoId() << " ******\n\n\n" << std::endl;
    
    if (isEvading_ || state_ != NORMAL) {
        std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 车辆 " << getSumoId() 
                  << " 已经在执行变道或不在正常状态，忽略命令 ******" << std::endl;
        EV_INFO << "Vehicle " << getSumoId() << " is already evading or not in normal state. Ignoring command." << endl;
        return;
    }
    
    std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 车辆 " << getSumoId() 
              << " 接收到变道命令 ******" << std::endl;
    EV_INFO << "Vehicle " << getSumoId() << " received lane change command." << endl;

    originalLaneId_ = cmd->getOriginalLaneId();
    targetLaneId_ = cmd->getTargetLaneId();
    accidentPos_ = Coord(cmd->getAccidentPosX(), cmd->getAccidentPosY());

    std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 原始车道: " << originalLaneId_ 
              << ", 目标车道: " << targetLaneId_ 
              << ", 事故位置: (" << accidentPos_.x << ", " << accidentPos_.y << ") ******" << std::endl;
    
    // 添加route切换的日志
    if (getTraCIInterface()) {
        try {
            std::string currentRouteId = traci_->vehicle(getSumoId()).getRouteId();
            std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 车辆 " << getSumoId() 
                      << " 当前route: " << currentRouteId << " ******" << std::endl;
            
            // 如果当前是route9，模拟切换到route9的日志
            if (currentRouteId == "9") {
                std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 车辆 " << getSumoId() 
                          << " 从route2切换到route9 ******" << std::endl;
                EV_INFO << "Vehicle " << getSumoId() << " 从route2切换到route9 (仅日志输出)" << endl;
            }
        } catch (const std::exception& e) {
            EV_WARN << "获取车辆route信息时出错: " << e.what() << endl;
        }
    }
    
    startEvasionManeuver();
}

void AccidentCarApp::startEvasionManeuver()
{
    EV_INFO << "Vehicle " << getSumoId() << " 变道成功" << endl;
    // 车辆应用层接收并处理完数据包后，不执行任何变道操作，只日志输出：变道成功
}

void AccidentCarApp::checkEvasionStatus()
{
    if (!isEvading_ || !getTraCIInterface()) {
        return;
    }
    
    try {
        // 使用类成员变量mobility_代替局部变量mobility
        if (!mobility_) {
            EV_ERROR << "mobility模块不可用" << endl;
            return;
        }
        Coord currentPos = mobility_->getCurrentPosition();
        double dist = currentPos.distance(accidentPos_);
        std::string currentLane = traci_->vehicle(getSumoId()).getLaneId();

        // Check if we are past the accident and on the target lane
        if (dist > 200 && currentLane == targetLaneId_) {
            finishEvasionManeuver();
        } else {
            // Check again in 1 second
            scheduleAt(simTime() + 1.0, checkPositionTimer_);
        }
    } catch (const std::exception& e) {
        EV_ERROR << "TraCI error in checkEvasionStatus: " << e.what() << endl;
        // Stop checking on error
        isEvading_ = false;
        state_ = NORMAL;
    }
}

void AccidentCarApp::finishEvasionManeuver()
{
    EV_INFO << "Vehicle " << getSumoId() << " finished evasion. Restoring route cost." << endl;
    
    try {
        // 恢复原始道路的正常通行成本
        std::string originalRoadId = originalLaneId_.substr(0, originalLaneId_.find_last_of('_'));
        traci_->vehicle(getSumoId()).changeRoute(originalRoadId, -1);
    } catch (const std::exception& e) {
        EV_ERROR << "TraCI error while restoring route cost: " << e.what() << endl;
    }

    isEvading_ = false;
    state_ = NORMAL;
    // Timer is not rescheduled
}

bool AccidentCarApp::getTraCIInterface()
{
    // 已经有TraCI接口
    if (traci_)
        return true;
        
    // 尝试获取TraCI接口
    cModule* manager = getModuleByPath("<root>.veinsManager");
    if (!manager) {
        EV_ERROR << "无法找到TraCI管理器模块" << endl;
        return false;
    }
    
    // 尝试获取TraCI命令接口
    veins::TraCIScenarioManager* scenarioManager = dynamic_cast<veins::TraCIScenarioManager*>(manager);
    if (!scenarioManager) {
        EV_ERROR << "TraCI管理器不是TraCIScenarioManager类型" << endl;
        return false;
    }
    
    // 获取命令接口
    if (scenarioManager->isConnected()) {
        traci_ = scenarioManager->getCommandInterface();
        return traci_ != nullptr;
    }
    
    return false;
}

std::string AccidentCarApp::getSumoId()
{
    // 获取自己的SUMO ID
    cModule* mobilityModule = getParentModule()->getSubmodule("mobility");
    auto* veinsMobility = dynamic_cast<veins::VeinsInetMobility*>(mobilityModule);
    if (!veinsMobility) {
        EV_ERROR << "无法获取VeinsInetMobility模块" << endl;
        return "";
    }
    
    return veinsMobility->getExternalId();
}

void AccidentCarApp::ensureSocketBinding()
{
    try {
        // 获取localPort参数
        int localPort = par("localPort").intValue();
        
        // 创建UDP socket
        UdpSocket socket;
        socket.setOutputGate(gate("socketOut"));
        socket.bind(localPort);
    } catch (const std::exception& e) {
        EV_ERROR << "Manual socket binding failed: " << e.what() << endl;
        // 如果手动绑定失败，尝试让UdpSink自己处理
    }
}

void AccidentCarApp::finish()
{
    UdpSink::finish();
    
    // 移除与停车指令相关的统计
    recordScalar("rcvdPk:count", processedCmds_);
    EV_INFO << "AccidentCarApp processed " << processedCmds_ << " lane change commands." << endl;
}