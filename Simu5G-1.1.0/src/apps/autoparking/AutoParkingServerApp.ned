//
// 自动泊车服务器应用NED定义
//

package simu5g.apps.autoparking;

simple AutoParkingServerApp extends inet.applications.udpapp.UdpBasicApp
{
    parameters:
        @class(AutoParkingServerApp);
        
        // 泊车分配策略：nearest(最近), optimal(最优), random(随机)
        string parkingAssignmentStrategy = default("nearest");
        
        // 泊车区域配置文件
        string parkingAreasFile = default("");
        
        // 统计信号
        @signal[parkingCommandRelayed](type=long);
        @statistic[parkingCommandRelayed](title="Parking commands relayed"; source=parkingCommandRelayed; record=count,sum,vector);
}