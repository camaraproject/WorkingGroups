
# API Proposal WebRTC

| **Field** | Description |
| ---- | ----- |
| API family name | WebRTC API |
| API family owner | Telefónica |
| API summary | The exposure of WebRTC and its family of APIs facilitates the integration of real-time communication directly into web applications, enabling developers to effortlessly incorporate audio, video, and data sharing functionalities. This exposure streamlines the development process, allowing seamless creation of cross-platform voice services that are exposed through interfaces that empower developers to unleash the full potential of real-time comunications on the web throught the operator's IP Multimedia Subsystem (IMS) architecture. In this sense, the proposed WebRTC API aims at offering access to operator's voice call services through IMS and in the future incorporate other IMS voice call functionalities such as video call and IMS data channel. <br> <br>*Bussines cases:*<br> - Bring your own number (BYON): Through the WebRTC API, a subscriber can use their MSISDN to register, and make and receive calls (with paralel ringing) using a SIM-less device (e.g,,smart devices, mobile phones, VR/AR glasses, etc.) through a web client or a native OS application. In this case the user needs to authenticate to use their MSISDN.  <br> - Click to call: This is a B2C use case for users to connect to Businesses (e.g. customer care, sales point) The API allows any user to make outgoing calls from any web browser in a non-simcard device and not needing to authenticate or provide specific credentials. In this use case the called number is normally fixed by Business and the calling number is picked up from a pool of numbers assigned to the Business for this service.|
| Technical viability | To support these functionalities it is needed a called WebRTC Gateway as expresed in the 3GPP standard TS 24.371 "Technical Specification Group Core Network and Terminals;Web Real-Time Communications (WebRTC) access to the IP Multimedia (IM) Core Network (CN) subsystem (IMS); Stage 3; Protocol specification".
| Commercial viability | Several vendors offer this enabler or has it on their roadmap|
| YAML code available? | YES. |
| Validated in lab/productive environments? | NO.|
| Validated with real customers? | NO. |
| Validated with operators? | NO. |