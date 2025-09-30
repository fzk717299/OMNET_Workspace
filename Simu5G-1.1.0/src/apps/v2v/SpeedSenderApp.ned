//
//                  Simu5G
//
// Authors: Giovanni Nardini, Giovanni Stea, Antonio Virdis (University of Pisa)
//
// This file is part of a software released under the license included in file
// "license.pdf". Please read LICENSE and README files before using it.
// The above files and the present reference are part of the software itself,
// and cannot be removed from it.
//

package simu5g.apps.v2v;

import inet.applications.contract.IApp;

// SpeedSenderApp用于实现前车向后车发送速度信息的功能
simple SpeedSenderApp like IApp
{
    parameters:
        @class(SpeedSenderApp);
        
        string interfaceTableModule = default("^.interfaceTable");  // 接口表模块的路径
        
        int localPort = default(9330);  // UDP本地端口
        int destPort = default(9331);   // UDP目标端口
        string destAddress = default("224.0.0.10");  // 默认组播地址，也可直接使用后车IP
        int PacketSize = default(500); // 数据包大小(字节)
        
        double sendInterval @unit(s) = default(0.1s); // 发送间隔，默认100ms发送一次
        double startTime @unit(s) = default(0s);   // 开始发送数据包的时间
        
        // 车辆ID设置
        int frontCarId = default(-1); // 前车ID(发送方)，默认使用模块索引
        int rearCarId = default(-1);  // 后车ID(接收方)，-1表示广播

        string multicastInterface = default("wlan"); // 使用哪个接口发送组播
        int tos = default(-1); // TOS / DSCP (用于QoS)
        
        @signal[sentPackets](type=inet::Packet);
        @statistic[sentPackets](title="Packets sent"; source=sentPackets; record=count,vector?);
        
    gates:
        input socketIn @labels(UdpControlInfo/up);
        output socketOut @labels(UdpControlInfo/down);
}
