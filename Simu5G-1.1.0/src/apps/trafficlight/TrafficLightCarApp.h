//
// Traffic Light Car Application
//
// Receives traffic light information from RSU and processes it
//

#ifndef __TRAFFICLIGHTCARAPP_H_
#define __TRAFFICLIGHTCARAPP_H_

#include <string>
#include <map>
#include "inet/applications/udpapp/UdpSink.h"
#include "inet/common/packet/Packet.h"
#include "apps/trafficlight/TrafficLightPacket_m.h"

namespace inet {

// Structure to store traffic light information
struct TrafficLightInfo {
    std::string id;
    std::string state;
    double timestamp;
    double posX;
    double posY;
    double remainingTime;
    simtime_t receivedTime;
};
class TrafficLightCarApp : public UdpSink
{
  protected:
    // Traffic light data storage
    std::map<std::string, TrafficLightInfo> tlInfoMap;
    
    // Statistics
    int numReceivedTlUpdates;
    
    // Signals
    static simsignal_t tlInfoReceivedSignal;
    static simsignal_t endToEndDelaySignal;

  protected:
    // Process received traffic light information
    virtual void processTLInfo(const TrafficLightPacket* tlPacket, simtime_t arrivalTime);
    
    // Take actions based on traffic light information (placeholder for vehicle behavior)
    virtual void reactToTrafficLight(const TrafficLightInfo& tlInfo);

  public:
    TrafficLightCarApp();
    virtual ~TrafficLightCarApp();

  protected:
    virtual void initialize(int stage) override;
    virtual void processPacket(Packet *packet) override;
    virtual void finish() override;
};

} // namespace inet

#endif
