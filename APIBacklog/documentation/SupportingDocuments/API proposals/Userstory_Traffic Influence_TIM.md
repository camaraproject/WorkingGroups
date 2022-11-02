| Item | Description | Support Qualifier |
|----|----|----|
|Summary|A Service is provided by EASs deployed in Edge datacenters in different geographical locations. The Service has two level of subscriptions, Premium and Free. Premium subscription provides a better QoS. Free subscription provides a best effort quality. The end users access the Service, with their UEs, via the mobile network in that geographical areas. Th Service AF uses the Traffic Influence API (exposed by the CSP) to activate the appropriate routing and QoS at the Edge of the mobile network for the Premium users, maybe for a limited period of time (e.g. during a special event). Free users access the EAS via Internet.| M |
|Roles, Actor(s) and scope|Application Function: role of Traffic Influence API consumer<br>Operator Platform: role of Traffic Influence API provider<br>User Equipment: role of Service consumer<br>Edge Application Server: role of Service delivery<br>Scope: B2B use case to activate a specific traffic flow and QoS at the Edge toward  existing EAS in the Edge datacenters| M |
|NF Requirements|| O |
|Pre-conditions|• The EASs are deployed in the Edge Service datacenters<br>• A connectivity between the Telco Edges and the Edge Service datacenters is in place.| M |
|Begins when|The AF invokes the Traffic Influence API to configure an UPF in the selected Telco Edge to route the traffic toward an EAS in the Service Edge datacenter| M |
|Step 1|The OP authorizes the request (terminates with a notification to the Consumer if it is not valid)| M |
|Step 2|The Traffic Influence API Producer validates the request (terminates with a notification to the Consumer if it is not coherent with the policies)| M|
|Step 3|The API Producer checks for network resources to implement the request (terminates with a notification to the Consumer if not available)| M |
|Step 4|The API Producer configures the network resources| M |
|Ends when|The resources are properly configured, the API Consumer gets a notification| M |
|Post-conditions|The traffic flow is routed from the UPF to the EAS| M |
|Exceptions|Step 4 can generate an exception to be notified to the API Consumer| M | 