| Item | Description | Support Qualifier |
|----|----|----|
|Summary|An Enterprise owns Edge datacenters in different geographical locations. The Enterprise is activating an Edge Application (EAS) in those datacenters. The end users access the Edge Application via the mobile network in that geographical areas. The Edge Application has low latency requirements therefore, once activated the application, the Enterprise uses self provisioning (exposed by the CSP) to activate the appropriate routing and QoS at the Edge of the mobile network. | M |
|Roles, Actor(s) and scope|Enterprise: role of API consumer<br>CSP: role of API provider<br>End Users: role of application users<br>EAS: Edge Application Server, role of third-party Service delivery<br>Scope: B2B use case to activate a specific traffic flow and QoS at the Edge toward  Application Servers activated (newly deployed or already existing) by the Enterprise| M |
|NF Requirements|| O |
|Pre-conditions|• A connectivity between the Telco Edge and the Enterprise datacenters is in place<br>• The Enterprise has activated EASs on its Edge datacenters.| M |
|Begins when|A system owned by the Enterprise (API Consumer) invokes the API to redirect the traffic flow toward an endpoint (the EAS) in a Data Network| M |
|Step 1|The CSP platform (API Producer) validates the request (terminates with a notification to the Consumer if it is not valid)| M |
|Step 2|The API Producer verifies the request against the policies (terminates with a notification to the Consumer if it is not coherent with the policies)| M|
|Step 3|The API Producer checks for network resources to implement the request (terminates with a notification to the Consumer if not available)| M |
|Step 4|The API Producer configures the network resources| M |
|Ends when|The resources are properly configured, the API Consumer gets a notification| M |
|Post-conditions|The traffic flow is routed from the Edge Core Network to the Data Network of the Enterprise| M |
|Exceptions|Step 4 can generate an exception to be notified to the API Consumer| M | 
