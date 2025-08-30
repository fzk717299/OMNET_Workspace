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

#ifndef _V2VVehicleSender_H_
#define _V2VVehicleSender_H_

#include <string.h>
#include <omnetpp.h>

#include <inet/networklayer/common/L3AddressResolver.h>
#include <inet/transportlayer/contract/udp/UdpSocket.h>
#include <veins_inet/VeinsInetMobility.h>
#include <inet/common/geometry/common/Coord.h>
#include "apps/v2v/V2VMessage1_m.h"

class V2VVehicleSender : public omnetpp::cSimpleModule
{
    inet::UdpSocket socket;
    int size_;
    omnetpp::cMessage *initTraffic_;

    int localPort_;
    int destPort_;
    inet::L3Address destAddress_;

    void initTraffic();

  public:
    ~V2VVehicleSender();
    V2VVehicleSender();

  protected:
    virtual int numInitStages() const  override { return inet::NUM_INIT_STAGES; }
    void initialize(int stage) override;
    void handleMessage(omnetpp::cMessage *msg) override;


  private:
      //init基本信息
      omnetpp::cMessage* initTrafficMsg;
      int VehicleId = -1;
      omnetpp::simtime_t simuStartTime = omnetpp::simtime_t(10);

      //关于TDMA和beacon发送
      SimTime frameLength = SimTime (0.1);
      int slot_num = 1000;
      int useSlot = 0;
      int availableSlot = 1000;
      omnetpp::simtime_t slotLength = frameLength / slot_num;  //0.2ms一个时隙

      //V2V trans:
      omnetpp::cMessage* sendV2VMessage;
      void initTraffic_V2V();
      int destId = -1;

      double maxV2VDistande = 300;
};

#endif

