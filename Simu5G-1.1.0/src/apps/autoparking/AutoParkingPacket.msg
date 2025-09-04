// AutoParkingPacket.msg

import inet.common.packet.chunk.Chunk;


class AutoParkingPacket extends inet::FieldsChunk
{
    string vehicleId;
    string parkingAreaId;
    string destinationLaneId; // 停车场所在的车道ID
    string laneId;            // 车辆当前车道ID
    simtime_t timestamp;
    double parkingDuration;   // 停车时长 (秒)
    double parkingStartPos;   // 停车场在车道上的起始位置
    double parkingEndPos;     // 停车场在车道上的结束位置
} 