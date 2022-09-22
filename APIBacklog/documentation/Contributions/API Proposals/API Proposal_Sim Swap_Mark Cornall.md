Sim Swap API submission

| **Field** | Description |
| ---- | ----- |
| API name | Sim Swap |
| API owner | To Be Advised |
| API summary | The API checks the last time that the SIM card associated with a mobile number (MSISDN) has changed. The response may be a timestamp or a yes/no for a defined period (e.g. last 24h).<br /><br />Fraud prevention in banking: a bank may query the API when a transaction appears suspicious. The SIM swap information feeds into the bank risk decision engine and security measures are applied accordingly by the bank. ​<br /><br />Fraud prevention for password reset (various sectors): password reset is often protected via a mobile verification e.g. SMS One Time Password. The online service provider may query the API to secure the mobile verification. A recent SIM swap may indicate a risk of account takeover fraud and the service provider can adapt the security measures accordingly.|
| Technical viability | Existing Identity API requiring query of HLR records - Identify the underlying network/cloud capabilities which are needed for the support of CAMARA API, relating these capabilities them to standards maturity. <br><em>Example: this API requires the availability of NEF with this Rel-15 "X"feature</em>.
| Commercial viability | Specify the availability of commercial or (industrialized) open-source solutions for the identified network/cloud capabilities. <br><em> NOTE: If open-source, provide a publicly available reference/link to the actual solution, and specify the version under consideration.</em>|
| YAML code available? | NO |
| Validated in lab/productive environments? | YES. Version of SIM SWAP already available in multiple production markets but some differences in implementation <br>If YES, specify if it was lab network or productive network. |
| Validated with real customers? | YES . Already live in Multiple markets for fraud use cases in Banking/Payments <br>If YES, specify how many customers participated in the evaluation , and what their use cases were. <br><em>NOTE: It is not mandatory (though recommendable) to specify the name of the customers. </em> |
| Validated with operators? | YES. Multiple markets already have SIM SWAP available as non CAMARA specification  <br> If YES, specify how many operators participated in the evaluation. <br><em>NOTE: It is not mandatory (though recommendable) to specify the name of the operators. </em> |
