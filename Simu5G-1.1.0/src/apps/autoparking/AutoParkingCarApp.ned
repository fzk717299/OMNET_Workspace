package simu5g.apps.autoparking;

import inet.applications.udpapp.UdpSink;

simple AutoParkingCarApp extends UdpSink
{
    parameters:
        @class(AutoParkingCarApp);
        
        // 是否启用平滑泊车
        bool smoothParking = default(true);
        
        // 响应时间(秒) - 车辆从接收到指令到开始执行的时间
        double responseTime @unit(s) = default(1.0s);
        
        // 泊车完成后最大等待时间
        double maxWaitingTime @unit(s) = default(300s);
        
        // 信号声明
        @signal[parkingCommandReceived](type=long);
        @statistic[parkingCommandReceived](title="Parking commands received"; source=parkingCommandReceived; record=count,vector; interpolationmode=none);
        
        @signal[parkingExecuted](type=long);
        @statistic[parkingExecuted](title="Parking maneuvers executed"; source=parkingExecuted; record=count,vector; interpolationmode=none);
        
        @signal[endToEndDelay](type=simtime_t; unit=s);
        @statistic[endToEndDelay](title="End-to-end delay"; source=endToEndDelay; record=vector,mean,max,histogram; interpolationmode=none);
} 