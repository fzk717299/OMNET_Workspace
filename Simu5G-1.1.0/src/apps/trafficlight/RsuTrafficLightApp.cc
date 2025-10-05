//
// RsuTrafficLightApp.cc
//

#include "RsuTrafficLightApp.h"
#include "inet/common/packet/Packet.h"

Define_Module(RsuTrafficLightApp);

using namespace omnetpp;
using namespace inet;

void RsuTrafficLightApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        EV_INFO << "RsuTrafficLightApp initialized" << endl;
    }
}

void RsuTrafficLightApp::handleMessageWhenUp(cMessage *msg)
{
    // Let UdpBasicApp handle the message (including self-messages for periodic sending)
    UdpBasicApp::handleMessageWhenUp(msg);
}

Packet *RsuTrafficLightApp::createPacket()
{
    // Create our custom TrafficLightPacket instead of the default UdpBasicApp packet
    auto packet = new Packet("TrafficLightPacket");
    auto chunk = makeShared<TrafficLightPacket>();
    
    // Set chunk length explicitly (like SpeedLimitRsuApp does)
    chunk->setChunkLength(B(par("messageLength")));
    
    // Set packet data
    chunk->setRsuId(getParentModule()->getId());
    chunk->setCreationTime(simTime());
    chunk->setLightState(0); // Placeholder value
    chunk->setTimeToChange(10.0); // Placeholder value
    
    packet->insertAtBack(chunk);
    return packet;
}