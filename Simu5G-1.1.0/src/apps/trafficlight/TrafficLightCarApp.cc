//
// Traffic Light Car Application
//

#include "apps/trafficlight/TrafficLightCarApp.h"
#include "inet/common/ModuleAccess.h"
#include "inet/common/TimeTag_m.h"
#include <cmath>

namespace inet {

Define_Module(TrafficLightCarApp);

simsignal_t TrafficLightCarApp::tlInfoReceivedSignal = registerSignal("tlInfoReceived");
simsignal_t TrafficLightCarApp::endToEndDelaySignal = registerSignal("endToEndDelay");

TrafficLightCarApp::TrafficLightCarApp() : 
    numReceivedTlUpdates(0)
{
}

TrafficLightCarApp::~TrafficLightCarApp()
{
}

void TrafficLightCarApp::initialize(int stage)
{
    UdpSink::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        // Register signals
        tlInfoReceivedSignal = registerSignal("tlInfoReceived");
        endToEndDelaySignal = registerSignal("endToEndDelay");
    }
}

void TrafficLightCarApp::processPacket(Packet *packet)
{
    // Process packet as normal UdpSink would
    UdpSink::processPacket(packet);
    
    // Extract and process traffic light information
    // Try to peek at the packet data
    try {
        auto tlPayload = packet->peekAtFront<TrafficLightPacket>();
        if (tlPayload) {
            processTLInfo(tlPayload.get(), packet->getArrivalTime());
        }
        else {
            EV_WARN << "Received packet is not a TrafficLightPacket" << endl;
        }
    }
    catch (std::exception& e) {
        EV_WARN << "Could not process packet: " << e.what() << endl;
    }
}

void TrafficLightCarApp::processTLInfo(const TrafficLightPacket* tlPacket, simtime_t arrivalTime)
{
    // Extract traffic light information
    std::string tlId = tlPacket->getTrafficLightId();
    std::string state = tlPacket->getState();
    double timestamp = tlPacket->getTimestamp();
    double posX = tlPacket->getPosition_x();
    double posY = tlPacket->getPosition_y();
    double remainingTime = tlPacket->getRemainingTime();
    
    // Calculate end-to-end delay
    double delay = arrivalTime.dbl() - timestamp;
    emit(endToEndDelaySignal, delay);
    
    // Store information
    TrafficLightInfo tlInfo;
    tlInfo.id = tlId;
    tlInfo.state = state;
    tlInfo.timestamp = timestamp;
    tlInfo.posX = posX;
    tlInfo.posY = posY;
    tlInfo.remainingTime = remainingTime;
    tlInfo.receivedTime = arrivalTime;
    
    tlInfoMap[tlId] = tlInfo;
    
    // Increment counter and emit signal
    numReceivedTlUpdates++;
    emit(tlInfoReceivedSignal, (long)1);
    
    // Log receipt of traffic light information
    EV_INFO << "Received traffic light info for " << tlId 
            << ", state: " << state
            << ", remaining time: " << remainingTime << "s"
            << ", delay: " << delay << "s" << endl;
    
    // React to the traffic light information
    reactToTrafficLight(tlInfo);
}

void TrafficLightCarApp::reactToTrafficLight(const TrafficLightInfo& tlInfo)
{
    // This method would implement vehicle behavior in response to traffic light
    // Such as slowing down for red lights or maintaining speed for green lights
    
    // Get our vehicle position (in a real implementation)
    double carX = 0.0;  // Would be obtained from mobility module
    double carY = 0.0;
    
    // Calculate distance to traffic light (simplified)
    double distance = std::sqrt(std::pow(carX - tlInfo.posX, 2) + 
                              std::pow(carY - tlInfo.posY, 2));
    
    // Example decision logic based on traffic light state and distance
    if (distance < 200.0) {  // If within 200m of traffic light
        if (tlInfo.state.find('r') != std::string::npos ||  // Contains red
            tlInfo.state.find('y') != std::string::npos) {  // Contains yellow
            
            // Would implement slowing down behavior
            EV_INFO << "Vehicle would slow down for " << tlInfo.id 
                   << " with state " << tlInfo.state << endl;
        }
        else if (tlInfo.state.find('g') != std::string::npos) {  // Contains green
            // Would implement maintaining speed behavior
            EV_INFO << "Vehicle would maintain speed for " << tlInfo.id 
                   << " with state " << tlInfo.state << endl;
        }
    }
}

void TrafficLightCarApp::finish()
{
    UdpSink::finish();
    
    // Record statistics
    recordScalar("numReceivedTlUpdates", numReceivedTlUpdates);
    
    EV_INFO << "TrafficLightCarApp received " << numReceivedTlUpdates 
           << " traffic light updates" << endl;
}

} // namespace inet
