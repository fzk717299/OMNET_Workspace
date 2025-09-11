#include "FollowServerApp.h"
#include "inet/common/TagBase_m.h"
#include "inet/common/TimeTag_m.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "inet/transportlayer/udp/Udp.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"

using namespace veins;

Define_Module(FollowServerApp);

FollowServerApp::FollowServerApp() {}

// --- Initialization ---
void FollowServerApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);
    if (stage == inet::INITSTAGE_LOCAL) {
        // 使用followerCarId参数，这是SUMO中的车辆ID
        followerCarId_ = "follow_2";  // 默认值
        if (hasPar("followerCarId"))
            followerCarId_ = par("followerCarId").stringValue();
        
        EV_INFO << "Server: Initialized with followerCarId = " << followerCarId_ << endl;
    }
}

// --- Main Logic ---
void FollowServerApp::processPacket(Packet *pk)
{
    EV_INFO << "Server: Received packet from RSU, forwarding to follower car." << endl;

    // We simply forward the same payload to the follower car.
    // Create a new packet to forward the data.
    auto payload = pk->peekData<FollowPacket>();
    if (!payload) {
        EV_WARN << "Server: Received packet is not a FollowPacket. Discarding." << endl;
        delete pk;
        return;
    }

    // Create a new packet for forwarding
    auto newPayload = makeShared<FollowPacket>();
    newPayload->setLeaderSpeed(payload->getLeaderSpeed());
    newPayload->setDistance(payload->getDistance());
    newPayload->setChunkLength(payload->getChunkLength());
    
    Packet *forwardPacket = new Packet("FollowDataForward");
    forwardPacket->insertAtBack(newPayload);


    // 从其他场景学习：首先获取veinsManager并查找车辆模块
    cModule* manager = getSimulation()->getModuleByPath("<root>.veinsManager");
    if (!manager) {
        EV_ERROR << "Server: Could not find veinsManager module" << endl;
        delete forwardPacket;
        delete pk;
        return;
    }
    
    TraCIScenarioManager* scenarioManager = dynamic_cast<TraCIScenarioManager*>(manager);
    if (!scenarioManager) {
        EV_ERROR << "Server: veinsManager is not a TraCIScenarioManager" << endl;
        delete forwardPacket;
        delete pk;
        return;
    }
    
    // 直接使用followerCarId_作为SUMO ID，而不是尝试从destAddresses解析
    std::string sumoId = followerCarId_;
    
    EV_INFO << "Server: 查找跟随车，SUMO ID: " << sumoId << "（数据包只能发送给此车辆）" << endl;
    
    // 从SUMO ID映射到OMNeT++模块
    std::map<std::string, cModule*> managedHosts = scenarioManager->getManagedHosts();
    
    // 输出所有可用的车辆模块，用于调试
    EV_INFO << "Server: Available vehicles in simulation:" << endl;
    for (const auto& pair : managedHosts) {
        EV_INFO << "  - SUMO ID: " << pair.first << ", Module: " << pair.second->getFullName() << endl;
    }
    
    auto it = managedHosts.find(sumoId);
    
    if (it != managedHosts.end()) {
        cModule* targetModule = it->second;
        std::string fullModuleName = targetModule->getFullName();
        
        // 现在使用实际模块名称解析地址
        try {
            L3Address destAddr = L3AddressResolver().resolve(fullModuleName.c_str());
            socket.sendTo(forwardPacket, destAddr, destPort);
            EV_INFO << "Server: 成功转发数据包到跟随车辆 " << fullModuleName << " (SUMO ID: " << sumoId << ")" << endl;
            EV_INFO << "Server: 数据包内容 - 领头车速度: " << payload->getLeaderSpeed() << " m/s, 车距: " << payload->getDistance() << " m" << endl;
        }
        catch (const std::exception& e) {
            EV_ERROR << "Server: 无法解析地址 " << fullModuleName << ": " << e.what() << endl;
            delete forwardPacket;
        }
    }
    else {
        // 车辆模块尚未创建
        EV_WARN << "Server: 在t=" << simTime() << "s时未找到SUMO ID为" << sumoId << "的车辆" << endl;
        
        // 检查是否有任何car模块，但只是为了调试信息
        bool foundAnyCar = false;
        
        for (const auto& pair : managedHosts) {
            std::string moduleName = pair.second->getFullName();
            if (moduleName.find("car") != std::string::npos) {
                foundAnyCar = true;
                EV_INFO << "Server: 找到车辆模块: " << moduleName << " (SUMO ID: " << pair.first << ")" << endl;
                
                // 不再尝试发送给其他车辆，只记录日志
                if (pair.first != sumoId) {
                    EV_INFO << "Server: 发现其他车辆 " << moduleName << "，但数据包只能发送给指定的跟随车 " << sumoId << endl;
                }
            }
        }
        
        if (!foundAnyCar) {
            EV_WARN << "Server: 当前仿真中没有任何车辆模块" << endl;
        }
        
        delete forwardPacket;
    }

    // Original packet is no longer needed
    delete pk;
}


// --- Lifecycle ---
FollowServerApp::~FollowServerApp()
{
    // No dynamic members to clean up
}