KYC Fill-in API submission

| **Field** | Description |
| ---- | ----- |
| API name | KYC Fill in |
| API owner | KDDI – Toshi (Toshiyasu) Wakayama, and MTN - Waseem Amra |
| Initial API Contributors | Telefonica – Jorge Garcia Hospital | 
| API summary | This API Provides the API invoker with mobile subscriber information, which can include MSISDN, name, postal code / address, birthdate, email address, etc.  Subject to the mobile subscriber’s consent. <br><br> Note: This API will be a part of GSMA Open Gateway APIs. <br><br> |
| Technical viability | This API uses mobile subscribers’ information usually owned by every MNO, that should be made available in fill-in process (or providing-data process), subject to the mobile subscriber’s consent. <br> <br> Some technical initial proposals are as below, but it will be discussed further to be agreed on during CAMARA work. <br><br> - Available attributes: msisdn, identity document, name (subscriber, phone user if applicable), given name, family name, kana name(reading), address, street name, region(address), postal code, birthdate, email address, Customer ID, ThirdParty ID. <br><br> Note: Alignment with KYC Match API should be considered. |
| Commercial viability | Currently KDDI provides the KYC fill in service commercially.|
| YAML code available? | YES / NO <br> To be provided |
| Validated in lab/productive environments? | YES <br> In Commercial network |
| Validated with real customers? | YES <br> It is available for KDDI customers, in B2B scenario. |
| Validated with operators? | YES <br> It is available for KDDI in Japan, in B2B scenario. |
| | |
