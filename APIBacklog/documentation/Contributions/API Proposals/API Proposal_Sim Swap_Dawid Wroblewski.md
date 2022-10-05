Sim Swap API submission

| **Field** | Description |
| ---- | ----- |
| API name | Sim Swap <br/>Also known as Mobile Connect Takeover Protection|
| API owner | Dawid Wróblewski, DT, GSMA IDG |
| Initial API Contributors | Toshi Wakayama - KDDI | 
| API summary | Mobile Connect ATP provides a mechanism through which a Service Provider can submit a request to the User’s Operator (using the User’s mobile phone number (MSISDN)) to obtain information on any recent SIM pairing change related to the User’s mobile account.<br /> The API checks the last time that the SIM card associated with a mobile number (MSISDN) has changed. The response may be a timestamp or a yes/no for a defined period (e.g. last 24h).<br /><br />Used for fraud prevention in banking: a bank may query the API when a transaction appears suspicious. The SIM swap information feeds into the bank risk decision engine and security measures are applied accordingly by the bank. ​<br /><br />Used in fraud prevention for password reset (various sectors): password reset is often protected via a mobile verification e.g. SMS One Time Password. The online service provider may query the API to secure the mobile verification. A recent SIM swap may indicate a risk of account takeover fraud and the service provider can adapt the security measures accordingly.|
| Technical viability | Existing Identity API enabled on MNO ID Gateway in Mobile Connect (API Gateway) </em>.
| Commercial viability | API Commercially available (Mobile Connect APIs).<em>|
| YAML code available? | Yes - Sample from DT <br/> OPEN API Definition available - Yes <br /> Postman collection for MC ATP available on Demand |
| Validated in lab/productive environments? | YES - Available on DT Test environment (Also available in MC Test Suite)|
| Validated with real customers? | YES- Validated c 10 aggregators. </em> |
| Validated with operators? | YES. Vodafone, Orange, KPN, Telia A1</em> |
