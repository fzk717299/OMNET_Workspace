//
// CarTrafficLightApp.h
//

#ifndef APPS_TRAFFICLIGHT_CARTRAFFICLIGHTAPP_H_
#define APPS_TRAFFICLIGHT_CARTRAFFICLIGHTAPP_H_

#include "inet/applications/udpapp/UdpSink.h"
#include "apps/trafficlight/TrafficLightPacket_m.h"

class CarTrafficLightApp : public inet::UdpSink {
  protected:
    // Statistics signals
    omnetpp::simsignal_t receivedPackets_;
    omnetpp::simsignal_t endToEndDelay_;
    
    virtual void initialize(int stage) override;
    virtual void processPacket(inet::Packet *packet) override;
};

#endif /* APPS_TRAFFICLIGHT_CARTRAFFICLIGHTAPP_H_ */