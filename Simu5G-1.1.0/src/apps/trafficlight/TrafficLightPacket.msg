//
// Traffic Light Information Packet
//
// This packet carries traffic light state information from RSU to vehicles
//

import inet.common.packet.chunk.Chunk;

namespace inet;

class TrafficLightPacket extends FieldsChunk
{
    string trafficLightId;   // ID of the traffic light in SUMO
    string state;            // Current state (e.g., "GGgrr" for green/red states)
    double timestamp;        // Time when the state was observed
    double position_x;       // X coordinate of the traffic light
    double position_y;       // Y coordinate of the traffic light
    double remainingTime;    // Estimated time until next state change (seconds)
}
