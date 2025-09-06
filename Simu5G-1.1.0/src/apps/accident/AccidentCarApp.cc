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
    // 添加直接的标准输出
    std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentCarApp constructor called ******\n\n\n" << std::endl;
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
        
        // 添加直接的标准输出
        std::cout << "****** [DIRECT OUTPUT] AccidentCarApp::initialize STAGE " << stage 
                  << " for " << getParentModule()->getFullName()
                  << ", isAccidentVehicle = " << isAccidentVehicle_
                  << ", accidentTime = " << accidentTime_ << " ******" << std::endl;
        
        state_ = NORMAL;
        processedCmds_ = 0;
        traci_ = nullptr;
        mobility_ = nullptr;  // 初始化mobility_指针
        
        // 获取mobility模块
        cModule* mobilityModule = getParentModule()->getSubmodule("mobility");
        if (mobilityModule) {
            mobility_ = dynamic_cast<veins::VeinsInetMobility*>(mobilityModule);
            if (!mobility_) {
                std::cout << "****** [DIRECT OUTPUT] 无法获取VeinsInetMobility模块 ******" << std::endl;
                EV_ERROR << "无法获取VeinsInetMobility模块" << endl;
            }
        }
        
        // 如果是事故车辆，则创建计时器
        if (isAccidentVehicle_) {
            std::cout << "****** [DIRECT OUTPUT] 创建事故计时器，事故时间: " << accidentTime_ << " ******" << std::endl;
            accidentTimer_ = new cMessage("accidentTimer");
        }
        isEvading_ = false;
        checkPositionTimer_ = new cMessage("checkPositionTimer");
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        // 添加直接的标准输出
        std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentCarApp::initialize STAGE " << stage 
                  << " for " << getParentModule()->getFullName() << " ******\n\n\n" << std::endl;
        
        // 调度事故计时器
        if (isAccidentVehicle_) {
            std::cout << "****** [DIRECT OUTPUT] 调度事故计时器，时间: " << accidentTime_ << " ******" << std::endl;
            scheduleAt(accidentTime_, accidentTimer_);
        }
    }
}

void AccidentCarApp::handleMessageWhenUp(cMessage *msg)
{
    if (msg->isSelfMessage()) {
        if (msg == accidentTimer_) {
            std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentCarApp::handleMessageWhenUp - 事故计时器触发，时间: " << simTime() << " ******\n\n\n" << std::endl;
            triggerAccident();
        }
        else if (msg == checkPositionTimer_) {
            std::cout << "****** [DIRECT OUTPUT] AccidentCarApp::handleMessageWhenUp - 检查位置计时器触发，时间: " << simTime() << " ******" << std::endl;
            checkEvasionStatus();
        }
        else {
            delete msg;
        }
    }
    else {
        // UdpSink::handleMessageWhenUp 现在会调用 processPacket
        UdpSink::handleMessageWhenUp(msg);
    }
}

void AccidentCarApp::triggerAccident()
{
    std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentCarApp::triggerAccident - 车辆 " << getSumoId() << " 触发事故，时间: " << simTime() << " ******\n\n\n" << std::endl;
    EV_INFO << "Vehicle " << getSumoId() << " triggering accident at " << simTime() << endl;
    
    if (getTraCIInterface()) {
        try {
            std::cout << "****** [DIRECT OUTPUT] AccidentCarApp::triggerAccident - 设置车辆速度为 0 ******" << std::endl;
            traci_->vehicle(getSumoId()).setSpeed(0);
            traci_->vehicle(getSumoId()).setColor({255, 0, 0, 255}); // Red
            state_ = STOPPED;
            std::cout << "****** [DIRECT OUTPUT] AccidentCarApp::triggerAccident - 车辆状态设置为 STOPPED ******" << std::endl;
        }
        catch(const std::exception& e) {
            std::cout << "****** [DIRECT OUTPUT] AccidentCarApp::triggerAccident - TraCI错误: " << e.what() << " ******" << std::endl;
            EV_ERROR << "TraCI error while triggering accident: " << e.what() << endl;
        }
    }
}

void AccidentCarApp::processPacket(Packet *packet)
{
    UdpSink::processPacket(packet);
    
    simtime_t delay = simTime() - packet->getCreationTime();
    emit(endToEndDelaySignal, delay);
    
    try {
        const auto& chunk = packet->peekData<Chunk>();
        if (chunk) {
            const auto accidentCmd = dynamicPtrCast<const AccidentPacket>(chunk);
            if (accidentCmd) {
                // 现在只处理变道命令
                if (accidentCmd->getMsgType() == ACC_LANE_CHANGE_CMD) {
                    processLaneChangeCommand(accidentCmd.get());
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
    if (isEvading_ || state_ != NORMAL) {
        EV_INFO << "Vehicle " << getSumoId() << " is already evading or not in normal state. Ignoring command." << endl;
        return;
    }
    EV_INFO << "Vehicle " << getSumoId() << " received lane change command." << endl;

    originalLaneId_ = cmd->getOriginalLaneId();
    targetLaneId_ = cmd->getTargetLaneId();
    accidentPos_ = Coord(cmd->getAccidentPosX(), cmd->getAccidentPosY());

    startEvasionManeuver();
}

void AccidentCarApp::startEvasionManeuver()
{
    if (!getTraCIInterface()) {
        EV_ERROR << "TraCI interface not found, cannot start evasion." << endl;
        return;
    }

    EV_INFO << "Vehicle " << getSumoId() << " starting evasion: making current lane undesirable." << endl;
    state_ = EVADING;
    isEvading_ = true;
    try {
        // 让当前道路的通行成本变得非常高，以促使SUMO自动变道
        std::string currentRoadId = originalLaneId_.substr(0, originalLaneId_.find_last_of('_'));
        traci_->vehicle(getSumoId()).changeRoute(currentRoadId, 9999);
    } catch (const std::exception& e) {
        EV_ERROR << "TraCI error during lane change maneuver: " << e.what() << endl;
        isEvading_ = false;
        state_ = NORMAL;
        return;
    }

    scheduleAt(simTime() + 1.0, checkPositionTimer_);
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

void AccidentCarApp::finish()
{
    UdpSink::finish();
    
    // 移除与停车指令相关的统计
    recordScalar("rcvdPk:count", processedCmds_);
    EV_INFO << "AccidentCarApp processed " << processedCmds_ << " lane change commands." << endl;
}