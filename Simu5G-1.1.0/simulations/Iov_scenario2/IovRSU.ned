package simu5g.simulations.Iov_scenario2;

import inet.node.inet.StandardHost;

//
// RSU as a wired StandardHost connected to the router
//
module IovRSU extends StandardHost
{
    parameters:
        @display("p=100,350;is=s;i=device/accesspoint");
}