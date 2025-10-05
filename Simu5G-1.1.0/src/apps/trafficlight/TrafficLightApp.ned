//
// TrafficLightApp.ned
//

package simu5g.apps.trafficlight;

import inet.applications.udpapp.UdpBasicApp;
import inet.applications.udpapp.UdpSink;

// RSU application for sending traffic light info
simple RsuTrafficLightApp extends UdpBasicApp
{
    parameters:
        @class(RsuTrafficLightApp);
        // destAddress, destPort, sendInterval, startTime are inherited from UdpBasicApp
        @display("i=block/source");
}

// Car application for receiving traffic light info
simple CarTrafficLightApp extends UdpSink
{
    parameters:
        @class(CarTrafficLightApp);
        @display("i=block/sink");
}
