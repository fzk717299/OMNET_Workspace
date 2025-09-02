package simu5g.apps.autoparking;

import inet.applications.udpapp.UdpBasicApp;

simple AutoParkingRsuApp extends UdpBasicApp
{
    parameters:
        string monitoredLanes; // 新增：需要监控的车道ID列表（以空格分隔）
        double checkInterval @unit(s);
        double detectionRadius @unit(m) = default(100m);
        double parkingProbability = default(0.5); // 新增：随机泊车的概率
        string parkingAreasFile; // 新增：停车场信息文件
        @class(AutoParkingRsuApp);
        
        // 信号声明
        @signal[parkingCommandSent](type=long);
        @statistic[parkingCommandSent](title="Parking commands sent"; source=parkingCommandSent; record=count,vector; interpolationmode=none);
} 