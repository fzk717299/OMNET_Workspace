//
// AutoParkingPacket: custom packet for auto parking applications
//

import inet.common.packet.chunk.Chunk;

//
// Message types
//
enum AutoParkingMessageType
{
    AP_PARKING_COMMAND = 0;
    AP_PARKING_RESPONSE = 1;
    AP_PARKING_STATUS = 2;
}

//
// Parking area types
//
enum ParkingAreaType
{
    ROADSIDE = 0;
    LOT = 1;
    GARAGE = 2;
}

//
// Auto Parking application packet
//
class AutoParkingPacket extends inet::FieldsChunk
{
    AutoParkingMessageType msgType = AP_PARKING_COMMAND;
    string vehicleId;
    string parkingAreaId;
    string destinationLaneId; // Target lane ID for SUMO navigation
    string laneId; // Current lane ID
    double posX;
    double posY;
    simtime_t timestamp;
    double distanceToParking;
    ParkingAreaType parkingType = ROADSIDE;
} 