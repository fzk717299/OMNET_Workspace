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

package simu5g.apps.v2v;

import inet.applications.contract.IApp;


simple V2VVehicleReceiver like IApp
{
    parameters:
        int localPort = default(3000);
        string interfaceTableModule;
        string multicastInterface = default("wlan");  // if not empty, set the multicast output interface option on the socket (interface name expected)
       
		@display("i=block/source");
    gates:
        output socketOut;
        input socketIn;
}

