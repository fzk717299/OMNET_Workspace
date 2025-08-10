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

#include "V2VVehicleSender.h"

#include <cmath>
#include <inet/common/TimeTag_m.h>
#include <inet/common/ModuleAccess.h>

#define round(x) floor((x) + 0.5)

Define_Module(V2VVehicleSender);
using namespace inet;

V2VVehicleSender::V2VVehicleSender()
{
}

V2VVehicleSender::~V2VVehicleSender()
{
}

void V2VVehicleSender::initialize(int stage)
{
    EV << "Vehicle Sender initialize: stage ***" << stage << endl;

    cSimpleModule::initialize(stage);

    // avoid multiple initializations
    if (stage==inet::INITSTAGE_APPLICATION_LAYER){ // stage==11
        EV << "V2VVehicleSender::initialize: stage *INITSTAGE_APPLICATION_LAYER**" << INITSTAGE_APPLICATION_LAYER << endl;

        size_ = par("PacketSize");

        localPort_ = par("localPort");
        destPort_ = par("destPort");

        socket.setOutputGate(gate("socketOut"));
        socket.bind(localPort_);

        int tos = par("tos");
        if (tos != -1)
            socket.setTos(tos);

        // for multicast support
        inet::IInterfaceTable *ift = inet::getModuleFromPar< inet::IInterfaceTable >(par("interfaceTableModule"), this);
        inet::MulticastGroupList mgl = ift->collectMulticastGroups();
        socket.joinLocalMulticastGroups(mgl);

        // if the multicastInterface parameter is not empty, set the interface explicitly
        const char *multicastInterface = par("multicastInterface");
        if (multicastInterface[0]) {
            InterfaceEntry *ie = ift->findInterfaceByName(multicastInterface);
            if (!ie)
                throw cRuntimeError("Wrong multicastInterface setting: no interface named \"%s\"", multicastInterface);
            socket.setMulticastOutputInterface(ie->getInterfaceId());
        }

        maxV2VDistande = par("maxV2VDistande");
        initTraffic_ = new cMessage("initTraffic");
        VehicleId = getParentModule()->getIndex();
        EV << "VehicleId = " << VehicleId << endl;

        //车辆基本信息初始化:
        sendV2VMessage = new cMessage("sendV2VMessage");
        initTrafficMsg = new cMessage("initTrafficMsg");

        if (simTime() < simuStartTime)
            scheduleAt(simuStartTime, initTrafficMsg);
        else
            scheduleAt(simTime(), initTrafficMsg);
    }
    else
        return ;

}

void V2VVehicleSender::handleMessage(cMessage *msg)
{
    EV << "V2VVehicleSender::handleMessage, name = " << msg->getName() << endl;
    if (msg->isSelfMessage())
    {
        if(!strcmp(msg->getName(), "initTrafficMsg")){
            initTraffic();
        }
        else if (!strcmp(msg->getName(), "sendV2VMessage")){
            EV << "##### SelfMessage sendV2VMessage #####" << endl;
            Packet* packet = new inet::Packet("V2VMessage");
            auto v2vm = makeShared<V2VMessage1>();
            v2vm->setSenderId(VehicleId);
            v2vm->setDestId(destId);
            v2vm->setSendTime(simTime());
            v2vm->setChunkLength(B(size_));
            v2vm->addTag<CreationTimeTag>()->setCreationTime(simTime());
            packet->insertAtBack(v2vm);

            destAddress_ = inet::L3AddressResolver().resolve(par("destAddress").stringValue());
            socket.sendTo(packet, destAddress_, destPort_);
            EV << "Vehilce:" << VehicleId << "Send V2V Message, Addr = "  << destAddress_<< ":" << destPort_ << endl;

            scheduleAt(simTime() + 0.1, sendV2VMessage);
            return ;
        }
        else
            return;
    }
    else if (!strcmp(msg->getName(), "ERROR")){
            EV << "##### V2VVehicleSender::handleMessage Error #####" << endl;
            return;
    }
    // not self message, lower message
    else{
        Packet* pPacket = check_and_cast<Packet*>(msg);
        if (pPacket == 0)
        {
            throw cRuntimeError("V2VVehicleSender::handleMessage - FATAL! Error when casting to inet packet");
        }
        return ;
    }
}

void V2VVehicleSender::initTraffic()
{
    if (VehicleId == 30)
    initTraffic_V2V();
}

void V2VVehicleSender::initTraffic_V2V(){
      //发送V2V message
      SimTime frameStart = SimTime((double)((int)(simTime().raw()/SimTime(frameLength).raw()))/10);
      useSlot = VehicleId + 1;
      SimTime sendTime = simuStartTime;  // 程序开始的时间
      SimTime sendTime_offset = useSlot * slotLength ; //beaco的发送时隙
      SimTime V2RSimFrame =  SimTime(0.05) ; //V2R 传输在后要半个frame
      if(simTime() >= simuStartTime)
          sendTime = simTime();

      EV << "VehicleId = " << VehicleId << "*************************" << endl;
      EV << "useSlot = " << useSlot << std::endl;
      EV << "useSlot * slotLength = " << useSlot * slotLength << endl;
      if (VehicleId == 30){
          scheduleAt(sendTime + 0.02 + sendTime_offset, sendV2VMessage);
//              scheduleAt(10.3999, sendV2VMessage);
          EV << "destId = " << destId << endl;
          EV << "destAddress = " << destAddress_.str() << endl;
          EV << "schedule send V2V Message. " << endl;
      }
}


