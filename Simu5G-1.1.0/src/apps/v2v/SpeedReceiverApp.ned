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

// SpeedReceiverApp用于接收并处理前车发送的速度信息
simple SpeedReceiverApp like IApp
{
    parameters:
        @class(SpeedReceiverApp);
        
        string interfaceTableModule = default("^.interfaceTable");  // 接口表模块的路径
        
        int localPort = default(9331);  // UDP本地端口，默认与发送方的destPort一致
        
        // 车辆ID设置
        int rearCarId = default(-1);   // 后车ID(接收方)，默认使用模块索引
        int frontCarId = default(-1);  // 前车ID(发送方)，-1表示接收任何ID发送的数据
        
        // 统计信号
        @signal[receivedPackets](type=inet::Packet);
        @signal[speedInfo](type=double);
        @signal[positionX](type=double);
        @signal[positionY](type=double);
        @signal[positionZ](type=double);
        @signal[delayInfo](type=simtime_t);
        
        @statistic[receivedPackets](title="接收数据包数"; source=receivedPackets; record=count,vector?);
        @statistic[speed](title="接收的速度信息"; source=speedInfo; record=vector,timeavg);
        @statistic[positionX](title="车辆X坐标"; source=positionX; record=vector);
        @statistic[positionY](title="车辆Y坐标"; source=positionY; record=vector);
        @statistic[positionZ](title="车辆Z坐标"; source=positionZ; record=vector);
        @statistic[delay](title="端到端延迟"; source=delayInfo; record=vector,mean,max);
        
    gates:
        input socketIn @labels(UdpControlInfo/up);
        output socketOut @labels(UdpControlInfo/down);
}
