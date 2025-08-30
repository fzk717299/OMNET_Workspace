//
// Traffic Light RSU Application
//
// Monitors traffic lights in SUMO and sends updates to vehicles
//

#ifndef __TRAFFICLIGHTRSUAPP_H_
#define __TRAFFICLIGHTRSUAPP_H_

#include <string>
#include <vector>
#include "inet/applications/udpapp/UdpBasicApp.h"
#include "inet/common/packet/Packet.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "apps/trafficlight/TrafficLightPacket_m.h"

// 使用命名空间
namespace inet {
class TrafficLightRsuApp : public UdpBasicApp
{
  protected:
    // Configuration parameters
    std::string traciModulePath;
    double checkInterval;
    std::vector<std::string> monitoredTLs;
    
    // Destination information
    L3Address destAddr;
    int destPort;
    
    // Internal variables
    cMessage *tlCheckTimer;
    cModule* traciModule;
    bool traciInitialized;
    int numSentTlUpdates;
    
    // Signal declarations
    static simsignal_t tlStateChangedSignal;

  protected:
    // Get interface to SUMO via TraCI
    virtual bool getTraCIConnection();
    
    // Check traffic light states and send updates
    virtual void checkTrafficLightStates();
    
    // Create a traffic light state packet
    virtual Packet* createTLStatePacket(const std::string& tlId, 
                                      const std::string& state,
                                      double posX, double posY, 
                                      double remainingTime);

  public:
    TrafficLightRsuApp();
    virtual ~TrafficLightRsuApp();

  protected:
    virtual int numInitStages() const override { return NUM_INIT_STAGES; }
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg) override;
    virtual void finish() override;
    
    // Handle TraCI checking timer
    virtual void handleTrafficLightTimer();
    
    // UdpBasicApp doesn't have a sendPacket with arguments
    // Need to access socket directly
};

} // namespace inet

#endif
