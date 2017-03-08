package migration;

@license(LGPL);
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



//import inet.common.figures.DelegateSignalConfigurator;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.inet.INetworkNode;
import inet.node.inet.AdhocHost;
import inet.physicallayer.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;


network WirelessA
{
    parameters:
        string hostType = default("AdhocHost");
        string mediumType = default("Ieee80211ScalarRadioMedium");

        @display("bgb=1000,500;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText](type=indicatorText; pos=420,20; anchor=w; font=,20; textFormat="packets received: %g"; initialValue=0);
        @statistic[rcvdPk](source=hostB_rcvdPk; record=figure(count); targetFigure=rcvdPkText);
        @signal[hostB_rcvdPk];
        @delegatesignal[rcvdPk](source=hostB.udpApp[0].rcvdPk; target=hostB_rcvdPk);

    submodules:
        visualizer: IntegratedCanvasVisualizer {
            @display("p=970,125");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=970,200");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=970,275");
        }
       
       hostA: <hostType> like INetworkNode {
            @display("p=400,200");
        }
       hostB: <hostType> like INetworkNode {
            @display("p=200,200");
        }
       hostC: <hostType> like INetworkNode {
            @display("p=300,325");
        }
       
        
}

//##### (marker for doxygen)


