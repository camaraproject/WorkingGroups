| **Field** | Description | 
| ---- | ----- |
| API name | Mobile provision and operation |
| API owner | Telefónica |
| API summary | The network info API enables the capability to get and understand the status of the elements that provide the mobile service. Per each of the elements, it will return the most relevant KPIs about it, namely: identifiers (IP addresses, MSISDN, IMSI, TIMSI, ICC number,…), status of the connection (stablished, disconnected, paused, …), lifecycle events (connected at, handed-over to, …) UL/DL throughput, UL/DL latency, signal level, QoS status and conflicts, geographic location (lat/long), radio nodes involved, <br>The network info API will be able to summarize and group those KPIs into API-caller defined categories and functional elements. The most relevant functional elements identified currently are <br><u><li>SIM cards</u>: return the KPIs of unique subscriptions. <br><u><li>Mobile packet data network</u>: understood as the virtual path for the traffic of a group of subscribers along the Mobile Core. It has a correspondence with the APN in 4G and slice in 5G. <br><u><li>Intra-telco network routing</u>: understood as the routes that the traffic of a group of subscribers follow inside the telco transport network, ie, traffic to the Internet or traffic to an specific subscriber site or point of presence. 
| Technical viability | This API leverages the management interfaces that the network elements provide, both for 4G, 5G and transport networks. | 
| Commercial viability | This API enables the monitoring and operation of advanced products with specific network requirements in terms of guaranteed QoS, security or performance that cannot be built nowadays with the required levels of confidence, agility and speed of operation.|
| YAML code available? | NO|
| Validated in lab/productive environments? | NO |
| Validated with real customers? | NO |
| Validated with operators? | NO (Telefónica is validating it internally) |