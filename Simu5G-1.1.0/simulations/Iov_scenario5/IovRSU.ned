package simu5g.simulations.Iov_scenario5;

import simu5g.nodes.cars.NRCar;

//
// 重要修改：现在RSU基于官方NRCar模块实现，不再直接继承NRUe
// NRCar已经内置了HostAutoConfigurator并配置了cellular接口
// 优点：
// 1. 直接使用官方成熟的模块，确保配置一致性
// 2. 避免自定义模块可能引入的配置问题
// 3. NRCar已经在示例中测试过，接口命名稳定可靠
//
module IovRSU extends NRCar
{
    parameters:
        @display("p=100,350;is=s;i=device/accesspoint");
        mobilityType = "StationaryMobility";  // 固定RSU位置
        
        // 确保与NRCar使用相同的接口命名
        ipv4.configurator.interfaces = "wlan"; // 指定wlan作为无线接口名
}
