//
// Traffic Light RSU Application
//

#include "apps/trafficlight/TrafficLightRsuApp.h"
#include "inet/common/ModuleAccess.h"
#include "inet/common/TimeTag_m.h"
#include "inet/common/packet/chunk/ByteCountChunk.h"

// For TraCI access - needs to be adapted based on veins integration
#include "veins/modules/mobility/traci/TraCIScenarioManager.h"
#include "veins/modules/mobility/traci/TraCICommandInterface.h"

namespace inet {

Define_Module(TrafficLightRsuApp);

simsignal_t TrafficLightRsuApp::tlStateChangedSignal = registerSignal("tlStateChanged");

TrafficLightRsuApp::TrafficLightRsuApp() : 
    traciModulePath("veinsManager"),
    checkInterval(1.0),
    tlCheckTimer(nullptr),
    traciModule(nullptr),
    traciInitialized(false),
    numSentTlUpdates(0)
{
}

TrafficLightRsuApp::~TrafficLightRsuApp()
{
    cancelAndDelete(tlCheckTimer);
}

void TrafficLightRsuApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);
    
    if (stage == INITSTAGE_LOCAL) {
        // Read parameters
        traciModulePath = par("traciModulePath").stringValue();
    // Extract destination address and port
    destAddr = L3AddressResolver().resolve(par("destAddresses").stringValue());
    destPort = par("destPort");
        checkInterval = par("checkInterval").doubleValue();
        
        // Parse monitored traffic lights
        const char* tlsStr = par("monitoredTLs").stringValue();
        cStringTokenizer tokenizer(tlsStr, ",");
        while (tokenizer.hasMoreTokens()) {
            monitoredTLs.push_back(tokenizer.nextToken());
        }
        
        EV_INFO << "TrafficLightRsuApp will monitor " << monitoredTLs.size() 
               << " traffic lights with check interval " << checkInterval << "s" << endl;
        
        // Initialize timer
        tlCheckTimer = new cMessage("tlCheckTimer");
    }
    else if (stage == INITSTAGE_APPLICATION_LAYER) {
        if (monitoredTLs.size() > 0) {
            // Start traffic light checking after a small delay
            scheduleAt(simTime() + 2.0, tlCheckTimer);
        }
    }
}

void TrafficLightRsuApp::handleMessageWhenUp(cMessage *msg)
{
    if (msg == tlCheckTimer) {
        handleTrafficLightTimer();
    }
    else {
        UdpBasicApp::handleMessageWhenUp(msg);
    }
}

void TrafficLightRsuApp::handleTrafficLightTimer()
{
    // Initialize TraCI connection if needed
    if (!traciInitialized) {
        traciInitialized = getTraCIConnection();
    }
    
    if (traciInitialized) {
        checkTrafficLightStates();
    }
    else {
        EV_WARN << "TraCI connection not initialized yet, trying again later" << endl;
    }
    
    // Reschedule the timer
    scheduleAt(simTime() + checkInterval, tlCheckTimer);
}

bool TrafficLightRsuApp::getTraCIConnection()
{
    // Find TraCI module
    traciModule = getModuleByPath(traciModulePath.c_str());
    if (!traciModule) {
        EV_ERROR << "Could not find TraCI module at path: " << traciModulePath << endl;
        return false;
    }
    
    EV_INFO << "Found TraCI module: " << traciModule->getFullName() << endl;
    return true;
}

void TrafficLightRsuApp::checkTrafficLightStates()
{
    // Attempt to get TraCI Scenario Manager
    auto* manager = dynamic_cast<veins::TraCIScenarioManager*>(traciModule);
    if (!manager) {
        EV_ERROR << "TraCI module is not a TraCIScenarioManager" << endl;
        return;
    }
    
    // Get TraCI Command Interface
    auto* traci = manager->getCommandInterface();
    if (!traci) {
        EV_ERROR << "Could not get TraCI Command Interface" << endl;
        return;
    }
    
    // Check each monitored traffic light
    for (const std::string& tlId : monitoredTLs) {
        try {
            // Get traffic light object
            auto traciTL = traci->trafficlight(tlId);
            
            // Get current state
            std::string state = traciTL.getCurrentState();
            
            // Get position (approximation)
            // In a real implementation, we would get exact coordinates
            double posX = 0.0;
            double posY = 0.0;
            try {
                // Try to get junction position as approximation
                auto junction = traci->junction(tlId);
                std::list<veins::Coord> shape = junction.getShape();
                if (!shape.empty()) {
                    // Use the first point of the shape
                    posX = shape.front().x;
                    posY = shape.front().y;
                }
            }
            catch (...) {
                // Fallback to fixed position
                posX = 500.0;  // Example fixed position
                posY = 500.0;
            }
            
            // Get remaining duration (approximation)
            double remainingTime = 30.0;  // Default value
            try {
                remainingTime = traciTL.getAssumedNextSwitchTime().dbl() - simTime().dbl();
                if (remainingTime < 0) remainingTime = 30.0;
            }
            catch (...) {
                // Keep default value
            }
            
            // Create and send packet
            Packet* packet = createTLStatePacket(tlId, state, posX, posY, remainingTime);
            if (packet) {
                socket.sendTo(packet, destAddr, destPort);
                numSentTlUpdates++;
                emit(tlStateChangedSignal, (long)1);
                
                EV_INFO << "Sent traffic light state for " << tlId 
                       << ": " << state << ", remaining time: " << remainingTime << "s" << endl;
            }
        }
        catch (std::exception& e) {
            EV_ERROR << "Error getting traffic light state for " << tlId 
                    << ": " << e.what() << endl;
        }
    }
}

Packet* TrafficLightRsuApp::createTLStatePacket(const std::string& tlId,
                                             const std::string& state,
                                             double posX, double posY,
                                             double remainingTime)
{
    B payloadLength = B(par("messageLength"));
    
    // Create a new packet with TrafficLightPacket payload
    Packet *packet = new Packet("trafficLightInfo");
    const auto& payload = makeShared<TrafficLightPacket>();
    
    // Set traffic light data
    payload->setTrafficLightId(tlId.c_str());
    payload->setState(state.c_str());
    payload->setTimestamp(simTime().dbl());
    payload->setPosition_x(posX);
    payload->setPosition_y(posY);
    payload->setRemainingTime(remainingTime);
    
    // Set chunk length and insert payload
    payload->setChunkLength(payloadLength);
    payload->addTag<CreationTimeTag>()->setCreationTime(simTime());
    packet->insertAtBack(payload);
    
    return packet;
}

void TrafficLightRsuApp::finish()
{
    UdpBasicApp::finish();
    
    // Record statistics
    recordScalar("numSentTlUpdates", numSentTlUpdates);
    
    EV_INFO << "TrafficLightRsuApp sent " << numSentTlUpdates 
           << " traffic light updates" << endl;
}

} // namespace inet
