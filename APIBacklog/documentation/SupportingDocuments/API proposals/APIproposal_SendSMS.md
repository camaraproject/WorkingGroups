# API Proposal Template
This template captures all the information that a partner should fill out when proposing a new API (or API family) to CAMARA.


| **Field** | Description | 
| ---- | ----- |
| API family name | SMS API |
| API family owner | Airtel |
| API summary | This API is used to send SMS to the destination address(es). There are 3 different categories of SMS i.e. Service, Promotional & Transactional. This API is used to send all categories of messages. Pre-requisite for using this API is that SMS Sender application / enterprise (or customer) needs to onboard itself with the access provider before using this API. This API has only single operation i.e. Send SMS - Provides the capability to deliver SMS to the recepient. In order to the receive delivery receipt separate API to be defined which is to be implemented by the API consumer for sending back the delivery receipt to the 'Send SMS' API consumer in a standardized callback API.|
| Technical viability | This API is exposed to the consumers over HTTPS. Operator/Implementor of this API connects to SMSC for sending SMS to the destination address.
| Commercial viability | Lot of Telemarketers require this functionality to run campaigns and send notifications.</em>|
| YAML code available? | NO. |
| Validated in lab/productive environments? | YES. <br>It is validated in production environment. |
| Validated with real customers? | YES. <br>Real API consumers are already integrated in production environment with this API for sending SMS notifications to the actual customers. </em> |
| Validated with operators? | NO. <br>  </em> |
| Supporters in API Backlog Working Group | List of supporters. <br><em> NOTE: That shall be added by the Working Group. </em> |
|
