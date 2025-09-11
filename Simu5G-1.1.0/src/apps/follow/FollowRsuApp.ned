package simu5g.apps.follow;

import inet.applications.udpapp.UdpBasicApp;

//
// RSU Application
// Gathers vehicle data from TraCI and sends it to the server.
//
simple FollowRsuApp extends UdpBasicApp
{
    parameters:
        @class(FollowRsuApp);
        string leaderCarId;
        string followerCarId;
        string serverDestAddr;
        int serverDestPort;
        double checkInterval @unit(s) = default(0.1s);
}