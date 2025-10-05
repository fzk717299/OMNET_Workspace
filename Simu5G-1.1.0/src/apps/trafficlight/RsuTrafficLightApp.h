//
// RsuTrafficLightApp.h
//

#ifndef APPS_TRAFFICLIGHT_RSUTRAFFICLIGHTAPP_H_
#define APPS_TRAFFICLIGHT_RSUTRAFFICLIGHTAPP_H_

#include "inet/applications/udpapp/UdpBasicApp.h"
#include "apps/trafficlight/TrafficLightPacket_m.h"

class RsuTrafficLightApp : public inet::UdpBasicApp {
  protected:
    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(omnetpp::cMessage *msg) override;
    virtual inet::Packet *createPacket();
};

#endif /* APPS_TRAFFICLIGHT_RSUTRAFFICLIGHTAPP_H_ */ 