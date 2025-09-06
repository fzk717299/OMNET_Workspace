//
// 事故服务器应用NED定义
//
package simu5g.apps.accident;

import inet.applications.udpapp.UdpBasicApp;

//
// 事故服务器应用，用于转发变道命令
//
simple AccidentServerApp extends UdpBasicApp
{
    parameters:
        @class(AccidentServerApp);
        
        // Processing delay (s)
        double processingDelay @unit(s) = default(0.05s);
        
        // Note: messageLength is defined in UdpBasicApp
        
        // Statistics signals
        @signal[laneChangeCommandForwarded](type=long);
        
        @statistic[laneChangeCommandForwarded](title="Forwarded Lane Change Commands"; source=laneChangeCommandForwarded; record=count);
}