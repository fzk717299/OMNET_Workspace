//
// RSU application that monitors traffic lights and sends updates to vehicles
//

package simu5g.apps.trafficlight;

import inet.applications.udpapp.UdpBasicApp;

simple TrafficLightRsuApp extends UdpBasicApp
{
    parameters:
        @class(TrafficLightRsuApp);
        
        // TraCI module path for SUMO connection
        string traciModulePath = default("veinsManager");
        
        // How often to check traffic light status (seconds)
        double checkInterval @unit(s) = default(1.0s);
        
        // Comma-separated list of traffic light IDs to monitor
        string monitoredTLs = default("0/0,0/1,0/2,1/0,1/1,1/2,2/0,2/1,2/2");
        
        // 覆盖基类参数的默认值，避免运行时错误
        sendInterval = default(uniform(0.1s,0.15s));  // 默认使用随机间隔，但配置文件中可覆盖
        timeToLive = default(16);  // 适合城市场景的网络直径
        dontFragment = default(true); // 避免IP分片，减少延迟
        dscp = default(46);  // EF (Expedited Forwarding)，适用于实时交通安全信息
        multicastInterface = default("cellular");  // 默认使用5G蜂窝接口
        
        // Signal declarations
        @signal[tlStateChanged](type=long);
        @signal[sentPk](type=inet::Packet);
        @statistic[tlStateChanged](title="Traffic light state changes sent"; source=tlStateChanged; record=count,vector; interpolationmode=none);
        @statistic[sentPk](title="Sent packets"; source=sentPk; record=count,sum(packetBytes),vector(packetBytes); interpolationmode=none);
        @statistic[throughput](title="Throughput"; unit=bps; record=vector,mean; interpolationmode=linear);
}
