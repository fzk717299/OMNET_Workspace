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

import inet.common.INETDefs;
import inet.common.packet.chunk.Chunk;

cplusplus {{
#include "inet/common/packet/chunk/FieldsChunk.h"
}}

namespace inet;

class SpeedInfoMessage extends inet::FieldsChunk
{
    // 车辆基本信息
    int senderId = 0;      // 发送车辆ID
    int destId = 0;        // 目标车辆ID
    
    // 位置信息
    double posX = 0;       // 车辆X坐标
    double posY = 0;       // 车辆Y坐标
    double posZ = 0;       // 车辆Z坐标
    
    // 速度信息
    double speed = 0;      // 车辆当前速度(m/s)
    double acceleration = 0; // 车辆加速度(m/s^2)
    double direction = 0;    // 车辆行驶方向(角度)
    
    // 时间戳
    simtime_t sendTime;    // 发送时间
}
