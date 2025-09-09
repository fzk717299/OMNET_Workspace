//
// Follow scenario RSU node definition
//

package simu5g.simulations.Iov_scenario3;

import simu5g.nodes.Ue;

module IovRSU extends Ue
{
    parameters:
        //# 应用层配置
        numApps = 1;
        app[0].typename = default("FollowRsuApp");
        
        //# 移动性配置  
        mobilityType = default("StationaryMobility");
        
        @display("i=device/accesspoint");
}