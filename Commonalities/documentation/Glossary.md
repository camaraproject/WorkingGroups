# Glossary

| Term      | Description | Usage in API (Parameter/Field) | Alternative developer-friendly terms |
| ------------ | ----------- | ----------- |  ----------- |
| Device Identifier | Identifier for a device |  UeId  | device_identifier  |
| Server Identifier | Identifier for an application server   | AsId  |server_identifier  |
| External Id | Mobile network operator provided identifier | ExternalId  |?  |
| Carrier Billing (a.k.a. Direct Carrier Billing) | An online payment process which allows users to make purchases by charging payments against OB Billing Systems, accordingly to the user's configuration in the OB. In a common usage in the industry, the payment is processed on current account balance or charged on next bill generated for this line | N/A | N/A |
| Purchase | The action of acquiring a (set of) good(s)/service(s). Order fulfilment is not triggered from this request as it relies on merchant's responsibility | purchase_id | purchase_identifier |
| Payment | The process of paying for a (set of) good(s)/service(s) | paymentId | payment_identifier |
| 1-STEP Payment | Payment process performed in one phase (i.e. one action), that involves all the OB Carrier Billing Systems checking and trigger the charging request against Billing Systems | N/A | N/A |
| 2-STEP Payment | Payment process performed in two phases (i.e. two actions). First action deals with payment preparation request to guarantee the reservation of the involved amount. Second action is an explicit confirmation or cancellation of the payment by the user. Any payment not confirmed/cancelled by a given user is discarded after some time in order to avoid inconsistency in the billing systems | N/A | N/A |

















#### Note: The above entries are just samples provided from the commonalities. We propose the individual subprojects to contribute the concrete terms in the document as deemed fit. If the usage in an API is already using a developer friendly term, the last column can be left blank.
