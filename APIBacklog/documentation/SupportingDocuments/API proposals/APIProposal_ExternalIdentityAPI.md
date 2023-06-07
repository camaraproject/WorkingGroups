External Identity API submission

| **Field** | Description |
| ---- | ----- |
| API name | External Identity API |
| API owner | Daniel Okonkwo, GSMA |
| Initial API Contributors | Daniel Okonkwo - GSMA | 
| API summary | API allows an application to exchange a temporary ID such as IP address to a permanant or semi permanant ID that allows off net identity without using personal information. Identity is in the format of "Identity@domain" The identity is an encryption of the user msisdn and the requesting party. It may also have a valid to period associated. Identity will only be decodable by the issuing operator and will allow API consumption off net and with a longer session where IP address may change. Will be discussed in the CAMARA identity stream |
| Technical viability | Will need a new data entry in the network and associated lookup to convert from External identity to MSISDN for usage in the network |
| Commercial viability | API will allow other APIs where identity is not available from IP address and msisdn is not desitable |
| YAML code available? | No - To be developed |
| Validated in lab/productive environments? | No |
| Validated with real customers? | No |
| Validated with operators? | No |
