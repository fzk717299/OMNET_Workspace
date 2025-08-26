//
// 速度限制车辆应用NED定义
//

package simu5g.apps.speedlimit;

import inet.applications.udpapp.UdpSink;

//
// 速度限制车辆应用模块
// 继承自UdpSink，增加接收和执行速度限制命令功能
//
simple SpeedLimitCarApp extends UdpSink
{
    parameters:
        @class(SpeedLimitCarApp);
        
        // 是否使用平滑减速(true)还是立即设置速度(false)
        bool smoothDeceleration = default(true);
        
        // 平滑减速的响应时间(秒)
        double responseTime @unit(s) = default(2.0s);
        
        // 统计信号
        @signal[speedCommandReceived](type=long);
        @statistic[speedCommandReceived](title="Speed limit commands received"; source=speedCommandReceived; record=count,vector; interpolationmode=none);
        
        @signal[speedLimitApplied](type=double);
        @statistic[speedLimitApplied](title="Speed limits applied"; source=speedLimitApplied; record=vector,stats; interpolationmode=none);
        
        @signal[endToEndDelay](type=simtime_t; unit=s);
        @statistic[endToEndDelay](title="End-to-end delay"; source=endToEndDelay; record=vector,mean,max,histogram; interpolationmode=none);
}