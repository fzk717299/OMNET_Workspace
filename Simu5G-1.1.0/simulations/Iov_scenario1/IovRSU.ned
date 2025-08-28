package simu5g.simulations.Iov_scenario1;

import simu5g.nodes.Ue;

//
// RSU module with LTE/NR UU interface to communicate with eNodeB
// This extends the UE class to add wireless capabilities to RSUs
//
module IovRSU extends Ue
{
    parameters:
        @display("p=100,350;is=s;i=device/accesspoint");

        // Override default UE mobility with StationaryMobility
        mobilityType = default("StationaryMobility");

        // RSU typically has more powerful hardware - This parameter is not defined in Ue.ned, so it is removed.
        // txPower = default(30mw);

        // Use LTE/NR for communication
        nicType = default("LteNicUe");
}