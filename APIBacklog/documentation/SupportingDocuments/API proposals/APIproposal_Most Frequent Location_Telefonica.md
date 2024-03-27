| **Field** | Description | 
| ---- | ----- |
| API family name | Most Frequent Location | 
| API family owner | Telefonica |
| API summary | Provides validation, in terms of scoring, of the user's expected home area (defined by a Postal/Administrative Code) employing processed information of the user's historical network connection location (CellID). For applications, the API provides scoring information to validate the reported home area with the one calculated by the operator based on the real device connections, so applications can take decisions in case of missmatch. The service will require as input the user identifier, like MSISDN, and the location code or area and country. The output will consist of a scoring defining the posibility that the requested area is determinign the home adress of the user. |
| Technical viability | The service will employ historical processed information on the network location of the users, and will calculate a probability (scoring) about the likelihood of that area being the home location of the user. Only real network information will be used, while CRM or customer registration information will not be employed, since it is part of other existing APIs like KYC.<br> In terms of privacy management, privacy assesments will be handled as any other API, country per country, operator per operator and use case per use case. As any other API, the "purpose" of the product/service will mandate the lawful base for the API, for instance (just example, not binding) Antifraud use cases may be baed on legitimiate interest.|
| Commercial viability | The service is suitable for applications that require information of the users main home/place of residence, like those that provides customized experience for family groups or spscial disccounts when multiple accounts are actively used by the same members of a family. Additional use cases are focused on banking companies or any other who requires the validation of the registered address of their customers with real information.| 
| YAML code available? | NO<br> To be provided  |
| Validated in lab/productive environments? | YES |
| Validated with real customers? | YES |
| Validated with operators? | YES<br> Proposal validated in OGW drop3 |
| Supporters in API Backlog Working Group | Telefonica, Telecom Italia |
