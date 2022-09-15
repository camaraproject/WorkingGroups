| **Field** | Description | 
| ---- | ----- |
| API name | Traffic Influence |
| API owner | TIM |
| API summary | 
||It provides the customer with the ability to modify the connection policies of UEs and applications in terms of how the traffic flows (QoS and routing). <br> <br>Regardless of the underline mobile network technology (4G or 5G), the API exposes the capability to influence the traffic flow e.g. redirecting it toward the Edge Application Server providing the requested latency.<br> <br>The main scenario foresees the need to connect an Application Server to the Core Network user plane, typically at the Edge. Local Breakout - LBO  (on 4G or 5G networks) must be implemented.<br> <br>Two macro use cases:<br> <br>Application onboarding: at the application onboarding stage, the user, using the Edge Cloud APIs, provides a requirement (using an API parameter) that leads the platform to implement LBO. (Traffic Influence not directly exposed to the customer).<br> <br>Application already deployed: <br> • if the application was onboarded via Edge Cloud APIs, maybe those APIs could still be used to modify the provided requirements leading the platform to implement LBO (e.g. invoking again the API with different values). (Traffic Influence not directly exposed to the customer).<br>• if the application is in the customer’s DC, already deployed by the customer not via CAMARA, the customers wants to specifically activate LBO. In this case a specific API, Traffic Influence, is requested. |
| Technical viability | • NEF (Rel-15)<br>• UDM (Rel-15)<br>• TDF (Rel-11)
| Commercial viability | Specify the availability of commercial or (industrialized) open-source solutions for the identified network/cloud capabilities. <br><em> NOTE: If open-source, provide a publicly available reference/link to the actual solution, and specify the version under consideration.</em>|
| YAML code available? | YES |
| Validated in lab/productive environments? | YES  <br> Lab and Production network. |
| Validated with real customers? | NO|
| Validated with operators? | YES, with  TIM|

