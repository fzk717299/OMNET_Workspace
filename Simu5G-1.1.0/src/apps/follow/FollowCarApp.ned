//
// Follower Car Application
// Receives commands from the server and adjusts speed.
//
package simu5g.apps.follow;

import inet.applications.udpapp.UdpSink;

//
// Follower Car Application
// Receives commands from the server and adjusts speed.
//
simple FollowCarApp extends UdpSink
{
    parameters:
        @class(FollowCarApp);

        double safetyDistance @unit(m) = default(100m);
        double maxSpeed @unit(mps) = default(35mps);
        string mobilityModule = default("^.mobility");
        
        // 添加信号和统计声明，与SpeedLimitCarApp一致
        @signal[endToEndDelay](type=simtime_t; unit=s);
        @statistic[endToEndDelay](title="End-to-end delay"; source=endToEndDelay; record=vector,mean,max,histogram; interpolationmode=none);
        
        @signal[rcvdPk](type=long);
        @statistic[rcvdPk](title="Packets received"; source=rcvdPk; record=count,vector; interpolationmode=none);
}