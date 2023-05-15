
# Glossary

| Term      | Description | Usage in API (Parameter/Field) | Alternative developer-friendly terms |
| ------------ | ----------- | ----------- |  ----------- |
| **Device** | End-user equipment able to connect to a mobile network. Examples of devices include smartphones or IoT sensors/actuators.   | device |  |  |
| **Application Server** | A server hosting backend applications to deliver some business logic to clients. | applicationServer |  |  |
| **Phone Number** |A public identifier addressing a telephone subscription. In mobile networks it corresponds to the MSISDN (Mobile Station International Subscriber Directory Number). In order to be globally unique it has to be formatted in international format, according to E.164 standard.  | phoneNumber |  |  |
| **Network Access Identifier** |  A public identifier addressing a subscription in a mobile network. In 3GPP terminology, it corresponds to the GPSI formatted with the External Identifier ({Local Identifier}@{Domain Identifier}). Unlike the telephone number, the network access identifier is not subjected to portability ruling in force, and is individually managed by each operator.| networkAccessIdentifier  |  |  |
| **IP v4 Address** | Identifier of a node in a network using Internet Protocol version 4 (IPv4). IPv4 uses 32-bit addresses, which are insufficient to allocate unique addresses to all current devices. In order to mitigate this, network operators use Network Address Translation (NAT), mapping a private IP address space to a public one. | ipv4Address |  |  |
| **IP v6 Address** |  | ipv6Address |  |  |  |  |
| **Carrier Billing** (a.k.a. Direct Carrier Billing) | An online payment process which allows users to make purchases by charging payments against OB Billing Systems, accordingly to the user's configuration in the OB. In a common usage in the industry, the payment is processed on current account balance or charged on next bill generated for this line | N/A | N/A |
| **Purchase** | The action of acquiring a (set of) good(s)/service(s). Order fulfilment is not triggered from this request as it relies on merchant's responsibility |purchaseId | purchaseIdentifier |
| **Payment** | The process of paying for a (set of) good(s)/service(s) | paymentId | paymentIdentifier |
| **1-STEP Payment** | Payment process performed in one phase (i.e. one action), that involves all the OB Carrier Billing Systems checking and trigger the charging request against Billing Systems | N/A | N/A |
| **2-STEP Payment** | Payment process performed in two phases (i.e. two actions). First action deals with payment preparation request to guarantee the reservation of the involved amount. Second action is an explicit confirmation or cancellation of the payment by the user. Any payment not confirmed/cancelled by a given user is discarded after some time in order to avoid inconsistency in the billing systems | N/A | N/A |
| **IP Address** | An single internet protocol address, specified using either "dotted-decimal" format (for IPv4) or IETF 5952 format (for IPv6). The source ip address is the ip address of the message sender, and the destination ip address is the ip address of the recipient. The description will make it clear which is required. | ip | ipAddress sourceIpAddress destinationIpAddress |
| **Port** | A 16 bit number (in the range 0 - 65535) used by the TCP (IETF RFC 9293) and UDP (IETF RFC 768) protocols to identify different applications flows and services. The source port is the port alloacted to the message sender, and the destination port is the port allocated to the recipient. The description will make it clear which is required. | TBD | sourcePort destinationPort devicePorts applicationServerPorts  |
| **Service Class** | A statement of the required QoS characteristics of a traffic aggregate. Conceptually, a service class refers to applications with similar characteristics and performance requirements. Each service class is mapped to a DSCP value according to RFC4594 guidelines. The DSCP value is used to classify the target home device's traffic so that it can be treated accordingly (i.e. to meet its QoS needs). |serviceClass |  |
| **Event Type** | Type of event subscribed for notifications. More details and parameter definitions are included in chapter 12 of API Design guidelines.  |  eventType|  |
| **Latitude** | | latitude |
| **Longitude** | | longitude |
| **accuracy** | | accuracy |
| **Location Verification result** | As value is a boolean, it matches better with an adjective. In future versions we may need to enhance current response model to give mor information about the verification process, for example to deal with partial matches. |locationVerified |
| **Telco Operator Edge site** | MEC Datacenter. Term for the documentation. |N/A|N/A |
| **API Producer** | Software component, in the OP, that exposes the API. Term for the documentation. |N/A|N/A |
| **API Consumer** | Software component in the Application implemented by the Developer, that consumes the API produced by the API Producer. Term for the documentation. |N/A|N/A |













#### Note: If the usage in an API is already using a developer friendly term, the last column can be left blank.
