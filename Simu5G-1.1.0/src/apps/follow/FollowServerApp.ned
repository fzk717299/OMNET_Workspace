//
// Car Following Server Application (Forwarder)
// Receives packets from the RSU and forwards them to the follower car.
//
package simu5g.apps.follow;

import inet.applications.udpapp.UdpBasicApp;

//
// Car Following Server Application (Forwarder)
// Receives packets from the RSU and forwards them to the follower car.
//
simple FollowServerApp extends UdpBasicApp
{
    parameters:
        @class(FollowServerApp);
        string followerDestAddr;
        int followerDestPort;
}