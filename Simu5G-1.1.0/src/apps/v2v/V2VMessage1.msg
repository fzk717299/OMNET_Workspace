//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//


import inet.common.INETDefs;
import inet.common.packet.chunk.Chunk;


class V2VMessage1 extends inet::FieldsChunk {
	//V2VId
	int senderId = 0;
	int relayId = 0;
	int destId = 0;
	int lastId = 0;
	
	//id of the sender. relayerId == vehicleId on first hope
	double senderX = 0;
	double senderY= 0;
	simtime_t sendTime;
	double y = 0;
	
}
