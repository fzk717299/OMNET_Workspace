//
// 速度限制数据包定义文件
//

import inet.common.INETDefs;
import inet.common.packet.chunk.Chunk;

namespace inet;

// 速度限制数据包类型
enum SpeedLimitMsgType {
    SL_DETECTOR_DATA = 0;    // 检测器数据
    SL_CONTROL_COMMAND = 1;  // 控制命令
};

//
// 速度限制数据包
// 用于传递检测器数据和速度控制命令
//
class SpeedLimitPacket extends FieldsChunk
{
    // 消息类型
    int msgType @enum(SpeedLimitMsgType) = SL_DETECTOR_DATA;
    
    // 车辆ID
    string vehicleId = "";
    
    // 当前速度(m/s)
    double currentSpeed = 0;
    
    // 目标速度(m/s)
    double targetSpeed = 0;
    
    // 时间戳
    simtime_t timestamp;
    
    // 检测器ID
    string detectorId = "";
    
    // 控制原因: 0 = 地图缺失, 1 = 道路拥堵, 2 = 天气条件, 3 = 施工
    int controlReason = 0;
}
