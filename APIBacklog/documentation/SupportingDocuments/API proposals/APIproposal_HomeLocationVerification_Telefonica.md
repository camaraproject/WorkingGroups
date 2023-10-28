| **Field** | Description | 
| ---- | ----- |
| API family name | Home Location Verification | 
| API family owner | Telefonica |
| API summary | Provides validation, in terms of scoring, of the user's expected home area (defined by a Postal/Administrative Code) employing processed information of the user's historical network connection location (CellID). For applications, the API provides scoring information to validate the reported home area with the one calculated by the operator based on the real device connections, so applications can take decisions in case of missmatch. The service will require as input the user identifier, like MSISDN, and the location code or area and country. The output will consist of a scoring defining the posibility that the requested area is determinign the home adress of the user. |
| Technical viability | The service will employ historical processed information on the network location of the users, and will calculate a probability (scoring) about the likelihood of that area being the home location of the user. |
| Commercial viability | The service is suitable for applications that require information of the users main home/place of residence, like those that provides customized experience for family groups or spscial disccounts when multiple accounts are actively used by the same members of a family.  | 
| YAML code available? | NO<br> To be provided  |
| Validated in lab/productive environments? | YES |
| Validated with real customers? | YES |
| Validated with operators? | YES<br> Proposal validated in OGW drop3 |
| Supporters in API Backlog Working Group | Telefonica |