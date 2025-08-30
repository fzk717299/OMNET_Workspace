package simu5g.simulations.Iov_scenario2;

import inet.applications.udpapp.UdpBasicApp;

simple AutoParkingServerApp extends UdpBasicApp
{
    parameters:
        @class(AutoParkingServerApp);
        
        // 处理延迟 - 模拟云端处理时间
        double processingDelay @unit(s) = default(0.05s);
        
        // 车位分配算法
        string parkingAssignmentStrategy = default("nearest");  // nearest, balanced
        
        // 泊车位置数据文件
        string parkingAreasFile = default("parkingAreas.xml");
        
        // 信号声明
        @signal[parkingCommandRelayed](type=long);
        @statistic[parkingCommandRelayed](title="Parking commands relayed"; source=parkingCommandRelayed; record=count,vector; interpolationmode=none);
} 