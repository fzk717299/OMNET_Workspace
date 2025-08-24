package simu5g.simulations.Iov_scenario1;

import inet.node.inet.StandardHost;

//
// RSU module with an Ethernet interface to be connected to the Core Network.
// It is a StandardHost with a custom display string.
//
module IovRSU extends StandardHost
{
    parameters:
        @display("p=100,350;is=s;i=device/accesspoint");
}