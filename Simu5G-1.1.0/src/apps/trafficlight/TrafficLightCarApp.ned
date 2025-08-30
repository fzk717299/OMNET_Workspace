//
// Vehicle application that receives and processes traffic light information
//

package simu5g.apps.trafficlight;

import inet.applications.udpapp.UdpSink;

simple TrafficLightCarApp extends UdpSink
{
    parameters:
        @class(TrafficLightCarApp);
        
        // Signal declarations
        @signal[tlInfoReceived](type=long);
        @signal[endToEndDelay](type=double);
        
        @statistic[tlInfoReceived](title="Traffic light info received"; source=tlInfoReceived; record=count,vector; interpolationmode=none);
        @statistic[endToEndDelay](title="End-to-end delay of traffic light info"; source=endToEndDelay; record=vector,histogram,mean,max; unit=s; interpolationmode=none);
}
