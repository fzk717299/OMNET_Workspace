//
// 事故RSU应用NED定义
//
package simu5g.apps.accident;

import inet.applications.udpapp.UdpBasicApp;

//
// 事故RSU应用，用于检测停止的车辆并发送变道命令
//
simple AccidentRsuApp extends UdpBasicApp
{
    parameters:
        @class(AccidentRsuApp);
        
        // 监控的车道列表，用空格分隔
        string monitoredLanes = default("0/0to1/0_0");
        
        // 检查间隔(秒)
        double checkInterval @unit(s) = default(1s);
        
        // 车辆被认为停止的速度阈值(m/s)
        double stoppedSpeedThreshold = default(0.1);
        
        // 车辆停止的最小时间(s)才被认为是事故
        double minStopTime @unit(s) = default(3s);
        
        // 注意：messageLength已在UdpBasicApp中定义，不要重复定义
        // 可以在omnetpp.ini中设置：*.rsu.app[0].messageLength = 256B
        
        // 统计信号
        @signal[accidentDetected](type=long);
        @signal[laneChangeCommandSent](type=long);
        
        @statistic[accidentDetected](title="检测到事故数"; source=accidentDetected; record=count; interpolationmode=none);
        @statistic[laneChangeCommandSent](title="发送变道命令数"; source=laneChangeCommandSent; record=count; interpolationmode=none);
}