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



import inet.node.inet.INetworkNode;
import inet.common.lifecycle.LifecycleController;
import inet.common.scenario.ScenarioManager;

network WirelessB extends WirelessA
{
    submodules:
        hostR1: <hostType> like INetworkNode {
            @display("p=500,325");
        }
        hostR2: <hostType> like INetworkNode {
            @display("p=550,450");
        }
        hostR3: <hostType> like INetworkNode {
            @display("p=650,325");
        }
        lifecycleController: LifecycleController {
            parameters:
                @display("p=50,200");
        }
        scenarioManager: ScenarioManager {
            parameters:
                script = default(xml("<scenario/>"));
                @display("p=50,250");
        }
}

//##### (marker for doxygen)
