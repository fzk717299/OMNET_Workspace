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
    std::cout << "****** [DIRECT OUTPUT] AccidentCarApp::initialize - 开始 STAGE " << stage 
              << " for " << getParentModule()->getFullName() << " ******" << std::endl;
    
    UdpSink::initialize(stage);
    
    std::cout << "****** [DIRECT OUTPUT] AccidentCarApp::initialize - UdpSink初始化完成 STAGE " << stage << " ******" << std::endl;
    
    if (stage == INITSTAGE_LOCAL) {
        // 检查并输出localPort参数
        try {
            int localPortValue = par("localPort");
            std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - localPort参数值: " << localPortValue << " ******" << std::endl;
        } catch (const std::exception& e) {
            std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 无法读取localPort参数: " << e.what() << " ******" << std::endl;
        }
        
        // 读取参数
        smoothDeceleration_ = par("smoothDeceleration").boolValue();
        responseTime_ = par("responseTime").doubleValue();
        isAccidentVehicle_ = par("isAccidentVehicle").boolValue();
        accidentTime_ = par("accidentTime");
        
        // 检查是否有其他应用也在监听同一端口
        std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 检查父模块的应用配置 ******" << std::endl;
        cModule* parentModule = getParentModule();
        int numApps = parentModule->par("numApps").intValue();
        std::cout << "****** [DIRECT OUTPUT] 父模块名称: " << parentModule->getFullName() 
                  << ", 应用数量: " << numApps << " ******" << std::endl;
        
        // 列出所有应用模块
        for (int i = 0; i < numApps; i++) {
            cModule* appModule = parentModule->getSubmodule("app", i);
            if (appModule) {
                std::cout << "****** [DIRECT OUTPUT] 应用[" << i << "]: " 
                          << appModule->getClassName() << " (" << appModule->getFullName() << ") ******" << std::endl;
            }
        }
        
        // 检查当前应用的索引
        std::cout << "****** [DIRECT OUTPUT] 当前AccidentCarApp索引: " << getIndex() << " ******" << std::endl;
        
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
        
        // 检查socket绑定状态
        std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 检查socket绑定状态 ******" << std::endl;
        try {
            // 尝试获取UDP socket信息
            cGate* socketOut = gate("socketOut");
            cGate* socketIn = gate("socketIn");
            std::cout << "****** [DIRECT OUTPUT] Socket gates - Out: " << (socketOut ? "存在" : "不存在") 
                      << ", In: " << (socketIn ? "存在" : "不存在") << " ******" << std::endl;
                      
            // 检查localPort参数是否正确传递到UdpSink
            int portValue = par("localPort");
            std::cout << "****** [DIRECT OUTPUT] 最终localPort值: " << portValue << " ******" << std::endl;
        } catch (const std::exception& e) {
            std::cout << "****** [DIRECT OUTPUT] Socket检查出错: " << e.what() << " ******" << std::endl;
        }
        
        // 手动确保socket绑定（作为备用方案）
        std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 尝试手动socket绑定 ******" << std::endl;
        try {
            ensureSocketBinding();
        } catch (const std::exception& e) {
            std::cout << "****** [DIRECT OUTPUT] 手动socket绑定失败: " << e.what() << " ******" << std::endl;
        }
        
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
    // 只有当数据包名称包含"LaneChangeCommand"时才输出日志
    if (strstr(packet->getName(), "LaneChangeCommand") != nullptr) {
        std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentCarApp::processPacket - 车辆 " << getSumoId() 
                  << " 收到数据包: " << packet->getName() << " ******\n\n\n" << std::endl;
    }
    
    UdpSink::processPacket(packet);
    
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
                    std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 不支持的包类型: " 
                              << accidentCmd->getMsgType() << " ******" << std::endl;
                }
            } else if (strstr(packet->getName(), "LaneChangeCommand") != nullptr) {
                std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 无法将数据包转换为AccidentPacket ******" << std::endl;
            }
        } else if (strstr(packet->getName(), "LaneChangeCommand") != nullptr) {
            std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 数据包没有数据块 ******" << std::endl;
        }
    }
    catch (const std::exception& e) {
        if (strstr(packet->getName(), "LaneChangeCommand") != nullptr) {
            std::cout << "****** [DIRECT OUTPUT] AccidentCarApp - 处理数据包时出错: " << e.what() << " ******" << std::endl;
        }
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
    
    startEvasionManeuver();
}

void AccidentCarApp::startEvasionManeuver()
{
    if (!getTraCIInterface()) {
        std::cout << "****** [DIRECT OUTPUT] AccidentCarApp::startEvasionManeuver - TraCI接口不可用，无法开始变道 ******" << std::endl;
        EV_ERROR << "TraCI interface not found, cannot start evasion." << endl;
        return;
    }

    std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentCarApp::startEvasionManeuver - 车辆 " << getSumoId() 
              << " 开始执行变道操作 ******\n\n\n" << std::endl;
    EV_INFO << "Vehicle " << getSumoId() << " starting evasion maneuver to target lane " << targetLaneId_ << endl;
    
    state_ = EVADING;
    isEvading_ = true;
    try {
        std::string currentRoadId = originalLaneId_.substr(0, originalLaneId_.find_last_of('_'));
        int currentLaneIndex = std::stoi(originalLaneId_.substr(originalLaneId_.find_last_of('_') + 1));
        int targetLaneIndex = std::stoi(targetLaneId_.substr(targetLaneId_.find_last_of('_') + 1));

        std::cout << "****** [DIRECT OUTPUT] 当前道路: " << currentRoadId 
                  << ", 当前车道索引: " << currentLaneIndex << " ******" << std::endl;
        std::cout << "****** [DIRECT OUTPUT] 目标道路: " << targetLaneId_.substr(0, targetLaneId_.find_last_of('_'))
                  << ", 目标车道索引: " << targetLaneIndex << " ******" << std::endl;

        EV_INFO << "****** 当前道路: " << currentRoadId << ", 当前车道索引: " << currentLaneIndex << " ******" << endl;
        EV_INFO << "****** 目标道路: " << targetLaneId_.substr(0, targetLaneId_.find_last_of('_'))
                << ", 目标车道索引: " << targetLaneIndex << " ******" << endl;

        if (targetLaneIndex != currentLaneIndex) {
            double originalSpeed = traci_->vehicle(getSumoId()).getSpeed();
            std::cout << "****** [DIRECT OUTPUT] 原始速度: " << originalSpeed << " m/s ******" << std::endl;
            EV_INFO << "****** 原始速度: " << originalSpeed << " m/s ******" << endl;
            
            traci_->vehicle(getSumoId()).setSpeed(20.0);
            std::cout << "****** [DIRECT OUTPUT] 设置新速度: 20.0 m/s ******" << std::endl;
            EV_INFO << "****** 设置新速度: 20.0 m/s ******" << endl;

            std::string targetRoadId = targetLaneId_.substr(0, targetLaneId_.find_last_of('_'));

            if (targetRoadId == currentRoadId) {
                std::cout << "****** [DIRECT OUTPUT] 同一道路上的不同车道，尝试设置变道参数 ******" << std::endl;
                EV_INFO << "****** 同一道路上的不同车道，尝试设置变道参数 ******" << endl;
                
                traci_->vehicle(getSumoId()).setParameter("laneChangeMode", "0");
                traci_->vehicle(getSumoId()).setParameter("desiredLane", std::to_string(targetLaneIndex));
                std::cout << "****** [DIRECT OUTPUT] laneChangeMode=0, desiredLane=" << targetLaneIndex << " ******" << std::endl;
                EV_INFO << "****** laneChangeMode=0, desiredLane=" << targetLaneIndex << " ******" << endl;
            }
            else {
                std::cout << "****** [DIRECT OUTPUT] 不同道路，使用newRoute到目标道路: " << targetRoadId << " ******" << std::endl;
                EV_INFO << "****** 不同道路，使用newRoute到目标道路: " << targetRoadId << " ******" << endl;
                
                traci_->vehicle(getSumoId()).newRoute(targetRoadId);
                std::cout << "****** [DIRECT OUTPUT] newRoute命令已执行 ******" << std::endl;
                EV_INFO << "****** newRoute命令已执行 ******" << endl;
            }
            
            std::cout << "****** [DIRECT OUTPUT] 额外尝试: 设置其他变道相关参数 ******" << std::endl;
            EV_INFO << "****** 额外尝试: 设置其他变道相关参数 ******" << endl;
            
            traci_->vehicle(getSumoId()).setParameter("lane", std::to_string(targetLaneIndex));
            try {
                int currentSelectedLane = traci_->vehicle(getSumoId()).getLaneIndex();
                std::cout << "****** [DIRECT OUTPUT] 当前选择的车道索引: " << currentSelectedLane << " ******" << std::endl;
                EV_INFO << "****** 当前选择的车道索引: " << currentSelectedLane << " ******" << endl;
            } catch (...) {
                std::cout << "****** [DIRECT OUTPUT] 无法获取当前选择的车道索引 ******" << std::endl;
                EV_INFO << "****** 无法获取当前选择的车道索引 ******" << endl;
            }
        }
    }
    catch (const std::exception& e) {
        std::cout << "****** [DIRECT OUTPUT] [车辆 " << getSumoId() << "] 变道操作出错: " << e.what() << " ******" << std::endl;
        EV_ERROR << "****** [车辆 " << getSumoId() << "] 变道操作出错: " << e.what() << " ******" << endl;
        isEvading_ = false;
        state_ = NORMAL;
        return;
    }
    
    std::cout << "****** [DIRECT OUTPUT] 定时检查器已设置，1秒后检查变道状态 ******" << std::endl;
    EV_INFO << "****** 定时检查器已设置，1秒后检查变道状态 ******" << endl;
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

void AccidentCarApp::ensureSocketBinding()
{
    std::cout << "****** [DIRECT OUTPUT] AccidentCarApp::ensureSocketBinding - 开始手动socket绑定 ******" << std::endl;
    
    try {
        // 获取localPort参数
        int localPort = par("localPort").intValue();
        std::cout << "****** [DIRECT OUTPUT] 准备绑定到端口: " << localPort << " ******" << std::endl;
        
        // 创建UDP socket
        UdpSocket socket;
        socket.setOutputGate(gate("socketOut"));
        socket.bind(localPort);
        
        std::cout << "****** [DIRECT OUTPUT] 手动socket绑定成功，端口: " << localPort << " ******" << std::endl;
        
    } catch (const std::exception& e) {
        std::cout << "****** [DIRECT OUTPUT] 手动socket绑定出现异常: " << e.what() << " ******" << std::endl;
        EV_ERROR << "Manual socket binding failed: " << e.what() << endl;
        
        // 如果手动绑定失败，尝试让UdpSink自己处理
        std::cout << "****** [DIRECT OUTPUT] 回退到UdpSink默认处理 ******" << std::endl;
    }
}

void AccidentCarApp::finish()
{
    UdpSink::finish();
    
    // 移除与停车指令相关的统计
    recordScalar("rcvdPk:count", processedCmds_);
    EV_INFO << "AccidentCarApp processed " << processedCmds_ << " lane change commands." << endl;
}