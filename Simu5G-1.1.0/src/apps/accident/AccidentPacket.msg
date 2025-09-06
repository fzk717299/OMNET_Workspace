//
// 事故消息数据包定义文件
//

import inet.common.INETDefs;
import inet.common.packet.chunk.Chunk;
import inet.common.Units;

namespace inet;

// 事故消息数据包类型 - 只保留变道命令
enum AccidentMsgType {
    ACC_LANE_CHANGE_CMD = 0;  // 变道命令
};

//
// 事故消息数据包
// 仅用于传递变道命令
//
class AccidentPacket extends FieldsChunk
{
    // 设置默认大小为256字节
    chunkLength = B(256);
    
    // 消息类型
    int msgType @enum(AccidentMsgType) = ACC_LANE_CHANGE_CMD;

    // 事故位置坐标 (用于判断车辆是否在事故点前)
    double accidentPosX = 0;
    double accidentPosY = 0;
    
    // 事故发生的原始车道 (用于服务器筛选目标车辆)
    string originalLaneId = "";
    
    // 用于避让的目标车道
    string targetLaneId = "";
}
