# Anonymised Subscriber Identifier
It can be useful for a web service to automatically identify a client device (specifically, the associated ISP subscription) attempting to access its services, independently of any identity that the device itself may announce. This may be because the web service does not require the customer to identify themselves (e.g. a free service, or one funded by advertising rather than subscription), or because it is desirable to identify the device on first contact before formal identification / authentication has been completed.

The client device can usually be identified from the source IP and port they have been allocated by the network, which are dynamic but can be associated with the device at any instant in time by the network (this is the basis for lawful intercept). This information itself is personally identifiable information (PII) which the customer is unlikely to agree can be shared, and anyway has implications for the web service to securely store or process this information. However, it can be anonymised (e.g. by hashing), allowing the web service to recognise that a customer is returning to the site, even if the identity of the customer is not known.

For example, such information could be useful in the following scenarios:
- To present the customer with a customised landing page, before formal identification / authentication
- For security / fraud reasons, to establish that the anonymised identifier matches other credentials presented
- For customer tracking to provide customised content, such as advertising

### Inputs
- The source IP and port allocated with the device accessing the web service. The device itself will not call this API, and hence these values are not those of the API consumer.

### Outputs
- An anonymised identifier for the subscription associated with the device that is currently allocated the specified IP and port. This can be returned as a string to support the many different anonymisation schemes that may be in use.
- The anonymised identifier expiry policy as set by the API provider and included in the resource schema

### Notifications
No notifications are required for this API

## Implementation
UE identity information can be from the network lawful intercept system and anonymised using any suitably secure algorithm (e.g. SHA256)

## Notes
- API consumers may only have access to an anonymised identifier for some client devices, depending on permissions given. It is for the API backend to validate these permissions.
- This API will not work if the route between the network and the web service includes proxies, VPNs or other network elements that NAT the source IP address
- It is not expected that a common anonymised identifier will be returned by all API providers. Indeed, it is not even necessary that a common identifier is provided to all API consumers for a given network.
