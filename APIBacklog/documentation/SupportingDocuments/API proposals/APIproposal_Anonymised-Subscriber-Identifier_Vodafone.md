# Anonymised Subscriber Identifier


 | **Field** | Description | 
 | ---- | ----- |
 | API name | Anonymised Subscriber Identifier |
 | API owner | Vodafone |
 | API summary | It can be useful for a web service to automatically identify a client device (specifically, the associated ISP subscription) attempting to access its services, independently of any identity that the device itself may announce. This may be because the web service does not require the customer to identify themselves (e.g. a free service, or one funded by advertising rather than subscription), or because it is desirable to identify the device on first contact before formal identification / authentication has been completed. |
 | | The client device can usually be identified from the source IP and port they have been allocated by the network, which are dynamic but can be associated with the device at any instant in time by the network (this is the basis for lawful intercept). Any identity information (e.g. MSISDN) is personally identifiable information (PII) which the customer is unlikely to agree can be shared, and anyway has implications for the web service to securely store or process this information. However, it can be anonymised (e.g. by hashing), allowing the web service to recognise that a customer is returning to the site, even if the identity of the customer is not known. By using different anonymisation parameters (e.g. hashing salt) for each API consumer (i.e. application server), separate identifiers can be generated for each application server when accessed by the same client device. Because the anonymised identifier is application server specific, it will not be possible to track clients across different application servers. |
 | |For example, such information could be useful in the following scenarios: (1) to present the customer with a customised landing page, before formal identification / authentication, (2) for security / fraud reasons, to establish that the anonymised identifier matches other credentials presented, (3) for customer tracking to provide customised content, such as advertising. |
 | | Inputs: the source IP and port allocated with the device accessing the web service. The device itself will not call this API, and hence these values are not those of the API consumer. |
 | Technical viability | UE identity information can be from the network lawful intercept system and anonymised using any suitably secure algorithm (e.g. SHA256). |
 | Commercial viability | Lawful intercept system is usually tied to network implementation, and relies on existing network capabilities |
 | YAML code available? | NO |
 | Validated in lab/productive environments? | YES, validated in lab environment |
 | Validated with real customers? | NO |
 | Validated with operators? | NO |

