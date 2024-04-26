# API Proposal Template
This template captures all the information that a partner should fill out when proposing a new API (or API family) to CAMARA.


| **Field** | Description | 
| ---- | ----- |
| API family name | Shutdown Service Status |
| API family owner | ChinaUnicom |
| API summary | This API allows users to obtain the current shutdown status of a certain phone number, including Voice/SMS in shutdown, Voice/SMS out shutdown, and data service shutdown.<br>Anti fraud: When receiving SMS or phone calls from a suspended number, it may be a disguised fraudulent number, which can provide security risk alerts.<br>Customer service support: If a user reports that they are unable to receive calls or text messages, customer service personnel can determine whether the problem is caused by the phone voice function being shut down by checking the phone's status. |
| Technical viability | Operators can obtain the shutdown and resumption status of mobile network users by querying the information in the UDM/HSS contracted network element devices of the mobile network. 
| Commercial viability | For use in anti fraud, customer service support and other scenarios|
| YAML code available? | NO |
| Validated in lab/productive environments? | YES , it was in lab network. |
| Validated with real customers? | NO |
| Validated with operators? | YES , one operators participated in the evaluation. |
| Supporters in API Backlog Working Group |  |
