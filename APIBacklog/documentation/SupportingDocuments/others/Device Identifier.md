# Device Identifier API
Device (i.e. UE) status indications are an important family of APIs where the API consumer is not the device itself. One status indication that has several use cases is the identity of the device being used by the subscriber. This information is known to the mobile network in the form of the IMEI, which is primarily used for blacklisting unauthorised devices. However, there are scenarios where this information can be useful to external API consumers.

For example, such information could be useful in the following scenarios:
- For insurance purposes, to automatically identify a device that a customer wishes to insure
- For security / fraud reasons, to establish that a customer is not using a device they claim to have broken or lost
- For service delivery reasons, to optimise content for a particular device or OS type

### Inputs
- The target UE whose device identity is required should be explicitly identified by its GPSI (MSISDN or External Identifier). It is not expected that the UE itself will call this API, and hence OpenID Connect will not identify the target UE.

### Outputs
It is proposed that a device identifier API is able to provide the following information to API consumers:
- The full IMEI or IMEISV of the device
- The IMEI TAC (Type Allocation Code), identifying the model of the device being used
- The manufacturer of the device

### Notifications
It should be possible for the API caller to be notified of any change in device identifier (i.e. the end user has transferred their SIM to a new device)

## Implementation
UE device identity information can be obtained directly from the HSS

## Notes
- API consumers would be able to access all or only some of this information, depending on their level of authorisation
- A device IMEISV can change over time with software updates, but the IMEI remains constant
