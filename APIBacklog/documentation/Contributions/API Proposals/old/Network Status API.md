# Use Case: Adapting Video Encoding to the Network Conditions

There are several applications where a large number of cameras can be deployed within an enterprise location or campus. These cameras can collectively generate a significant amount of traffic. The behavior of these cameras can collectively have a significant impact on the traffic within the network.



When processing data from a video camera the bandwidth required is highly dependent on the encoding settings within the camera. The bandwidth can be controlled by either changing the resolution of the video or the encoding quality.



There is a trade-off between video quality and delay. If the delay reaches a threshold it is more desirable to reduce video quality than to have the highest possible video quality. It is desirable to reduce the video quality if it reduces the network delay for the video delivery.



These cameras can be centrally managed and be configured to generate different levels of traffic. Configuration of the cameras can impact the amount of traffic in the following ways:



1.  Encoding and resolution. A high quality high resolution video stream will consume significantly more bandwidth than a low resolution low quality video stream.
2.  Event triggering. Intelligent cameras can react to events detected by the camera and generate video when an event occurs. For example the camera may be configured to only send video when motion or a person is detected by the camera. The selection of the event triggers may also impact the amount of traffic generated. For example triggering on the detection of motion will generate more traffic than triggering when persons are detected.

In case of the network becoming congested the management system can adapt the configuration of cameras and prioritize cameras which are more important.



The application monitors an API which provides an indication of the status of the network. This status may include the delay and traffic levels and other parameters that would indicate the performance of the network.



Based on the status that is provided to the Application calling the API, the Application adjusts the encoding level to best suite the condition in network.

### Inputs

-   A list of identifiers that enables the network to determine the location of the devices connected to the network and hence the relevant network conditions for those devices.

### Outputs

-   A list of identifiers with the relevent network status for each identifier.

### Notifications

Notification when a change of network status occurs.

### Notes

-   We need to determine the relevant network status parameters that can be provided for the application. For example the delay within the network, traffic load etc.
