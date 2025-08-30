//
// 自动泊车数据包定义
//

import inet.common.packet.chunk.Chunk;

namespace inet;

// 泊车位置类型
enum ParkingAreaType
{
    ROADSIDE = 0;    // 路边停车
    LOT = 1;         // 停车场
    GARAGE = 2;      // 车库
}

// 自动泊车数据包
class AutoParkingPacket extends FieldsChunk
{
    string vehicleId;      // 车辆ID
    string parkingAreaId;  // 泊车区域ID
    double posX;           // 泊车位置X坐标
    double posY;           // 泊车位置Y坐标
    double timestamp;      // 命令时间戳
    double distanceToParking; // 到泊车位置的距离
    ParkingAreaType parkingType; // 泊车类型
} 