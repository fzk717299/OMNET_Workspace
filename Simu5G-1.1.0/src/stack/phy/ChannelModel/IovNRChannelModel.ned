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


package simu5g.stack.phy.ChannelModel;

//
// IoV专用5G-NR通道模型
//
// 此模块继承NRChannelModel并添加专门的IoV指标收集功能
//
simple IovNRChannelModel extends NRChannelModel
{
    parameters:
        @class(IovNRChannelModel);
        
        // 统计更新间隔
        double statsUpdateInterval @unit(s) = default(1s);
        
        // 注：不要重新定义sinrThreshold参数，因为它已经在NRChannelModel（或其父类LteRealisticChannelModel）中定义了
        // 在omnetpp.ini中可以使用*.cellularNic.channelModel.sinrThreshold = -5dB进行设置
        
        // IoV场景特有的信号
        @signal[rsrpChangeRate];
        @statistic[rsrpChangeRate](title="RSRP change rate"; unit="dB/s"; source="rsrpChangeRate"; record=vector,mean,max);
        
        @signal[trafficDensity];
        @statistic[trafficDensity](title="Traffic density (number of vehicles)"; unit=""; source="trafficDensity"; record=vector,mean,max);
        
        @signal[concurrentConnections];
        @statistic[concurrentConnections](title="Number of concurrent connections"; unit=""; source="concurrentConnections"; record=vector,mean,max);
}