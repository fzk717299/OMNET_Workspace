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
}