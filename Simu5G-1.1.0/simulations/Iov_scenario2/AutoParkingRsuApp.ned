package simu5g.simulations.Iov_scenario2;

import inet.applications.udpapp.UdpBasicApp;

simple AutoParkingRsuApp extends UdpBasicApp
{
    parameters:
        @class(AutoParkingRsuApp);
        
        // TraCI模块路径，用于与SUMO交互
        string traciModulePath = default("veinsManager");
        
        // 检测间隔 - 每隔多久检测一次是否有车辆需要泊车
        double checkInterval @unit(s) = default(1.0s);
        
        // 检测范围 - RSU检测车辆的半径范围
        double detectionRadius @unit(m) = default(100.0m);
        
        // 最大检测车辆数量
        int maxVehiclesToCheck = default(10);
        
        // 直接泊车命令参数
        bool enableDirectParking = default(false); // 是否启用直接泊车命令
        double directParkingTime @unit(s) = default(5.0s); // 何时发送直接泊车命令
        string targetVehicleId = default("0"); // 目标车辆ID
        
        // 信号声明
        @signal[parkingCommandSent](type=long);
        @statistic[parkingCommandSent](title="Parking commands sent"; source=parkingCommandSent; record=count,vector; interpolationmode=none);
} 