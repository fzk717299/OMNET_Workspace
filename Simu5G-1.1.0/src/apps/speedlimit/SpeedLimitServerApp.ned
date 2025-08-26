//
// 速度限制服务器应用NED定义
//

package simu5g.apps.speedlimit;

import inet.applications.udpapp.UdpBasicApp;

//
// 速度限制服务器应用模块
// 继承自UdpBasicApp，增加处理速度检测数据和发送控制命令功能
//
simple SpeedLimitServerApp extends UdpBasicApp
{
    parameters:
        @class(SpeedLimitServerApp);
        
        // 高精地图中是否有限速信息
        bool hasMapSpeedLimit = default(false);
        
        // 服务器处理延迟(秒)
        double processingDelay @unit(s) = default(0.05s);
        
        // 统计信号
        @signal[speedLimitCommandSent](type=double);
        @statistic[speedLimitCommandSent](title="Speed limit commands sent"; source=speedLimitCommandSent; record=vector,count; interpolationmode=none);
        
        @signal[messagesProcessed](type=long);
        @statistic[messagesProcessed](title="Total detector messages processed"; source=messagesProcessed; record=vector,last; interpolationmode=none);
}