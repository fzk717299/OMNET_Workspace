//
// 速度限制车辆应用NED定义
//

package simu5g.apps.speedlimit;

import inet.applications.udpapp.UdpSink;

//
// 速度限制车辆应用模块
// 继承自UdpSink，接收和执行速度控制命令
//
simple SpeedLimitCarApp extends UdpSink
{
    parameters:
        @class(SpeedLimitCarApp);
        
        // 是否启用平滑减速
        bool smoothDeceleration = default(true);
        
        // 减速响应时间(秒)
        double responseTime @unit(s) = default(2s);
        
        // 统计信号
        @signal[speedCommandReceived](type=long);
        @statistic[speedCommandReceived](title="Speed commands received"; source=speedCommandReceived; record=count,vector);
}
