| **Field** | Description | 
| ---- | ----- |
| API family name | Blockchain Public Address |
| API family owner| Telefonica  |
| API summary | **High level description**<br> This API allows to manage a Blockchain Public Address associated to a phone number, i.e. to retrieve the blockchain public address(es) and to bind/unbind a Blockchain Public Address. The Blockchain Public Address is utilized as Decentralized Identifier (DID). With the proposed API, telco service providers have the opportunity to provide 3rd parties with the following capability: pairing phone number with Blockchain Public Address whenever this 3rd party wants to offer its customers a way to make transactions more easily based on the phone number instead of the Blockchain Public Address. <br><br>**Rationale**<br>Blockchain is a long set of alphanumeric characters, e.g. 26-35 characters in BitCoin. This identifier is not memorisable or usable by a person, so there is the possibility of positioning the telephone number as the predominant identifier on web3. This new identity protocol will make it possible to have a system similar to the Telcos' bizum in web3 ecosystem.
| Technical viability | For this API to work, the following is needed: <li> Wallets, which will be in charge of generating the DID.</li><li> Storing this DID together with the user's phone number, with prior validation that the targeted user has a telephone number. </li><li>Designing this API for it to be interoperable among the different operators</li>The operators will make this API available to 3rd parties through their API marketplaces. The operators have to protect the API against fraudulent uses, e.g. detection based on invocation patterns. |
| Commercial viability | TBD | 
| YAML code available? | YES |
| Validated in lab/productive environments? | NO<br>|
| Validated with real customers? | NO <br><br> |
| Validated with operators? | NO  </em> |

