//
// CarTrafficLightApp.cc
//

#include "CarTrafficLightApp.h"
#include "inet/common/packet/Packet.h"

Define_Module(CarTrafficLightApp);

using namespace omnetpp;
using namespace inet;

void CarTrafficLightApp::initialize(int stage)
{
    UdpSink::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        receivedPackets_ = registerSignal("receivedPackets");
        endToEndDelay_ = registerSignal("endToEndDelay");
        EV_INFO << "CarTrafficLightApp initialized" << endl;
    }
}

void CarTrafficLightApp::processPacket(Packet *packet)
{
    // Call parent class method first to handle basic UDP sink functionality
    UdpSink::processPacket(packet);
    
    // Process our custom TrafficLightPacket with proper serialization handling
    try {
        // Use peekData with PF_ALLOW_SERIALIZATION flag to avoid serialization issues
        auto chunk = packet->peekData<TrafficLightPacket>(Chunk::PF_ALLOW_SERIALIZATION);
        if (chunk) {
            simtime_t delay = simTime() - chunk->getCreationTime();
            EV_INFO << "Received TrafficLightPacket from RSU " << chunk->getRsuId()
                    << " with delay " << delay << "s." << endl;

            emit(receivedPackets_, 1);
            emit(endToEndDelay_, delay);
        }
    } catch (const std::exception& e) {
        EV_WARN << "Error processing TrafficLightPacket: " << e.what() << endl;
        // Fallback: just count the packet without detailed processing
        emit(receivedPackets_, 1);
    }
}