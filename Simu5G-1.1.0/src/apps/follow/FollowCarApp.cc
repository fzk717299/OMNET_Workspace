//
// 浜嬫晠杞﹁締搴旂敤瀹炵幇
//

#include "FollowCarApp.h"
#include "inet/common/ModuleAccess.h"
#include "inet/common/packet/Packet.h"
#include "inet/common/TimeTag_m.h"
#include "inet/networklayer/common/L3AddressTag_m.h"
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"

Define_Module(FollowCarApp);

// 静态信号定义 - 注意：必须单独定义静态成员变量
simsignal_t FollowCarApp::endToEndDelaySignal;
simsignal_t FollowCarApp::rcvdPkSignal;

FollowCarApp::FollowCarApp() {}

// --- Initialization ---
void FollowCarApp::initialize(int stage)
{
    UdpSink::initialize(stage);
    if (stage == inet::INITSTAGE_LOCAL) {
        // Get parameters
        safetyDistance_ = par("safetyDistance");
        maxSpeed_ = par("maxSpeed");
        // Initialize mobility pointer
        mobility_ = inet::getModuleFromPar<veins::VeinsInetMobility>(par("mobilityModule"), this);
        
        // 只在类第一次初始化时注册静态信号
        if (endToEndDelaySignal == SIMSIGNAL_NULL) {
            endToEndDelaySignal = registerSignal("endToEndDelay");
        }
        if (rcvdPkSignal == SIMSIGNAL_NULL) {
            rcvdPkSignal = registerSignal("rcvdPk");
        }
    }
}

void FollowCarApp::handleMessageWhenUp(cMessage *msg)
{
    // Pass timers and other messages to UdpSink
    UdpSink::handleMessageWhenUp(msg);
}

// --- Main Logic ---
void FollowCarApp::processPacket(Packet *packet)
{
    EV_INFO << "=========================================" << endl;
    EV_INFO << "[FollowCarApp] 收到UDP数据包，开始解析..." << endl;
    
    // 首先发出rcvdPk信号 - 发送1表示接收到一个数据包，而不是发送包对象本身
    emit(rcvdPkSignal, 1L);
    
    // 然后发出packetReceived信号 (继承自UdpSink)
    emit(packetReceivedSignal, packet);
    
    // 计算端到端延迟 - 使用与SpeedLimitCarApp相同的方法
    simtime_t delay = simTime() - packet->getCreationTime();
    emit(endToEndDelaySignal, delay);
    EV_INFO << "[FollowCarApp] End-to-end delay: " << delay << " s" << endl;
    
    // 尝试获取源地址（如果可用）
    auto addressTag = packet->findTag<inet::L3AddressInd>();
    if (addressTag) {
        EV_INFO << "[FollowCarApp] 数据包来源: " << addressTag->getSrcAddress() << endl;
    } else {
        EV_INFO << "[FollowCarApp] 数据包来源: 未知" << endl;
    }
    
    EV_INFO << "[FollowCarApp] 数据包名称: " << packet->getName() << endl;
    EV_INFO << "[FollowCarApp] 数据包大小: " << packet->getByteLength() << " 字节" << endl;
    
    // 尝试获取SUMO ID
    if (sumoId_.empty()) {
        sumoId_ = getSumoId();
        EV_INFO << "[FollowCarApp] 本车SUMO ID: " << sumoId_ << endl;
    }

    auto payload = packet->peekData<FollowPacket>();
    if (!payload) {
        EV_WARN << "[FollowCarApp] 非FollowPacket类型，丢弃。" << endl;
        delete packet;
        return;
    }

    EV_INFO << "[FollowCarApp] 解析完成：前车速度=" << payload->getLeaderSpeed()
            << " m/s，车距=" << payload->getDistance() << " m。" << endl;

    if (getTraCIInterface()) {
        double currentSpeed = traci_->vehicle(sumoId_).getSpeed();
        EV_INFO << "[FollowCarApp] 当前车速=" << currentSpeed << " m/s" << endl;
        EV_INFO << "[FollowCarApp] 开始根据策略调整车速..." << endl;
        adjustSpeed(payload->getLeaderSpeed(), payload->getDistance());
        EV_INFO << "[FollowCarApp] 处理完成。" << endl;
    } else {
        EV_ERROR << "[FollowCarApp] 无法获取TraCI接口，无法调整车速" << endl;
    }
    
    EV_INFO << "=========================================" << endl;

    delete packet;
}

void FollowCarApp::adjustSpeed(double leaderSpeed, double distance)
{
    try {
        if (sumoId_.empty()) {
            sumoId_ = getSumoId();
            EV_INFO << "[FollowCarApp] 绑定SUMO车辆ID=" << sumoId_ << endl;
        }

        double mySpeed = traci_->vehicle(sumoId_).getSpeed();
        EV_INFO << "[FollowCarApp] 当前车速=" << mySpeed << " m/s" << endl;

        // Condition 1: Leader stopped (e.g., at red light)
        if (leaderSpeed < 0.1) {
            // 如果领头车停止，跟随车也停止
            EV_INFO << "[FollowCarApp] 前车已停止（可能遇到红灯），执行停车，目标速度=0" << endl;
            traci_->vehicle(sumoId_).setSpeed(0);
            return;
        }
        // Condition 2: Leader restarted after stopping
        else if (mySpeed < 0.3 && leaderSpeed > 0.5) {
            // 如果跟随车当前停止，但领头车已经开始行驶，则跟随车也开始行驶
            double newSpeed = 10.0; // 缓慢启动，不要超过5m/s的初始速度
            EV_INFO << "[FollowCarApp] 前车已重新启动，跟随启动，目标速度=" << newSpeed << " m/s" << endl;
            traci_->vehicle(sumoId_).setSpeed(newSpeed);
            return;
        }

        // Condition 3: Decelerate if too close and faster than leader
        if (distance < safetyDistance_ && mySpeed > leaderSpeed) {
            double newSpeed = leaderSpeed * 0.9; // Set speed to be slightly less than leader's
            EV_INFO << "[FollowCarApp] 距离过近且车速高于前车，减速：" << mySpeed
                    << " -> " << newSpeed << " m/s" << endl;
            traci_->vehicle(sumoId_).setSpeed(newSpeed);
        }
        // Condition 4: Accelerate if safe to do so (to maintain traffic flow)
        else if (distance > safetyDistance_ * 1.2 && mySpeed < maxSpeed_) {
             // Gently accelerate, e.g., to match leader speed or up to maxSpeed
             double targetSpeed = std::min(maxSpeed_, leaderSpeed * 1.1);
             if (mySpeed < targetSpeed) {
                 EV_INFO << "[FollowCarApp] 距离安全，缓慢加速，目标速度=" << targetSpeed << " m/s" << endl;
                 traci_->vehicle(sumoId_).setSpeed(targetSpeed);
             }
        }
    }
    catch (const std::exception& e) {
        EV_ERROR << "[FollowCarApp] 调速出错：" << e.what() << "。车辆可能已离开仿真。" << endl;
    }
}


// --- Helper Methods ---
bool FollowCarApp::getTraCIInterface()
{
    if (!traci_) {
        cModule* managerModule = getSimulation()->getModuleByPath("<root>.veinsManager");
        if (managerModule) {
            auto* manager = dynamic_cast<veins::TraCIScenarioManager*>(managerModule);
            if (manager) {
                traci_ = manager->getCommandInterface();
            }
        }
        if (!traci_) {
            EV_ERROR << "TraCI interface not found." << endl;
            return false;
        }
    }
    return true;
}

std::string FollowCarApp::getSumoId()
{
    if (mobility_) {
        return mobility_->getExternalId();
    }
    return "";
}


// --- Lifecycle ---
void FollowCarApp::finish()
{
    UdpSink::finish();
}

FollowCarApp::~FollowCarApp()
{
    // No dynamic members to clean up
}