package simu5g.simulations.Iov_scenario2;

import simu5g.nodes.Ue;

//
// RSU as a wireless UE (User Equipment) connected via cellular network
//
module IovRSU extends Ue
{
    parameters:
        //# 应用层配置
        numApps = 1;
        app[0].typename = default("AutoParkingRsuApp");
        
        //# 移动性配置  
        mobilityType = default("StationaryMobility");
        
        @display("i=device/accesspoint");
}