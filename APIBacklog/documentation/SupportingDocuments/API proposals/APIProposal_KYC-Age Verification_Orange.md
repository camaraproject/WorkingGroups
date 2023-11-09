Age Verification API submission

| **Field** | Description |
| ---- | ----- |
| API name | Age Verification |
| API owner | Orange but this API should be part of KYC project lead by Toshi Wakayama (KDDI) |
| Initial API Contributors | Gille Renoux/ Ludovic Robert - Orange | 
| API summary | This API allows for the API Consumer to check if the owner/user of the line is older than a provided age. The request parameter are a device identifier (like other CAMARA API) and an age (provided in years). The answer indicate if the user/owner is older than this age. The API objective **is not to provide the exact age** but to provide an information from telco aggregated information. Minimum Age requested could be limited per country (For example only age above 18 year could be checked). <br/> Illustration of use: Operator can send back a 0: KO, 1: OK but also an -1 if operators have any doubts and so aware the service provider that additional way of checking should be needed. Of course detail of the API will be discussed in the WG.|
| Technical viability | This API uses mobile subscriber info to determine with aggregated information if the user/owner of the line is older than the request age to be checked.  </em>.
| Commercial viability | This service is requested in several UC to limit app access service in being  compliant with laws in countries, access to specific contents Betting, Gambling( 18, 21, 23, 25 years old depending on countries or state), adults,… social networks,… <br/> This service can be serves also in APPs to verify the availability for a transaction (payment, money transfert,… in App payment)
. |
| YAML code available? | No - to be provided |
| Validated in lab/productive environments? | No |
| Validated with real customers? | No </em> |
| Validated with operators? | Yes in GSMA Drop 3</em> |