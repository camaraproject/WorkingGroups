| **Field** | Description | 
| ---- | ----- |
| API family name | QoD Provision Mode |
| API family owner | Telefonica |
| API summary | (*As a scope modification of the existing QoD API*)<br> <br>QoD Service provides the customer with the ability to set certain profile of QoS to an access network connection. Currently, the API supoports a session mode:  <ul><li>the developer wants to set the required QoD profile for a certain period of time, after which the be network configuration must be set back to the default one.</li></ul> But there is another possible use case for QoD, which is not currently supported: <ul><li>the developer wants to set the required QoD profile indefinitely, this is, each time that the UE connects to the network, it will use the required QoD profile instead of the default one, until the association is removed.</li></ul> Proposed evolution of the existing API is to add support for a new "provision" mode, complementary to the current "session mode", with equivalent operations under a new path, to model: <ul><li>Creating a QoD provision for a device </li><li>Removing a QoD provision for a device </li><li>Getting the QoD provision details for a device</li><li>Updating QoD provision details for a device</li></ul>|
| Technical viability | Same tecnhical concerns and limitations apply as in the existing QoD service, already validates in live commercial environments|
| Commercial viability | This new model is more convenient for those B2B use cases where the devices being connected are used for a single purpose. For example reporters on the move, using backpacks to cover events and perform live video connections, that need the networking conditions provided by the QoD profile each time the backpack is used.|
| YAML code available? | YES |
| Validated in lab/productive environments? | ONGOING <br> Telefonica testing environment |
| Validated with real customers? | PLANNED <br> As trial with Telefonica's customer |
| Validated with operators? | NO |
| Supporters in API Backlog Working Group |  |
