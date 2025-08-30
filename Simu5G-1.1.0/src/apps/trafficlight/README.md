# 红绿灯信息监控与下发系统

该模块实现了一个基于5G V2X PC5直连通信的红绿灯信息监控与下发系统。RSU能够通过TraCI接口连接到SUMO交通模拟器，实时获取道路红绿灯状态，然后通过5G PC5直连通信将这些信息发送给周围的车辆。

## 系统组件

1. **TrafficLightRsuApp**: 
   - 运行在RSU上的应用程序
   - 通过TraCI接口监控SUMO中的红绿灯状态
   - 将红绿灯信息通过PC5直连方式发送给车辆

2. **TrafficLightCarApp**:
   - 运行在车辆上的应用程序
   - 接收并处理来自RSU的红绿灯信息
   - 提供接口供车辆决策系统使用

3. **TrafficLightPacket**:
   - 红绿灯信息数据包格式定义
   - 包含信号灯ID、当前状态、位置信息和剩余时间等

## 功能特点

- 实时监控多个交通信号灯状态
- 支持通过PC5直连通信高效传输（低延迟）
- 可配置监控频率和目标信号灯
- 提供完整的性能统计指标（端到端延迟、丢包率等）

## 使用方法

1. 在omnetpp.ini中配置RSU应用：
```ini
*.rsu.app[0].typename = "TrafficLightRsuApp"
*.rsu.app[0].monitoredTLs = "0/0,0/1,0/2,..."  # 要监控的信号灯ID
*.rsu.app[0].checkInterval = 0.5s  # 检查频率
```

2. 在omnetpp.ini中配置车辆应用：
```ini
*.car[*].app[0].typename = "TrafficLightCarApp"
*.car[*].app[0].localPort = 5001
```

3. 确保启用PC5/D2D通信：
```ini
*.car[*].cellularNic.d2dCapable = true
*.rsu.cellularNic.d2dCapable = true
*.gNodeB*.cellularNic.d2dEnabled = true
```

## 性能指标

该系统提供以下性能指标：

- **tlStateChanged**: RSU发送的信号灯状态更新次数
- **tlInfoReceived**: 车辆接收到的信号灯信息更新次数
- **endToEndDelay**: 信息从RSU生成到车辆接收的端到端延迟
- **D2D/PC5传输统计**: SINR, RSRP, 成功传输率等

这些指标有助于评估系统在不同场景下的性能和可靠性。
