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

package migration;

import inet.common.figures.DelegateSignalConfigurator;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.inet.INetworkNode;
import inet.physicallayer.contract.packetlevel.IRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;
import inet.visualizer.contract.IStatisticVisualizer;


network WirelessA
{
    parameters:
        string hostType = default("WirelessHost");
        string mediumType = default("IdealRadioMedium");

        @display("bgb=600,500;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText](type=indicatorText; pos=420,20; anchor=w; font=,20; textFormat="packets received: %g"; initialValue=0);
        @statistic[rcvdPk](source=hostB_rcvdPk; record=figure(count); targetFigure=rcvdPkText);
        @signal[hostB_rcvdPk];
        @delegatesignal[rcvdPk](source=hostB.udpApp[0].rcvdPk; target=hostB_rcvdPk);

    submodules:
        visualizer: <default("IntegratedCanvasVisualizer")> like IIntegratedVisualizer {
            @display("p=625,20");
       }
        //visualizer: <default("StatisticCanvasVisualizer")> like IStatisticVisualizer if hasVisualizer() {
          //  @display("p=550,20");
        //}
        configurator: IPv4NetworkConfigurator {
            @display("p=700,20");
        }
        radioMedium: <mediumType> like IRadioMedium {
            @display("p=775,20");
        }
        figureHelper: DelegateSignalConfigurator {
            @display("p=850,20");
        }
        hostA: <hostType> like INetworkNode {
            @display("p=250,300");
        }
        hostB: <hostType> like INetworkNode {
            @display("p=300,300");
        }
        
}

//##### (marker for doxygen)