# Glossary

| Term      | Description | Usage in API (Parameter/Field) | Alternative developer-friendly terms |
| ------------ | ----------- | ----------- |  ----------- |
| Device Identifier | Identifier for a device |  UeId  | device_identifier  |
| Server Identifier | Identifier for an application server   | AsId  |server_identifier  |
| External Id | Mobile network operator provided identifier | ExternalId  |?  |
| Carrier Billing (a.k.a. Direct Carrier Billing) | An online payment process which allows users to make purchases by charging payments against OB Billing Systems, accordingly to the user's configuration in the OB. In a common usage in the industry, the payment is processed on current account balance or charged on next bill generated for this line | N/A | N/A |
| Purchase | The action of acquiring a (set of) good(s)/service(s). Order fulfilment is not triggered from this request as it relies on merchant's responsibility | purchaseId | `purchase_identifier` |
| Payment | The process of paying for a (set of) good(s)/service(s) | paymentId | `payment_identifier` |
| 1-STEP Payment | Payment process performed in one phase (i.e. one action), that involves all the OB Carrier Billing Systems checking and trigger the charging request against Billing Systems | N/A | N/A |
| 2-STEP Payment | Payment process performed in two phases (i.e. two actions). First action deals with payment preparation request to guarantee the reservation of the involved amount. Second action is an explicit confirmation or cancellation of the payment by the user. Any payment not confirmed/cancelled by a given user is discarded after some time in order to avoid inconsistency in the billing systems | N/A | N/A |
| IP Address | An single internet protocol address, specified using either "dotted-decimal" format (for IPv4) or IETF 5952 format (for IPv6). The source ip address is the ip address of the message sender, and the destination ip address is the ip address of the recipient. The description will make it clear which is required. | `IP` | `ip_address` `source_ip_address` `destination_ip_address` |
| Port | A 16 bit number (in the range 0 - 65535) used by the TCP (IETF RFC 9293) and UDP (IETF RFC 768) protocols to identify different applications flows and services. The source port is the port alloacted to the message sender, and the destination port is the port allocated to the recipient. The description will make it clear which is required. | `Port` | `port` `source_port` `destination_port` |
| Anonymised Subscriber Identifier | A secure, pseudonymized token derived from a hashed/encrypted pseudonymous internal identity linked to a user’s network subscription. This token will allow the API caller to recognize a user without revealing any directly identifiable personal data and thereby enable them to optimize the delivery of online display advertising and perform site/app optimization. | `anonymised_subscriber_identifier` | |
| IMEI | The International Mobile Equipment Identity is a fixed unique neumberic identifier for the physical device connected to a mobile network, such as a mobile phone. It is unrelated to the mobile subscription (identified by the SIM). The format of the IMEI is defined by 3GPP, and a database of allocated IMEIs maintained by the GSMA | `imei` | `mobile_phone_identifier` |
| IMEISV | IMEI with additional Software Version. The software version numbers get updated as the OS on the mobile device is updated, so this number is not constant. The IMEI can be derived from the IMEISV, but not vice-versa | `imei_sv` | `mobile_phone_identifier_with_sv` |
| TAC | Type Allocation Code - an 8 digit identifier for the make, model and revision number of a particular physical mobile device. This identifier forms part of the full IMEI and IMEISV. | `tac` | `mobile_phone_type_allocation_code` |











#### Note: The above entries are just samples provided from the commonalities. We propose the individual subprojects to contribute the concrete terms in the document as deemed fit. If the usage in an API is already using a developer friendly term, the last column can be left blank.
