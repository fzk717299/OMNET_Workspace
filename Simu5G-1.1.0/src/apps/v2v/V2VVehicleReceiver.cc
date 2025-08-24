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

#include "V2VVehicleReceiver.h"
#include <inet/common/ModuleAccess.h>

Define_Module(V2VVehicleReceiver);

using namespace std;
using namespace inet;

V2VVehicleReceiver::~V2VVehicleReceiver()
{
}

void V2VVehicleReceiver::initialize(int stage)
{
    if (stage != inet::INITSTAGE_APPLICATION_LAYER)
        return;

    int port = par("localPort");
    EV << "V2VVehicleReceiver::initialize - binding to port: local:" << port << endl;
    if (port != -1)
    {
        socket.setOutputGate(gate("socketOut"));
        socket.bind(port);

        // for multicast support
        inet::IInterfaceTable *ift = inet::getModuleFromPar<inet::IInterfaceTable>(par("interfaceTableModule"), this);
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
    }
}

void V2VVehicleReceiver::handleMessage(cMessage *msg)
{

    if (msg->isSelfMessage())
        return;
    Packet* pPacket = check_and_cast<Packet*>(msg);

    if (pPacket == 0)
    {
        throw cRuntimeError("V2VVehicleReceiver::handleMessage - FATAL! Error when casting to inet packet");
    }

    auto v2vm = pPacket->popAtFront<V2VMessage1>();
    EV << "#################################################################################"<< endl;
    EV << "########################  Show V2V Message Transmission  ########################"<< endl;
    delete pPacket;
}


void V2VVehicleReceiver::finish()
{
}

