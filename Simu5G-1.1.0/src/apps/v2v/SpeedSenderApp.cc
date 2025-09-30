//
//                  Simu5G
//
// Authors: Giovanni Nardini, Giovanni Stea, Antonio Virdis (University of Pisa)
//
// This file is part of a software released under the license included in file
// "license.pdf". Please read LICENSE and README files before using it.
// The above files and the present reference are part of the software itself,
// and cannot be removed from it.
//

#include "SpeedSenderApp.h"

#include <cmath>
#include <inet/common/TimeTag_m.h>
#include <inet/common/ModuleAccess.h>
#include <inet/common/packet/Packet.h>
#include <inet/networklayer/common/L3AddressResolver.h>

Define_Module(SpeedSenderApp);
using namespace inet;

SpeedSenderApp::SpeedSenderApp()
{
    sendSpeedTimer_ = nullptr;
}

SpeedSenderApp::~SpeedSenderApp()
{
    cancelAndDelete(sendSpeedTimer_);
}

void SpeedSenderApp::initialize(int stage)
{
    cSimpleModule::initialize(stage);

    // 避免重复初始化
    if (stage == inet::INITSTAGE_APPLICATION_LAYER)
    {
        EV << "SpeedSenderApp初始化..." << endl;
        
        // 读取参数
        localPort_ = par("localPort");
        destPort_ = par("destPort");
        packetSize_ = par("PacketSize");
        sendInterval_ = par("sendInterval");
        startTime_ = par("startTime");
        
        // 获取车辆ID
        frontCarId_ = par("frontCarId");
        if (frontCarId_ == -1) {
            // 默认使用模块索引作为ID
            frontCarId_ = getParentModule()->getIndex();
        }
        
        rearCarId_ = par("rearCarId");
        
        // 初始化UDP套接字
        socket.setOutputGate(gate("socketOut"));
        socket.bind(localPort_);
        
        int tos = par("tos");
        if (tos != -1)
            socket.setTos(tos);
            
        // 多播支持
        IInterfaceTable *ift = getModuleFromPar<IInterfaceTable>(par("interfaceTableModule"), this);
        MulticastGroupList mgl = ift->collectMulticastGroups();
        socket.joinLocalMulticastGroups(mgl);
        
        // 如果指定了多播接口，则设置
        const char *multicastInterface = par("multicastInterface");
        if (multicastInterface[0]) {
            InterfaceEntry *ie = ift->findInterfaceByName(multicastInterface);
            if (!ie)
                throw cRuntimeError("错误的多播接口设置：找不到名为\"%s\"的接口", multicastInterface);
            socket.setMulticastOutputInterface(ie->getInterfaceId());
        }
        
        // 解析目标地址
        destAddress_ = L3AddressResolver().resolve(par("destAddress"));
        
        // 获取移动性模块，用于获取位置和速度信息
        mobility_ = check_and_cast<veins::VeinsInetMobility*>(getParentModule()->getSubmodule("mobility"));
        if (!mobility_) {
            EV << "警告: 无法找到移动性模块，将无法获取真实的位置和速度信息" << endl;
        }
        
        // 注册信号
        sentPacketSignal = registerSignal("sentPackets");
        
        // 创建并调度第一个发送事件，考虑开始时间
        sendSpeedTimer_ = new cMessage("sendSpeedTimer");
        scheduleAt(simTime() + startTime_, sendSpeedTimer_);
        
        EV << "将在 " << simTime() + startTime_ << " 开始发送速度信息" << endl;
        
        EV << "SpeedSenderApp初始化完成，前车ID: " << frontCarId_ 
           << "，后车ID: " << (rearCarId_ == -1 ? "广播" : std::to_string(rearCarId_)) << endl;
    }
}

void SpeedSenderApp::handleMessage(cMessage *msg)
{
    if (msg->isSelfMessage())
    {
        if (msg == sendSpeedTimer_)
        {
            // 发送速度信息
            sendSpeedInfo();
            
            // 安排下一次发送
            scheduleAt(simTime() + sendInterval_, sendSpeedTimer_);
        }
    }
    else
    {
        // 接收到外部消息（可能是来自下层的控制消息）
        delete msg;
    }
}

void SpeedSenderApp::sendSpeedInfo()
{
    // 创建一个新的数据包
    auto packet = new inet::Packet("SpeedInfo");
    
    // 创建速度信息消息
    auto speedMsg = makeShared<SpeedInfoMessage>();
    
    // 设置发送者和接收者ID
    speedMsg->setSenderId(frontCarId_);
    speedMsg->setDestId(rearCarId_);
    
    // 设置发送时间
    speedMsg->setSendTime(simTime());
    
    // 如果有移动性模块，获取真实的位置和速度信息
    if (mobility_) {
        inet::Coord position = mobility_->getCurrentPosition();
        inet::Coord speed = mobility_->getCurrentVelocity();
        
        // 设置位置信息
        speedMsg->setPosX(position.x);
        speedMsg->setPosY(position.y);
        speedMsg->setPosZ(position.z);
        
        // 计算速度大小（m/s）
        double speedValue = std::sqrt(speed.x*speed.x + speed.y*speed.y + speed.z*speed.z);
        speedMsg->setSpeed(speedValue);
        
        // 设置行驶方向（弧度转角度）
        double direction = std::atan2(speed.y, speed.x) * 180.0 / M_PI;
        speedMsg->setDirection(direction);
        
        // 加速度暂设为0（可以扩展以计算实时加速度）
        speedMsg->setAcceleration(0);
        
        EV << "发送速度信息: 位置(" << position.x << "," << position.y << ")，速度: " 
           << speedValue << " m/s，方向: " << direction << "度" << endl;
    } else {
        // 如果没有移动性模块，设置默认值
        speedMsg->setPosX(0);
        speedMsg->setPosY(0);
        speedMsg->setSpeed(0);
        speedMsg->setDirection(0);
        EV << "警告: 无移动性模块，使用默认位置和速度信息" << endl;
    }
    
    // 设置数据包大小
    speedMsg->setChunkLength(B(packetSize_));
    
    // 添加创建时间标签
    speedMsg->addTag<CreationTimeTag>()->setCreationTime(simTime());
    
    // 将消息放入数据包
    packet->insertAtBack(speedMsg);
    
    // 发送数据包
    socket.sendTo(packet, destAddress_, destPort_);
    
    // 触发信号
    emit(sentPacketSignal, packet);
    
    EV << "车辆[" << frontCarId_ << "]发送速度信息到地址 " << destAddress_ << ":" << destPort_ << endl;
}

void SpeedSenderApp::finish()
{
    // 可以添加统计信息收集
}
