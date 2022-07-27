# Home Devices Prioritization API

It may be useful for applications to request the prioritization of an specific device traffic on the user home network. Setting the device prioritization would guarantee certain QoS (Quality of Service) among other devices connected to same home network improving user experience in the application running on the prioritized device.

For example, device prioritization capability could be useful in scenarios such as:

- A user using head-mounted display device for VR/AR applications is prioritized in user home router to improve the user experience. VR/AR applications require high bandwidth for the big amount of data to be streamed. 
- A user using VoIP application in a home device which is prioritized in order to have lower latency (improving call quality or avoiding dropped calls).  

### Inputs

- Unique identifier of the user the home network belongs to i.e. unique identifier of the user within the operator providing the internet service to the home.
- DSCP (Differentiated Services Code Point) value used to prioritize traffic of the target home device.
- Internal IP address of the connected device in the home network.
- Public IP address identifying the target home network (router external IP address). 

### Outputs

No output is provided beyond the success/error response confirming whether prioritization has been successfully applied or not.

### Notifications

No notifications are required for this API

## Implementation

Device prioritization status can be applied/updated in the home network router. 

## Notes

- User consent will be required for the application to prioritize the device traffic.
