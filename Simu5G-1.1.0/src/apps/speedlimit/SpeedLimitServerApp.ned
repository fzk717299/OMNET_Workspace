//
// 速度限制服务器应用NED定义
//

package simu5g.apps.speedlimit;

import inet.applications.udpapp.UdpBasicApp;

//
// 速度限制服务器应用模块
// 继承自UdpBasicApp，处理来自RSU的数据并发送控制命令到车辆
//
simple SpeedLimitServerApp extends UdpBasicApp
{
    parameters:
        @class(SpeedLimitServerApp);
        
        // 高精地图中是否有限速信息
        bool hasMapSpeedLimit = default(false);
        
        // 服务器处理延迟(秒)
        double processingDelay @unit(s) = default(0.05s);
}
