Number Verification (SMS 2FA) API submission

| **Field** | Description |
| ---- | ----- |
| API name | Number Verifiaction (SMS 2FA)|
| API owner | Dawid Wróblewski, DT, GSMA IDG |
| Initial API Contributors | Sudhir Mittal - Airtel, Varun Talus - Airtel| 
| API summary | Mobile Connect Authenticate service – a solution which offers secure user authentication to Service Providers.<br><br>Mobile Connect Authentication is defined as two service variants:<br>• Mobile Connect Authenticate, offering a standard-level of assurance (LoA2 – single factor authentication) via a single user-click or SMS OTP, and<br>•	Mobile Connect Authenticate Plus, offering a higher level of assurance (LoA3 – two factor authentication) by challenging the User for a PIN or biometric <br><br>Supporting two different levels of authentication robustness enables SPs to choose the best trade-off between user convenience and security to match their intended use case.<br><br>In addition, in situations where the User is accessing the SP over a mobile network, based on IDGW policies the Operator can authenticate the User towards the SP without any User interaction to provide a seamless (zero-click) authentication experience. This special case is considered as single-factor authentication (LoA22).<br><br>  Two-factor authentication (2FA) is achieved by combining authentication on a mobile device (something I have) with entry of a PIN (something I know) or use of a biometric (e.g. a fingerprint – “something I am”)<br>LoA2 is based on ISO 29115 standard which is used for single-factor  Mobile Connect services.|
| Technical viability | API enabled on MNO ID Gateway in Mobile Connect (API Gateway) </em>.
| Commercial viability | API Commercially available (Mobile Connect APIs).<em>|
| YAML code available? | Yes - Sample from DT <br/> OPEN API Definition available - Yes <br /> Postman collection for MC Authenticate available on Demand |
| Validated in lab/productive environments? | YES - Available on DT Test environment (Also available in MC Test Suite)|
| Validated with real customers? | YES- Validated c 10 aggregators. </em> |
| Validated with operators? | YES. Vodafone, Orange, KPN, Telia A1</em> |