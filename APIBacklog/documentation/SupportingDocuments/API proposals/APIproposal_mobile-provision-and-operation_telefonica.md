| **Field** | Description | 
| ---- | ----- |
| API name | Mobile provision and operation |
| API owner | Telefónica |
| API summary | **High level description**<br>The mobile provision and operation API is in charge to expose the capability to control the lifecycle of a mobile service in a programmatic way. It will prepare, supply, and configure all the required elements needed to connect the cellular network capable devices with their corresponding backend services. It includes the provision of: <br><u>SIM cards</u>: assign SIM cards to customers, provision its network capabilities: advanced services (voice, SMS, …), QoS and/or APNs<br><u>Mobile packet data network</u>: defines the virtual path for the traffic of the SIM card along the Mobile Core. It includes the addressing plan for the SIMs, the expected QoS to be applied, the geographic area where the traffic will emerge, …. It has a correspondence with the APN in 4G and slice in 5G. <br><u>Intra-telco network routing</u>: defines the path for the traffic inside the telco network, ie, from the PGW(4G) / UPF(5G) to its expected destination: customer point of presence (ie, fixed line subscription), telco edge site or the Internet.|
| Technical viability | This API leverages the management interfaces that the network elements provide, both for 4G, 5G and transport networks. | 
| Commercial viability | This API enables the creation and operation of advanced products with specific network requirements in terms of guaranteed QoS, security or performance that cannot be built nowadays with the required levels of confidence, agility and speed of operation.|
| YAML code available? | NO|
| Validated in lab/productive environments? | NO |
| Validated with real customers? | NO |
| Validated with operators? | NO (Telefónica is validating it internally) |
