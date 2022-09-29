# Use Case: Selectively Routing Traffic to a Network Slice
5G Networks enable Network Slices which have different service levels. For a complex application there may be different types of traffic with different network performance requirements. For example there may be traffic which is used to manage the configuration of a camera and traffic that corresponds to the actual video that is captured by the camera. Management traffic may require a higher quality of service than the traffic that is associated with the video data for example. For example a higher delay may be acceptable for the video data vs low latency for configuration messages. The following Use Case illustrates how this may be used.

An application has video traffic and configuration traffic. The application routes its Configuration Traffic over a slice with higher quality of service and routes the video traffic over a slice with a lower quality of service. 

## Inputs
The application is able to query which service levels are available to the application.
## Outputs
The application is provided with a list and also the credentials and end points that will enable the application to send on a specific slice. 
## Notifications
Change of the slice configuration of the network.
The application is able to route its traffic according to its requirements for the type of traffic. 

## Notes
There is a question as to whether the 5G architecture will allow a device to connect to multiple slices simultaneously. 
