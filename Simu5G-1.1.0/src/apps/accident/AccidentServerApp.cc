//
// 事故服务器应用实现
//

#include "apps/accident/AccidentServerApp.h"
#include "inet/common/packet/chunk/Chunk.h"
#include "inet/common/packet/Packet.h"
#include "inet/common/Units.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"
#include "inet/common/Ptr.h"
#include "inet/networklayer/common/L3AddressTag_m.h"
#include "inet/networklayer/contract/ipv4/Ipv4Address.h"
#include "veins_inet/VeinsInetMobility.h"
#include "veins/base/utils/Coord.h"

#include <iostream> // 添加标准输出头文件

using namespace inet::units::values;
using namespace veins;
using namespace omnetpp;
using namespace inet;

Define_Module(AccidentServerApp);

// 统计信号声明和注册 - 只保留变道相关的
simsignal_t AccidentServerApp::laneChangeCommandForwardedSignal = registerSignal("laneChangeCommandForwarded");

AccidentServerApp::AccidentServerApp() :
    UdpBasicApp(),
    processedMsgs(0),
    processingDelay(0.05)
{
}

AccidentServerApp::~AccidentServerApp()
{
    // 清理资源（如果有）
}

void AccidentServerApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        // 读取参数
        processingDelay = par("processingDelay").doubleValue();
        
        // 初始化处理消息计数
        processedMsgs = 0;
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        
        EV_INFO << "\n\n\n****** [SERVER " << getParentModule()->getFullName() << "] Initialized ******\n\n\n" << endl;
        EV_INFO << "AccidentServerApp initialized, processingDelay: " << processingDelay << "s" << endl;
        getTraCIInterface();
    }
}

void AccidentServerApp::processPacket(Packet *pk)
{
    // 调用父类方法处理基本统计
    UdpBasicApp::processPacket(pk);
    
    // 尝试解析为AccidentPacket
    try {
        // 使用更安全的方式检查和获取数据
        const auto& chunk = pk->peekData<Chunk>();
        if (chunk) {
            // 尝试将chunk转换为AccidentPacket
            const auto accidentPkt = dynamicPtrCast<const AccidentPacket>(chunk);
            if (accidentPkt) {
                EV_INFO << "Server received AccidentPacket, type: " << accidentPkt->getMsgType() << endl;
                
                // 仅处理变道命令
                if (accidentPkt->getMsgType() == ACC_LANE_CHANGE_CMD) {
                    processLaneChangeCommand(accidentPkt.get());
                }
                else {
                    EV_WARN << "Received unknown or unsupported AccidentPacket type: " << accidentPkt->getMsgType() << endl;
                }
                
                processedMsgs++;
            }
        }
    }
    catch (const std::exception& e) {
        EV_WARN << "Error processing packet: " << e.what() << endl;
    }
}

std::vector<std::string> AccidentServerApp::getVehiclesOnLane(const std::string& laneId)
{
    std::vector<std::string> vehicles;
    
    // 获取VeinsInetManager
    cModule* manager = getModuleByPath("<root>.veinsManager");
    if (!manager) {
        EV_ERROR << "无法找到veinsManager模块" << endl;
        return vehicles;
    }
    
    // 获取TraCIScenarioManager
    TraCIScenarioManager* scenarioManager = dynamic_cast<TraCIScenarioManager*>(manager);
    if (!scenarioManager) {
        EV_ERROR << "veinsManager不是TraCIScenarioManager类型" << endl;
        return vehicles;
    }
    
    // 获取命令接口
    auto traci = scenarioManager->getCommandInterface();
    if (!traci) {
        EV_ERROR << "无法获取TraCI命令接口" << endl;
        return vehicles;
    }
    
    // 获取所有管理的车辆
    std::map<std::string, cModule*> managedHosts = scenarioManager->getManagedHosts();
    
    // 遍历所有车辆，检查它们是否在目标车道上
    for (const auto& pair : managedHosts) {
        const std::string& sumoId = pair.first;
        try {
            auto vehicle = traci->vehicle(sumoId);
            std::string currentLaneId = vehicle.getLaneId();
            
            // 检查车辆是否在目标车道上
            if (currentLaneId == laneId) {
                vehicles.push_back(sumoId);
                EV_INFO << "在车道 " << laneId << " 上找到车辆: " << sumoId << endl;
            }
        }
        catch (const std::exception& e) {
            EV_WARN << "获取车辆 " << sumoId << " 信息时出错: " << e.what() << endl;
        }
    }
    
    return vehicles;
}

std::string AccidentServerApp::mapSumoIdToOmnetName(const std::string& sumoId)
{
    cModule* module = mapSumoIdToModule(sumoId);
    if (module) {
        return module->getFullName();
    }
    EV_WARN << "Could not find OMNeT++ module for SUMO ID: " << sumoId << endl;
    return "";
}

void AccidentServerApp::processLaneChangeCommand(const AccidentPacket* data)
{
    std::cout << "\n\n\n****** [DIRECT OUTPUT] AccidentServerApp::processLaneChangeCommand - 开始处理 ******\n\n\n" << std::endl;
    
    if (!getTraCIInterface()) {
        std::cout << "****** [DIRECT OUTPUT] AccidentServerApp::processLaneChangeCommand - TraCI接口不可用 ******" << std::endl;
        EV_ERROR << "****** [服务器] TraCI接口不可用，无法处理变道命令 ******" << endl;
        return;
    }

    std::string originalLane = data->getOriginalLaneId();
    std::string targetLane = data->getTargetLaneId();
    veins::Coord accidentPos(data->getAccidentPosX(), data->getAccidentPosY());

    std::cout << "****** [DIRECT OUTPUT] AccidentServerApp::processLaneChangeCommand - 原始车道: " << originalLane 
              << ", 目标车道: " << targetLane 
              << ", 事故位置: (" << accidentPos.x << ", " << accidentPos.y << ") ******" << std::endl;
    
    EV_INFO << "\n==================================================================" << endl;
    EV_INFO << "****** [服务器] 接收到变道命令！原始车道: " << originalLane << " ******" << endl;
    EV_INFO << "****** 事故位置: (" << accidentPos.x << ", " << accidentPos.y << ") ******" << endl;
    EV_INFO << "****** 目标车道: " << targetLane << " ******" << endl;
    EV_INFO << "==================================================================" << endl;

    try {
        // --- 按route转发数据包给route 2和9的车辆 ---
        EV_INFO << "****** [服务器][通信轨道] 开始查找route '2'和'9'上的车辆进行数据包转发 ******" << endl;

        std::vector<std::string> targetRouteIds = {"2", "9"};
        auto managedHosts = manager_->getManagedHosts();
        int forwardCount = 0;

        for (const auto& pair : managedHosts) {
            const std::string& vehicleId = pair.first;
            cModule* targetModule = pair.second;
            try {
                std::string currentRouteId = traci_->vehicle(vehicleId).getRouteId();
                // 检查车辆是否在目标路线列表中
                bool shouldSendPacket = false;
                for (const std::string& targetRoute : targetRouteIds) {
                    if (currentRouteId == targetRoute) {
                        shouldSendPacket = true;
                        break;
                    }
                }
                
                if (shouldSendPacket) {
                    // 检查是否是事故车辆，如果是则跳过
                    if (vehicleId == "0") {  // car[0]是事故车辆
                        std::cout << "****** [DIRECT OUTPUT] AccidentServerApp - 车辆 " << vehicleId << " 是事故车辆，不发送变道命令 ******" << std::endl;
                        EV_INFO << "****** [服务器] 车辆 " << vehicleId << " 是事故车辆，不发送变道命令 ******" << endl;
                        continue;
                    }
                    
                    forwardCount++;
                    if (targetModule) {
                        std::cout << "****** [DIRECT OUTPUT] [通信轨道] 向车辆 " << vehicleId 
                                  << " 转发数据包 ******" << std::endl;
                        EV_INFO << "****** [服务器][通信轨道] 向车辆 " << vehicleId 
                                << " 转发数据包 ******" << endl;
                        Packet* fwdPacket = createForwardedLaneChangePacket(data);
                        
                        // 确保目标地址解析正确
                        std::string fullModuleName = targetModule->getFullName();
                        L3Address destAddr;
                        try {
                            destAddr = L3AddressResolver().resolve(fullModuleName.c_str());
                            std::cout << "****** [DIRECT OUTPUT] 成功解析 " << fullModuleName << " 的地址: " << destAddr.str() << " ******" << std::endl;
                        } catch (const std::exception& e) {
                            std::cout << "****** [DIRECT OUTPUT] 解析 " << fullModuleName << " 的地址时出错: " << e.what() << " ******" << std::endl;
                            EV_ERROR << "解析 " << fullModuleName << " 的地址时出错: " << e.what() << endl;
                            continue;
                        }
                        
                        try {
                            socket.sendTo(fwdPacket, destAddr, destPort);
                            emit(laneChangeCommandForwardedSignal, 1);
                            std::cout << "****** [DIRECT OUTPUT] 变道命令已发送到 " << fullModuleName << " (地址: " << destAddr.str() << ") ******" << std::endl;
                            EV_INFO << "****** [服务器] 变道命令已发送到 " << targetModule->getFullName() << " (地址: " << destAddr << ") ******" << endl;
                        } catch (const std::exception& e) {
                            std::cout << "****** [DIRECT OUTPUT] 发送变道命令到 " << fullModuleName << " 时出错: " << e.what() << " ******" << std::endl;
                            EV_ERROR << "发送变道命令到 " << fullModuleName << " 时出错: " << e.what() << endl;
                        }
                    } else {
                        std::cout << "****** [DIRECT OUTPUT] 无法找到车辆 " << vehicleId << " 对应的模块 ******" << std::endl;
                        EV_ERROR << "****** [服务器] 无法找到车辆 " << vehicleId << " 对应的模块 ******" << endl;
                    }
                }
            } catch (const std::exception& e) {
                EV_ERROR << "获取车辆 " << vehicleId << " 位置时出错: " << e.what() << endl;
            }
        }
        
        if (forwardCount == 0) {
            std::cout << "****** [DIRECT OUTPUT] 没有在事故点前方的车辆需要变道 ******" << std::endl;
            EV_INFO << "****** [服务器] 没有在事故点前方的车辆需要变道 ******" << endl;
        } else {
            std::cout << "****** [DIRECT OUTPUT] 共有 " << forwardCount << " 辆车在事故点前方，已发送变道命令 ******" << std::endl;
            EV_INFO << "****** [服务器] 共有 " << forwardCount << " 辆车在事故点前方，已发送变道命令 ******" << endl;
        }
    }
    catch (const std::exception& e) {
        EV_ERROR << "****** [服务器] 处理变道命令时出错: " << e.what() << " ******" << endl;
    }
}

Packet* AccidentServerApp::createForwardedLaneChangePacket(const AccidentPacket* originalData)
{
    auto payload = makeShared<AccidentPacket>(*originalData);
    
    // 设置正确的数据包长度，确保单位一致
    payload->setChunkLength(B(256)); // 使用固定大小，确保与配置中的messageLength一致
    
    auto pk = new Packet("ForwardedLaneChangeCommand");
    pk->insertAtBack(payload);
    
    std::cout << "****** [DIRECT OUTPUT] AccidentServerApp::createForwardedLaneChangePacket - 创建数据包，大小: " 
              << pk->getByteLength() << " 字节 ******" << std::endl;
    
    return pk;
}

cModule* AccidentServerApp::mapSumoIdToModule(const std::string& sumoId)
{
    if (!manager_)
        return nullptr;
    
    // getManagedHost方法不存在，改用getManagedHosts()然后查找
    auto& managedHosts = manager_->getManagedHosts();
    auto it = managedHosts.find(sumoId);
    if (it != managedHosts.end()) {
        return it->second;
    }
    return nullptr;
}

bool AccidentServerApp::getTraCIInterface()
{
    if (traci_)
        return true;

    // TODO make veinsManager module path configurable
    cModule* managerModule = getSimulation()->getModuleByPath("<root>.veinsManager");
    if (managerModule) {
        manager_ = dynamic_cast<veins::TraCIScenarioManager*>(managerModule);
        if (manager_) {
            traci_ = manager_->getCommandInterface();
            if (traci_) {
                return true;
            }
        }
    }
    EV_ERROR << "TraCI interface not found." << endl;
    return false;
}

void AccidentServerApp::finish()
{
    // 调用基类的finish方法确保统计收集完整
    UdpBasicApp::finish();
    
    // 记录自定义应用层指标
    recordScalar("messagesProcessed", processedMsgs);
    
    EV_INFO << "AccidentServerApp处理了 " << processedMsgs << " 条消息" << endl;
}