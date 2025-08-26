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
package simu5g.simulations.Iov_scenario5;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.inet.AdhocHost;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.node.ethernet.Eth10G;

import simu5g.world.radio.LteChannelControl;
import simu5g.common.carrierAggregation.CarrierAggregation;
import simu5g.nodes.Upf;
import simu5g.common.binder.Binder;
import simu5g.nodes.NR.gNodeB;
import simu5g.nodes.cars.Car;
import simu5g.simulations.Iov_scenario5.IovRSU;

import org.car2x.veins.subprojects.veins_inet.VeinsInetManager;

network IovScenario
{
    parameters:
        double playgroundSizeX @unit(m); // x size of the area the nodes are in (in meters)
        double playgroundSizeY @unit(m); // y size of the area the nodes are in (in meters)
        double playgroundSizeZ @unit(m); // z size of the area the nodes are in (in meters)
        @display("bgb=850,483");

    submodules:

        routingRecorder: RoutingTableRecorder {
            @display("p=50,75;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=50,125");
            config = xmldoc("config.xml");
        }

        //# Veins manager module
        veinsManager: VeinsInetManager {
            @display("p=50,227;is=s");
        }

        //# LTE modules
        channelControl: LteChannelControl {
            @display("p=50,25;is=s");
        }
        binder: Binder {
            @display("p=50,175;is=s");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=50.993748,258.7;is=s");
        }
        server: StandardHost {
            @display("p=660,136;is=n;i=device/server");
        }
        router: Router {
            @display("p=561,135;i=device/smallrouter");
        }
        upf: Upf {
            @display("p=462,136;is=l");
        }
        gNodeB1: gNodeB {
            @display("p=156,136;is=vl");
        }
        gNodeB2: gNodeB {
            @display("p=391,313;is=vl");
        }
        gNodeB3: gNodeB {
            @display("p=800,150;is=vl");
        }
        rsu: IovRSU {
            @display("p=561,42;is=s;i=device/accesspoint");
            masterId = 1;  // 关联到gNodeB1
            macCellId = 1; // 使用gNodeB1的小区ID
            ipv4.configurator.typename = "HostAutoConfigurator"; // 添加自动配置
            ipv4.configurator.interfaces = "cellular"; // 指定接口名称为cellular
        }

    connections allowunconnected:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        // RSU现在通过5G无线网络连接，这样的设计更符合5G V2X通信架构
        router.pppg++ <--> Eth10G <--> upf.filterGate;
        upf.pppg++ <--> Eth10G <--> gNodeB1.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB2.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB3.ppp;

        //# X2 connections (在5G中称为Xn接口，但Simu5G中组件名仍为x2)
        gNodeB1.x2++ <--> Eth10G <--> gNodeB2.x2++;
        gNodeB1.x2++ <--> Eth10G <--> gNodeB3.x2++;
        gNodeB2.x2++ <--> Eth10G <--> gNodeB3.x2++;
}

