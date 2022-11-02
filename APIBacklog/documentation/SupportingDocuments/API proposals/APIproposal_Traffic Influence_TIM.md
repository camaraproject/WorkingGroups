| **Field** | Description | 
| ---- | ----- |
| API name | Traffic Influence |
| API owner | TIM, TEF |
| API summary | 
||The Traffic Influence API provides the AF with the ability to modify the connection policies of UEs and EAS in terms of how the traffic flows (QoS and routing.<br> <br>For a 5G network, the UPF in the target DNAI can be updated with new traffic steering rules, for a set of users, with a specific QoS.<br> <br>The  PDU Session Anchor UPF may be relocated considering the user plane latency requirements provided by the AF.<br> <br>A basic scenario foresees the AF requesting the connection of an EAS to the Core Network user plane, typically at the Edge. Local Breakout - LBO  (on 4G or 5G networks) on the closest UPF must be implemented.<br> <br>A further scenario foresees the UE moving from one geographical area to another. The AF could move the application session from one EAS in one Edge Data Network to another EAS in another Edge Data Network. As a consequence, a new anchor UPF could be selected.|
| Technical viability | • NEF (Rel-15)<br>• UDM (Rel-15)<br>• TDF (Rel-11)
| Commercial viability | --|
| YAML code available? | YES (for the basic scenario)|
| Validated in lab/productive environments? | YES  (for the basic scenario). On a production network trial |
| Validated with real customers? | NO|
| Validated with operators? | YES, with  TIM|

