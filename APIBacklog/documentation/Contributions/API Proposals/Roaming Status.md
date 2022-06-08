# Roaming Status API
Device (i.e. UE) status indications are an important family of APIs where the API consumer is not the device itself. One status indication that has several use cases is the roaming status of the device. Roaming in this context is defined as being connected to a network other than the subscriber's home network, and so would include national roaming (where allowed) in addition to international roaming.

For example, such information could be useful in the following scenarios:
- For regulatory reasons, where a customer may need to be within a certain jurisdication, or outwith others, in order for transactions to be authorised
- For security / fraud reasons, to establish that a customer is located in the country where they claim to be
- For service delivery reasons, to ensure that the customer has access to particular services, and will not incur roaming charges in accessing them

### Inputs
- The target UE whose roaming status is required should be explicitly identified by its GPSI (MSISDN or External Identifier). It is not expected that the UE itself will call this API, and hence OpenID Connect will not identify the target UE.
- When a boolean indication of whether or not a UE is in a specific country is required, the ISO country code for that country must also be provided

### Outputs
It is proposed that a roaming status API is able to provide the following information to API consumers:
- A boolean indicator of roaming state (i.e. roaming / not roaming)
- if roaming, an indicator of whether that is national or international roaming (i.e. does the ISO country code for the home MCC equal that of the visited MCC or not)
- The ISO country code corresponding to the MCC of the network the device is currently connected to or, where the MCC does not have a corresponding ISO country code, the MCC itself
- The full PLMN of the network that the device is currently connected to (MCC + MNC)
- A boolean indicator of whether a device is in a specified country (specified by ISO country code)

### Notifications
It should be possible for the API caller to be notified of any change in roaming status

## Implementation
UE roaming status information can be obtained either directly from the HSS, or via the SCEF/NEF "ROAMING_STATUS" monitoring capability

## Notes
- API consumers would be able to access all or only some of this information, depending on their level of authorisation
- Some lucky countries (e.g. UK, USA, India, China) have multiple MCCs, hence care must be taken when deciding roaming status on the basis of the visited network MCC
- A very few MCCs are shared between multiple countries (specifically, countries with different ISO country codes - for example, French DROMs or British Crown Dependencies). In these cases, the ISO country code needs to be determined from the full visited network PLMN.
