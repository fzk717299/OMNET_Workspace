//
// 事故RSU应用实现
//

#include "apps/accident/AccidentRsuApp.h"

// TraCI 相关头文件
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCIConnection.h"

// INET相关头文件
#include "inet/networklayer/common/L3AddressResolver.h"
#include "inet/networklayer/contract/ipv4/Ipv4Address.h"
#include "veins_inet/VeinsInetMobility.h"
#include "veins/base/utils/Coord.h"
#include "inet/mobility/contract/IMobility.h" // 添加缺失的头文件

#include <iostream> // 添加标准输出头文件

using namespace inet::units::values;
using namespace veins;

Define_Module(AccidentRsuApp);

// 统计信号声明和注册 - 移除stopCommandSentSignal
simsignal_t AccidentRsuApp::accidentDetectedSignal = registerSignal("accidentDetected");
simsignal_t AccidentRsuApp::laneChangeCommandSentSignal = registerSignal("laneChangeCommandSent");

AccidentRsuApp::AccidentRsuApp() : 
    UdpBasicApp(),
    traci_(nullptr),
    manager_(nullptr),
    checkInterval_(1.0),
    stoppedSpeedThreshold_(0.1),
    minStopTime_(3.0),
    checkTimer_(nullptr)
{
    // 添加直接的标准输出
    std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentRsuApp constructor called ******\n\n\n" << std::endl;
}

AccidentRsuApp::~AccidentRsuApp()
{
    cancelAndDelete(checkTimer_);
}

void AccidentRsuApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);

    if (stage == INITSTAGE_LOCAL) {
        // 读取NED参数
        const char* lanesStr = par("monitoredLanes").stringValue();
        cStringTokenizer tokenizer(lanesStr);
        while (tokenizer.hasMoreTokens())
            monitoredLanes_.push_back(tokenizer.nextToken());
            
        checkInterval_ = par("checkInterval");
        stoppedSpeedThreshold_ = par("stoppedSpeedThreshold").doubleValue();
        minStopTime_ = par("minStopTime").doubleValue();
        
        // 创建检查计时器
        checkTimer_ = new cMessage("accidentCheckTimer");
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        // 添加直接的标准输出
        std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentRsuApp::initialize STAGE " << stage 
                  << " for " << getParentModule()->getFullName() << " ******\n\n\n" << std::endl;
        
        EV_INFO << "\n\n\n****** [RSU " << getParentModule()->getFullName() << "] Initialized ******\n\n\n" << endl;
        EV_INFO << "AccidentRsuApp初始化完成，监控车道数量: " << monitoredLanes_.size() 
                << "，检查间隔: " << checkInterval_ << "s" << endl;
        
        // 启动定期检查
        std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentRsuApp::initialize - 调度第一次检查，时间: " 
                  << simTime() + 0.1 << " ******\n\n\n" << std::endl;
        scheduleAt(simTime() + 0.1, checkTimer_);  // 0.1秒后开始第一次检查
    }
}

void AccidentRsuApp::handleMessageWhenUp(cMessage *msg)
{
    if (msg == checkTimer_) {
        checkVehicles();
        return;
    }
    
    // 处理其他消息
    UdpBasicApp::handleMessageWhenUp(msg);
}

bool AccidentRsuApp::getTraCIInterface()
{
    // 已经有TraCI接口
    if (traci_ && manager_)
        return true;
        
    // 尝试获取TraCI接口
    cModule* manager = getModuleByPath("<root>.veinsManager");
    if (!manager) {
        EV_ERROR << "无法找到TraCI管理器模块" << endl;
        return false;
    }
    
    // 尝试获取TraCI命令接口
    manager_ = dynamic_cast<veins::TraCIScenarioManager*>(manager);
    if (!manager_) {
        EV_ERROR << "TraCI管理器不是TraCIScenarioManager类型" << endl;
        return false;
    }
    
    // 获取命令接口
    if (manager_->isConnected()) {
        traci_ = manager_->getCommandInterface();
        return traci_ != nullptr;
    }
    
    return false;
}

void AccidentRsuApp::checkVehicles()
{
    // 获取TraCI接口
    if (!getTraCIInterface()) {
        std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentRsuApp::checkVehicles - TraCI接口尚未可用，稍后重试 ******\n\n\n" << std::endl;
        EV_WARN << "TraCI接口尚未可用，稍后重试" << endl;
        return;
    }
    
    std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentRsuApp::checkVehicles - TraCI接口已获取 ******\n\n\n" << std::endl;
    
    try {
        // 获取所有管理的车辆
        std::map<std::string, cModule*> managedHosts = manager_->getManagedHosts();
        
        if (managedHosts.empty()) {
            std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentRsuApp::checkVehicles - 当前没有车辆在仿真中 ******\n\n\n" << std::endl;
            EV_INFO << "当前没有车辆在仿真中" << endl;
            return;
        }
        
        std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentRsuApp::checkVehicles - 当前仿真中有 " << managedHosts.size() << " 辆车 ******\n\n\n" << std::endl;
        EV_INFO << "当前仿真中有 " << managedHosts.size() << " 辆车" << endl;
        
        // 遍历所有车辆
        int processedVehicles = 0;
        for (const auto& pair : managedHosts) {
            const std::string& sumoId = pair.first;
            cModule* carModule = pair.second;
            
            std::cout << "****** [DIRECT OUTPUT] 处理车辆 " << sumoId << " (" << processedVehicles + 1 << "/" << managedHosts.size() << ") ******" << std::endl;
            processedVehicles++;
            
            try {
                // 正确的获取位置方式：从车辆的mobility模块获取
                if (!carModule) {
                    std::cout << "****** [DIRECT OUTPUT] 车辆模块为空，跳过 ******" << std::endl;
                    continue;
                }
                IMobility* mobility = check_and_cast_nullable<IMobility*>(carModule->getSubmodule("mobility"));
                if (!mobility) {
                    std::cout << "****** [DIRECT OUTPUT] 车辆 " << sumoId << " 的mobility模块为空，跳过 ******" << std::endl;
                    continue;
                }
                
                // 1. 从mobility获取inet::Coord
                inet::Coord inetPosition = mobility->getCurrentPosition();
                // 2. 显式转换为veins::Coord
                veins::Coord position(inetPosition.x, inetPosition.y, inetPosition.z);

                // 获取TraCI信息
                auto vehicle = traci_->vehicle(sumoId);
                std::string laneId = vehicle.getLaneId();
                double speed = vehicle.getSpeed();  // m/s
                
                std::cout << "****** [DIRECT OUTPUT] 车辆 " << sumoId << " 在车道 " << laneId << "，速度 " << speed << " m/s ******" << std::endl;
                
                // 检查车辆是否在监控的车道上
                bool onMonitoredLane = false;
                for (const auto& lane : monitoredLanes_) {
                    if (laneId.find(lane) != std::string::npos) {
                        onMonitoredLane = true;
                        break;
                    }
                }
                
                if (!onMonitoredLane) {
                    std::cout << "****** [DIRECT OUTPUT] 车辆 " << sumoId << " 不在监控车道上，跳过 ******" << std::endl;
                    continue;  // 不在监控车道上，跳过
                }
                
                // 检查车辆是否停止
                if (speed < stoppedSpeedThreshold_) {
                    std::cout << "****** [DIRECT OUTPUT] 车辆 " << sumoId << " 速度低于阈值，可能停止 ******" << std::endl;
                    // 记录停止的车辆
                    auto it = stoppedVehicles_.find(sumoId);
                    if (it == stoppedVehicles_.end()) {
                        StoppedVehicleInfo info;
                        info.firstDetectedTime = simTime();
                        info.laneId = laneId;
                        info.posX = position.x; // 保存世界坐标
                        info.posY = position.y; // 保存世界坐标
                        info.alarmSent = false;
                        stoppedVehicles_[sumoId] = info;
                        
                        std::cout << "****** [DIRECT OUTPUT] 首次检测到车辆 " << sumoId << " 在车道 " << laneId 
                                << " 上停止，位置: " << position.x << ", " << position.y << " ******" << std::endl;
                        EV_INFO << "检测到车辆 " << sumoId << " 在车道 " << laneId 
                                << " 上停止，位置: " << position.x << ", " << position.y << endl;
                    }
                    else if (!it->second.alarmSent && 
                             simTime() - it->second.firstDetectedTime >= minStopTime_) {
                        // 车辆已停止足够长时间，处理事故
                        std::cout << "****** [DIRECT OUTPUT] 车辆 " << sumoId << " 已停止足够长时间，处理事故 ******" << std::endl;
                        processStoppedVehicle(sumoId, it->second.laneId, it->second.posX, it->second.posY);
                        it->second.alarmSent = true;
                    }
                }
                else {
                    // 车辆在移动，如果之前记录为停止，现在移除
                    auto it = stoppedVehicles_.find(sumoId);
                    if (it != stoppedVehicles_.end()) {
                        stoppedVehicles_.erase(it);
                        std::cout << "****** [DIRECT OUTPUT] 车辆 " << sumoId << " 恢复移动 ******" << std::endl;
                        EV_INFO << "车辆 " << sumoId << " 恢复移动" << endl;
                    }
                }
            }
            catch (const std::exception& e) {
                std::cout << "****** [DIRECT OUTPUT] 处理车辆 " << sumoId << " 时出错: " << e.what() << " ******" << std::endl;
                EV_WARN << "处理车辆 " << sumoId << " 时出错: " << e.what() << endl;
            }
        }
        
        std::cout << "****** [DIRECT OUTPUT] 已处理所有车辆，调度下一次检查，时间: " << simTime() + checkInterval_ << " ******" << std::endl;
        // 调度下一次检查
        scheduleAt(simTime() + checkInterval_, checkTimer_);
    }
    catch (const std::exception& e) {
        std::cout << "****** [DIRECT OUTPUT] 检查车辆时出错: " << e.what() << " ******" << std::endl;
        EV_ERROR << "检查车辆时出错: " << e.what() << endl;
        // 即使出错也要调度下一次检查，避免仿真卡住
        scheduleAt(simTime() + checkInterval_, checkTimer_);
    }
}

// 添加缺失的函数定义
std::string AccidentRsuApp::getTargetLane(const std::string& originalLane)
{
    EV_INFO << "****** [RSU] 为原始车道 " << originalLane << " 寻找避让目标车道 ******" << endl;
    
    // 解析车道ID格式，通常是"edgeID_laneIndex"
    size_t pos = originalLane.find_last_of('_');
    if (pos == std::string::npos) {
        EV_ERROR << "****** [RSU] 车道ID格式错误: " << originalLane << " ******" << endl;
        return "";
    }
    
    std::string edgeId = originalLane.substr(0, pos);
    int laneIndex = std::stoi(originalLane.substr(pos+1));
    
    EV_INFO << "****** [RSU] 解析车道: 边缘=" << edgeId << ", 车道索引=" << laneIndex << " ******" << endl;
    
    // 获取道路总车道数，尝试使用相邻车道
    int totalLanes = -1;
    try {
        // 这是一个假设，实际实现可能需要根据TraCI的实际API调整
        if (traci_) {
            // 注意：这里假设道路有多个车道
            // 在真实情况下，应该从SUMO/TraCI中获取道路的车道数量
            totalLanes = 2;  // 假设至少有2个车道
            EV_INFO << "****** [RSU] 边缘 " << edgeId << " 估计有 " << totalLanes << " 条车道 ******" << endl;
        }
    } catch (...) {
        EV_WARN << "****** [RSU] 无法获取边缘 " << edgeId << " 的车道数量，假设为2 ******" << endl;
        totalLanes = 2;  // 假设默认有2个车道
    }
    
    // 计算目标车道索引 - 如果在车道0，移动到车道1；如果在其他车道，移动到车道0
    int targetLaneIndex = (laneIndex == 0) ? 1 : 0;
    if (targetLaneIndex >= totalLanes) {
        // 安全检查
        EV_WARN << "****** [RSU] 计算的目标车道索引 " << targetLaneIndex << " 超出了假设的车道数量 " << totalLanes << " ******" << endl;
        targetLaneIndex = laneIndex > 0 ? laneIndex - 1 : 0;
        EV_WARN << "****** [RSU] 调整目标车道索引为 " << targetLaneIndex << " ******" << endl;
    }
    
    // 构建目标车道ID
    std::string targetLane = edgeId + "_" + std::to_string(targetLaneIndex);
    EV_INFO << "****** [RSU] 最终选择的避让目标车道: " << targetLane << " ******" << endl;
    
    return targetLane;
}

// 确保函数签名与头文件完全匹配，使用 veins::Coord
inet::Packet* AccidentRsuApp::createLaneChangePacket(const veins::Coord& accidentPos, const std::string& originalLane, const std::string& targetLane)
{
    EV_INFO << "****** [RSU] 创建变道指令数据包 ******" << endl;
    EV_INFO << "****** 原始车道: " << originalLane << ", 目标车道: " << targetLane << " ******" << endl;
    EV_INFO << "****** 事故位置: (" << accidentPos.x << ", " << accidentPos.y << ") ******" << endl;
    auto payload = makeShared<AccidentPacket>();
    payload->setMsgType(ACC_LANE_CHANGE_CMD);
    payload->setOriginalLaneId(originalLane.c_str());
    payload->setTargetLaneId(targetLane.c_str());
    payload->setAccidentPosX(accidentPos.x);
    payload->setAccidentPosY(accidentPos.y);
    auto pk = new Packet("LaneChangeCommand");
    pk->insertAtBack(payload);
    EV_INFO << "****** 变道指令数据包已创建 ******" << endl;
    return pk;
}


void AccidentRsuApp::processStoppedVehicle(const std::string& vehicleId, const std::string& laneId, double posX, double posY)
{
    EV_INFO << "\n==================================================================" << endl;
    EV_INFO << "****** [RSU] 检测到事故！车辆: " << vehicleId << " 在车道: " << laneId << " ******" << endl;
    EV_INFO << "****** 事故位置: (" << posX << ", " << posY << ") ******" << endl;
    EV_INFO << "==================================================================" << endl;

    std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentRsuApp::processStoppedVehicle - 检测到事故！车辆: " << vehicleId << " 在车道: " << laneId << " ******\n\n\n" << std::endl;

    // 如果已经为这起事故发送过指令，则不再重复发送
    if (reportedAccidents_.count(vehicleId)) {
        std::cout << "****** [DIRECT OUTPUT] AccidentRsuApp::processStoppedVehicle - 已为该事故发送过指令，忽略 ******" << std::endl;
        EV_INFO << "****** [RSU] 已为该事故发送过指令，忽略 ******" << endl;
        return;
    }

    // 记录这起事故，防止重复处理
    reportedAccidents_.insert(vehicleId);
    emit(accidentDetectedSignal, 1);

    // 1. 确定用于避让的目标车道
    std::string targetLane = getTargetLane(laneId);
    if (targetLane.empty()) {
        std::cout << "****** [DIRECT OUTPUT] AccidentRsuApp::processStoppedVehicle - 无法确定避让车道，无法发送变道命令 ******" << std::endl;
        EV_ERROR << "****** [RSU] 无法确定避让车道，无法发送变道命令 ******" << endl;
        return;
    }
    std::cout << "****** [DIRECT OUTPUT] AccidentRsuApp::processStoppedVehicle - 已确定避让目标车道: " << targetLane << " ******" << std::endl;
    EV_INFO << "****** [RSU] 已确定避让目标车道: " << targetLane << " ******" << endl;

    // 2. 创建变道指令数据包
    veins::Coord accidentPosition(posX, posY);
    Packet* laneChangePacket = createLaneChangePacket(accidentPosition, laneId, targetLane);
    
    // 3. 将指令发送到服务器，由服务器进行分发
    L3Address serverAddr = L3AddressResolver().resolve("server");
    if (!serverAddr.isUnspecified()) {
        std::cout << "****** [DIRECT OUTPUT] AccidentRsuApp::processStoppedVehicle - 向服务器发送变道命令，等待分发到车辆 ******" << std::endl;
        EV_INFO << "****** [RSU] 向服务器发送变道命令，等待分发到车辆 ******" << endl;
        socket.sendTo(laneChangePacket, serverAddr, destPort);
        emit(laneChangeCommandSentSignal, 1);
        std::cout << "****** [DIRECT OUTPUT] AccidentRsuApp::processStoppedVehicle - 变道命令已发送 ******" << std::endl;
        EV_INFO << "****** [RSU] 变道命令已发送 ******" << endl;
    }
    else {
        std::cout << "****** [DIRECT OUTPUT] AccidentRsuApp::processStoppedVehicle - 无法解析服务器地址，无法发送变道命令 ******" << std::endl;
        EV_ERROR << "****** [RSU] 无法解析服务器地址，无法发送变道命令 ******" << endl;
        delete laneChangePacket;
    }
}

// 移除不再使用的函数
// void AccidentRsuApp::sendStopCommandToVehiclesOnLane(...) { ... }
// Packet* AccidentRsuApp::createAccidentStatusPacket(...) { ... }
// Packet* AccidentRsuApp::createStopCommandPacket(...) { ... }

void AccidentRsuApp::finish()
{
    // 调用基类的finish方法确保统计收集完整
    UdpBasicApp::finish();
    
    // 记录自定义应用层指标
    int totalAlarmsSent = 0;
    for (const auto& pair : stoppedVehicles_) {
        if (pair.second.alarmSent) {
            totalAlarmsSent++;
        }
    }
    
    recordScalar("accidentsDetected", totalAlarmsSent);
    
    EV_INFO << "AccidentRsuApp检测到 " << totalAlarmsSent << " 起事故" << endl;
}