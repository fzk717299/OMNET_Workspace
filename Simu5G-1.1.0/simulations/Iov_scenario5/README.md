# Iov_scenario5 - 基于5G NR的车联网仿真场景

本场景基于Simu5G-1.1.0和INET4框架，实现了一个车联网(Internet of Vehicles)通信仿真环境，重点利用5G NR技术提供高带宽、低延迟的通信服务。

## 场景架构

本场景包含以下关键组件:

- **3个gNodeB基站**: 提供5G NR覆盖
- **固定RSU(Road Side Unit)**: 基于NRUe实现，同时支持5G NR通信和PC5直连
- **动态车辆(Car)**: 通过SUMO交通仿真器创建和移动
- **核心网络**: 包括服务器、路由器和UPF(User Plane Function)

## 通信模式

场景支持两种主要通信模式:

1. **PC5直连通信** (V2V/V2I)
   - 车辆与RSU之间的直接通信
   - 使用D2D模式模拟PC5 Sidelink
   - 绕过核心网，实现低延迟通信
   - 配置: `[Config PC5]`, `[Config PC5TrafficInfo]`

2. **RSU-云-车辆通信** (V2N2V)
   - RSU收集信息并发送到云服务器
   - 服务器处理后将信息发送到车辆
   - 提供集中式数据处理能力
   - 配置: `[Config RSU-Cloud-Car]`及其变种

## 应用场景

本仿真支持多种车联网应用:

1. **速度限制应用** (`[Config SpeedLimit]`)
   - RSU检测超速车辆并发送数据到云端
   - 服务器处理数据并生成控制命令
   - 车辆接收命令并执行减速操作

2. **交通信息应用** (`[Config PC5TrafficInfo]`)
   - RSU直接通过PC5向车辆发送实时交通信息

3. **语音通信** (`[Config RSU-Cloud-Car-VoIP]`)
   - 模拟RSU与车辆之间的语音通信

4. **紧急告警** (`[Config RSU-Cloud-Car-Alert]`)
   - RSU发送多播紧急告警消息到所有车辆

5. **混合应用** (`[Config RSU-Cloud-Car-Mixed]`)
   - 同时运行多种应用的综合场景

## 5G NR特性

本场景重点实现了以下5G NR特性:

- **3.5GHz频段**: 使用n78频段实现广域覆盖
- **灵活帧结构**: 支持多种子载波间隔(SCS)和Numerology
- **增强MIMO**: 配置了多天线传输
- **基站间Xn接口**: 实现无缝切换和协作通信
- **PC5 Sidelink**: 支持直接设备间通信

## 性能评估指标

场景收集了多种统计指标:

- 端到端延迟
- 吞吐量
- 丢包率
- 带宽利用率
- SINR和信号强度
- 切换成功率和失败率
- 连接中断情况

## 使用说明

1. 确保已安装OMNeT++、SUMO、Veins和INET框架
2. 配置并启动SUMO仿真器
3. 选择合适的配置运行仿真
4. 收集和分析结果数据

## 关键参数

- 5G NR频率: 3.5GHz
- 带宽: 20MHz (106 RBs)
- 子载波间隔: 15kHz
- 发射功率: gNodeB 46dBm, UE 26dBm
- 仿真时长: 70s
