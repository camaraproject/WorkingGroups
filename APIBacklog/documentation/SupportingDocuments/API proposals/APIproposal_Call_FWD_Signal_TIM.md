
| **Field** | Description | 
| ---- | ----- |
| API name | Call Forwarding Signal |
| API owner | TIM |
| API summary |The Application Server invokes the Call Forwarding Signal API (provided by the OP) to determine if a specific MSISDN has an active call forwarding setup. The Call Forwarding Signal API can be used by a bank to verify if a “call forwarding” option is active on the customer’s phone to avoid frauds. A call from the bank to the customers can indeed be forwarded to a different number because of a fraud attempt.|
| Technical viability | |
| Commercial viability | The API is useful to avoid frauds. Banks offer the option for users to receive telephone calls to solve problems, e.g. in case of issues with the bank App, issues with Smartphones, the bank website or any tool providing access to the online bank account management system.<br>How does the fraudster operate?<br>• Through social engineering, the fraudster gathers information about bank customers who are engaged in such a situation, needing the bank to contact them.<br>• Once they identify the service provider and phone number of a customer, they manage to successfully activate, on the customer profile, the 'call forwarding' to a phone number they control.<br>After successfully setting up 'call forwarding,' the fraudster then contacts the bank, claiming an inability to access online banking services and requesting a call from a bank representative. When the bank calls the registered contact number of the user, the active 'call forwarding' diverts the call directly to the fraudster, thus completing their scheme.<br> The Call Forwarding Signal API can be used by the bank to verify if a "call forwarding" option is active on the customer's phone, avoiding such a fraud.|
| YAML code available? | NO |
| Validated in lab/productive environments? | YES  (in Lab). |
| Validated with real customers? | NO |
| Validated with operators? | YES, with  TIM|