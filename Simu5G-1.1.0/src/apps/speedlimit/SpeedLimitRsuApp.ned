//
// 速度限制RSU应用NED定义
//

package simu5g.apps.speedlimit;

import inet.applications.udpapp.UdpBasicApp;

//
// 速度限制RSU应用模块
// 继承自UdpBasicApp，增加处理速度检测器数据的功能
//
simple SpeedLimitRsuApp extends UdpBasicApp
{
    parameters:
        @class(SpeedLimitRsuApp);
        
        // 速度检测器ID
        string speedLimitDetectorId = default("speedLimitDetector_1");
        
        // 最大允许速度(km/h)
        double maxSpeed @unit(kmph) = default(60kmph);
        
        // 检查间隔(s)
        double checkInterval @unit(s) = default(0.1s);
}
