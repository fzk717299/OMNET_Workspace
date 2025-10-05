//
// TrafficLightPacket.msg
//

import inet.common.INETDefs;
import inet.common.packet.chunk.Chunk;

namespace inet;

//
// Message sent from RSU to Car
//
class TrafficLightPacket extends FieldsChunk
{
    // ID of the RSU sending the message
    int rsuId;

    // Simulation time when the message was created
    simtime_t creationTime;

    // Current state of the traffic light (e.g., 0=RED, 1=GREEN, 2=YELLOW)
    int lightState;

    // Time remaining for the current state
    double timeToChange;
}