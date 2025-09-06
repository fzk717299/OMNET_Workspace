//
// 事故车辆应用NED定义
//
package simu5g.apps.accident;

import inet.applications.udpapp.UdpSink;

//
// 事故车辆应用，用于接收变道命令和触发事故
//
simple AccidentCarApp extends UdpSink
{
    parameters:
        @class(AccidentCarApp);
        
        // 是否启用平滑减速
        bool smoothDeceleration = default(true);
        
        // 减速响应时间(秒)
        double responseTime @unit(s) = default(2s);
        
        // 是否是事故车辆
        bool isAccidentVehicle = default(false);

        // 事故发生时间
        double accidentTime @unit(s) = default(5s);
        
        // 统计信号
        @signal[endToEndDelay](type=simtime_t);
        
        @statistic[endToEndDelay](title="端到端延迟"; source=endToEndDelay; record=vector,mean,max; unit=s; interpolationmode=none);
}