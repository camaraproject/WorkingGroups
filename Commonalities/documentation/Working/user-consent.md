# User Consent Management

This document captures guidelines, compliant with GDPR requirements, for Operator NaaS platform to handle user consents.

## Table of Contents

  - [Introduction](#introduction)
  - [Glossary of Terms and Concepts](#glossary-of-terms-and-concepts)
  - [Purposes](#purposes)
    - [Purpose levels](#purpose-levels)
    - [Purpose relationship with other key concepts](#purpose-relationship-with-other-key-concepts)
  - [Login authorization requirements and purpose usage](#login-authorization-requirements-and-purpose-usage)
    - [Using purpose parameter in the authorization request](#using-purpose-parameter-in-the-authorization-request)
    - [Non-automatic purpose requirements for the Login authorization](#non-automatic-purpose-requirements-for-the-login-authorization)
  - [Obtaining an access token for non-automatic purposes](#obtaining-an-access-token-for-non-automatic-purposes)
  - [Consent API and GDPR API](#consent-api-and-gdpr-api)
  - [Annex: Flow source code](#annex-flow-source-code)
    - [Delegated authorization jwt-bearer flow](#delegated-authorization-jwt-bearer-flow)
    - [Consent gathering with Consent API flow](#consent-gathering-with-consent-api-flow)


## Introduction

Operator NaaS platform implementing CAMARA should be built following a Privacy By Design approach to fully comply with the spirit and letter of the [GDPR regulation](https://gdpr-info.eu/), which provides a great level of protection for user privacy. This means that an API that process Personal Information needs a user consent. Consents are given by users to legal entities to process personal data under a specific purpose.

This document captures guidelines for Operator NaaS platform to handle user consents to comply with GDPR requirements in an easy way. It introduces the concept of **purpose** in OpenID Connect, which is built on top of OAuth 2.0. These User consent management guidelines define a procedure for application back-ends to obtain access tokens for purposes which require user consent. It relies on an existing previous authorization session of the user (where user identity was validated against the corresponding Identity Provider). Application back-ends will be then able to get access tokens with the required purposes on behalf of the user (i) referring to a previous authorization, and (ii) without requiring further user interaction in between, once the user consent is collected. 

Auth server will not manage the user consent during authorization process. Consent gathering from users is a one-off independent process that must be completed before the actual access to the information.

The above also allows Operator NaaS platform to have consent control centralized in a third party instead of being done in Auth Server. Auth Server will check if the user has provided the consent to the purposes requested before issuing an access token.

## Glossary of Terms and Concepts

The list below introduces several key concepts on how to handle user personal information data.

- `Application`: client system that requires access to protected resources. Application must use the appropriate access token to access those resources.
- `User`: the resource owner.
- `Auth Server`: authorization server which receives requests from applications to issue an access token upon successful authentication and consent of the user. From a standards viewpoint, this corresponds to the OpenID Connect Provider. The OpenID Connect Provider is able to authenticate the user validating user identity against the corresponding Identity Provider. The authorization server exposes two endpoints: the Authorization endpoint and the Token endpoint.
- `Identity Provider (IdP)`: from a standards viewpoint, it corresponds to the OpenID Identity Provider. The OpenID Identify provider is the party that provides user authentication as a service (i.e. creating, maintaining, and managing user identity information).
- `Resource Server`: a server that protects the user resources and receives access requests from applications. It accepts and validates an Access Token from the application and returns the appropriate resources to it.
- `Scope`: OpenID Connect scope name which maps one or more resources. Some scopes may refer to Personal Information that could be affected by data protection regulations that require identifying the purpose for which they are requested.
- `Data processing`: storing, transforming, or accessing Personal Information is considered processing data.
- `Purpose`: The reason for which processing that Personal Information is required by the application. For example, an application might want to handle Personal Information to create a movie recommendation for a user. This is equivalent to the term Purpose mentioned in GDPR law; for example, [Art. 5 of the law](https://gdpr-info.eu/art-5-gdpr/) states the following: "_Personal data shall be […] collected for specified, explicit and legitimate_ _**purposes**_". Additionally, _personal data_ is translated into Personal Information resources, as explained below.
- `Personal Information Scope`: also known as PI scopes, these are scopes that refer to resources providing access to Personal Information and thus requiring special protection as stated by the GDPR law in EU, for example. **Getting access to PI scopes must always be done by explicitly declaring a purpose**. Therefore, a Purpose maps to a predefined set of PI scopes, giving access to Personal Information processing.
- `Consent`: an explicit opt-in action that the user takes to allow processing of their Personal Information. Consent can be a signature on a paper, a voice recording or clicking on an _authorize_ button on a website. And it grants a **legal entity** (e.g., the operator or a specific 3rd Party) access to a set of **scopes** of a given **user** , under a specific **purpose**.
- `Legal Entities`: are the legal subjects that are willing to get access to personal information with a specific, predefined purpose.

## Purposes

A purpose declares what the application intends to do with a set of Personal Information resources. It provides a human-friendly description of why the data processing takes place and a list of the scopes of that Personal Information that give access to its processing.

```json
[
  {
    "id": "create-invoice",
    "title": "Create an invoice",
    "description": "Creation of monthly invoice",
    "level": "legitimate_interest",
    "pi_scopes": ["cdr-read", "subscribed-products-read"]
  },
  {
    "id": "create-credit-score",
    "title": "Credit score",
    "description": "Calculate a credit score for the user",
    "level": "consent",
    "pi_scopes": ["invoice-read"]
  },
  {
    "id": "digital-invoice",
    "title": "Digital Invoice",
    "description": "Send invoice by email",
    "level": "contract",
    "pi_scopes": ["invoice-read"]
  },
  {
    "id": "improve-network-performance",
    "title": "Improve Network Performance",
    "description": "Network performance improvement by QoS control",
    "level": " terms_and_conditions",
    "pi_scopes": ["qos-session-write"]
  },
]
```
The GDPR defines several different types of purposes, which are grouped into three categories.

- **Automatic purpose** : This purpose does not require explicit consent from the user and cannot be revoked. For example, you need to handle call logs to create an invoice.
- **Opt-out purpose** : This purpose does not require explicit consent from the user, but consent can be revoked. For example, processing invoices to improve our commercial offering and for marketing purposes.
- **Opt-in purpose** : This purpose requires explicit user consent and can be revoked. For example, creating a credit score for a user based on CDRs and payment history.

### Purpose levels

Depending on the purpose categories defined by the GDPR the purpose may have a specific level that determines the processing allowed by the user if the purpose is granted. **User consent is required to gain access to non-automatic purposes.**

The Purpose Levels of the table below are direct translations from the [Art.6 of the GDPR](https://gdpr-info.eu/art-6-gdpr/). For example, this sentence from that article: _The data subject has given consent to the processing of his or her personal data for one or more specific purpose._

Shall be translated into this:  _In order to process a specific personal information resource, the user needs to give his/her consent to a purpose which has a purpose level of type "consent"_.


| **Purpose Level** | Description | Type |
| --- | --- | --- |
|`legal_obligation` | A process that is required by law. | Automatic purpose |
|`contract` | A process that is needed to fulfill the service contract with the user, and it is already approved when the contract was signed. | Automatic purpose |
|`legitimate_interest`| An interest of the data processor that does not conflict with the fundamental interest of the individuals. | Opt-out purpose |
|`compatible` | A re-processing of data acquired through another purpose that is compatible with the first purpose. | Opt-out purpose|
|`consent` | This level applies to purposes which are unrelated enough to the service. | Opt-in purpose|
|`terms_and_conditions`| The operations or tasks done by an application to provide its functionality, as described in the Terms and Conditions. | Opt-in purpose|


> _NOTE: This list of levels MAY be extended with new values. The OpenID Provider (Auth Server) and the APIs used by the Relying Parties (client Applications) MUST be ready to support new values in the future._

Notice that `terms_and_conditions` is not mentioned in GDPR law, but as it obeys to the same rules that a _consent_ (it requires the user opt-in), it has been modelled in that way.

### Purpose relationship with other key concepts

The key concepts defined to handle user personal information are related to purpose concept in the following way:
- Scopes tell what resources (e.g. APIs) are accessible under those scopes.
- A purpose has associated a set of PI scopes. 
  - These are scopes which refer to resources providing access to PI and thus requiring special protection as stated by the GDPR law.
  - Getting access to PI scopes MUST always be done by explicitly declaring a purpose.
- Scopes are assigned to an application, granting access to APIs and other resources.
- Purposes are assigned to an application.

Therefore, an application will have access to:
  - APIs or resources covered by the assigned scopes
  - APIs or resources providing personal information under the assigned purpose (because of the PI scopes included in that purpose)
    - **Only** if user has granted her consent for that purpose
    - Which may happen automatically (automatic purposes) or may need a user opt-in depending on the purpose level of the purpose associated to that consent. In the second case, the consent is created and stored through Operator NaaS platform.

## Login authorization requirements and purpose usage

### Using purpose parameter in the authorization request

The application can request a list of purposes in the authorization request of the [OAuth 2.0 Authorization Framework](https://www.rfc-editor.org/rfc/rfc6749) using an additional "purpose" parameter:

| **/authorize request param** | Description | Type |
| --- | --- | --- |
| `purpose` | The value of this parameter is expressed as a list of space-delimited, case-sensitive strings. The strings will be the id of the purposes. | OPTIONAL |

This parameter has been defined in these guidelines to comply with GDPR law, allowing applications to provide a purpose/s name which represents the reason why a client application needs to process a certain piece of user Personal Information. Note that, as explained before, a purpose maps to a list of scopes giving access to Personal Information resources. **The**  **"purpose"** **parameter in the Login authorization request can only be used to request automatic purposes (not requiring explicit consent from the user).**

_Example: requesting "purpose\_1", "purpose\_2" and "purpose\_3"_

```http
GET /authorize/response_type=code&client_id=s6BhdR&purpose=purpose_1%20purpose_2%20purpose_3 
```

The access token obtained from Token Endpoint will be granted to a subset or to all the scopes included in the requested purposes. The authorization server MAY fully or partially ignore the scopes of the requested purposes based on the authorization server policy. The authorization server MUST include the obtained scope list in the `scope` response parameter of the Token Endpoint to inform the client of the actual scopes granted.

The authorization server MUST include the obtained purpose list in the `purpose` response parameter of the Token Endpoint. The purpose MUST only be included in the response if at least one scope of the purpose has been granted.

_Example: only scopes of the "purpose\_1" and "purpose\_2" have been granted_

```http
POST /token
Content-Type: application/x-www-form-urlencoded
Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW

grant_type=authorization_code&code=SplxlOB&redirect_uri= https%3A%2F%2Fclient%2Eexample%2Ecom%2Fcb

HTTP/1.1 200 OK
Content-Type: application/json;charset=UTF-8

{
  "access_token":"2YotnFZFEjr1zCsicMWpAA",
  "token_type":" Bearer",
  "expires_in":3600,
  "scope":"scope_1_of_purpose_1 scope_2_of_purpose_1 scope_1_of_purpose_2",
  "purpose":"purpose_1 purpose_2"
}
```

The example above is provided for `authorization_code` grant type, but it is extensible to other authorization grants like [device authorization grant](https://www.rfc-editor.org/rfc/rfc8628).

The authorization endpoint still MUST support the `scope` parameter of the OAuth 2.0 specification. The `scope` parameter may be used to request an token ID or refresh token using OpenID Connect standard scopes; to request scopes not associated to Personal Information or to request access to the API/s to manage the user consent.

The application can request the Authorization endpoint using both parameters (`scope` and `purpose`), or one of them.

PI scopes cannot be requested using `scope` parameter. As stated before in this document, getting access to PI scopes must always be done by explicitly declaring a purpose. If a PI scope is requested by the `scope` parameter, it will be ignored and removed from the request in Auth Server.

_Example: requesting "purposes" and "scopes" on authorization request_

```http
GET /authorize/response_type=code&client_id=s6BhdR&purpose=purpose_1%20purpose_2%20purpose_3&scope=scope_1%20scope_2
```

The authorization server MUST include all the obtained scopes and PI scopes in the `scope` response field of the Token Endpoint Request, the obtained scopes of the purposes and the obtained scopes of the `scope` parameter.

### Non-automatic purpose requirements for the Login authorization

When the login authorization process is successfully accomplished, the response of the Token endpoint MUST include an additional `authorization_id` field that uniquely identifies the authorization session created for the user using the login authorization flow:

| **/token response field** | **Description** | **Type** |
| --- | --- | --- |
| `authorization_id` | A global uniquely ID that identifies the authorization. The `authorization_id` can be used in other flows to obtain new access tokens with different purposes/scopes related to the same user authorization.This field is optional to allow the capability of an auth server to not create new access tokens related to the same authorization. | OPTIONAL |

The ```authorization_id``` is an additional parameter defined in these guidelines and required by Operator NaaS platform to request a new access token for non-automatic purposes as will be explained later.

The Login authorization flow in Auth Server will NOT allow requesting purposes that need user consent (**non-automatic purposes**), because it is required to delegate the consent management to a third party. In this scenario, he Auth server will return an error for the Login authorization flow. 

Example:
```json
{
  "error": "invalid_purpose",
  "error_description": "Invalid purpose: create-credit-score. It needs consent from user."
}
```

For the Operator NaaS platform, it is proposed to mandate the application to request the Login authorization without the non-automatic purposes to get an `authorization_id` (i.e. a successful login authorization session is created for the user). With this approach, the application will then use the resulting `authorization_id` with a "jwt-bearer" flow to get new access tokens on behalf of the authenticated user for the required non-automatic purposes.

_Example: scopes of automatic "purpose\_1" and "purpose\_2" have been granted, and  "authorization\_id" is provided in the response._

```http
POST /token
Content-Type: application/x-www-form-urlencoded
Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW

grant_type=authorization_code&code=SplxlOB&redirect_uri= https%3A%2F%2Fclient%2Eexample%2Ecom%2Fcb

HTTP/1.1 200 OK
Content-Type: application/json;charset=UTF-8

{
  "access_token":"2YotnFZFEjr1zCsicMWpAA",
  "token_type":" Bearer",
  "authorization_id":"AAAorm2v3v4b3n4otnXdFtGhUhDf",
  "expires_in":3600,
  "scope":"pi_scope_1_of_purpose_1 pi_scope_2_of_purpose_1 pi_scope_1_of_purpose_2",
  "purpose":"purpose_1 purpose_2"
}
```

## Obtaining an access token for non-automatic purposes

The OpenID Connect specification does not define how to get access tokens for scopes that require consent management. It is basically a recommendation described in the [Open ID Connect Specification](https://openid.net/specs/openid-connect-core-1_0.html#Consent) about how the Auth server can capture the consent of the requested scopes, that it MAY be done through an interactive dialogue with the end-user.

There is also no specific solution defined for a scenario where the Auth server cannot capture the consent and it must be delegated to a third party.

For the Operator NaaS platform, it is needed to define a delegated authorization procedure for an application backend to obtain access tokens for purposes which require explicit user consent. This procedure MUST rely upon existing previous authorization session of the user (i.e. using the `authorization id` result of a previous login authorization flow where user identity was validated against the corresponding IdP). This procedure does not require further user interaction in between, once the user consent is collected. Consent gathering from users is a one-off independent process that must be completed before requesting an access token to access the required Personal Information. The **Consent API** is used to register user consent.

The proposal is to use the [Assertion Framework for OAuth 2.0 Client Authentication and Authorization Grants (RFC 7521)](https://datatracker.ietf.org/doc/html/rfc7521) specification using an assertion of type JWT as described in [JSON Web Token (JWT) Profile for OAuth 2.0 Client Authentication and Authorization Grants (RFC 7523)](https://datatracker.ietf.org/doc/html/rfc7523), which uses the "**urn:ietf:params:oauth:grant-type:jwt-bearer**" grant type. The figure below illustrates the workflow.

![Delegated authorization jwt-bearer flow](./images/userconsent-1.png)

_Example: getting an access token for the non-automatic purpose "improve-network-performance" with an "authorization\_id" representing a valid previous login authorization session._

```http
POST /token
Content-Type: application/x-www-form-urlencoded
Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW

grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2F1dGguZXhhbXBsZS5iYWlrYWxwbGF0Zm9ybS5jb20vIiwiaXNzIjoiaHR0cHM6Ly9ZT1VSX0FQUCIsInN1YiI6IjQxMmQ2MDZmLTQ5MzctNDQzYi1iNWU3LWE4ZDBmNjNlZjBiYyIsImF1dGhvcml6YXRpb25faWQiOiI5NmVlZTBjMy1hNGEwLTQ0MTMtYTliZC0zYzMwMDUwYzUwZDIiLCJwdXJwb3NlIjoicHVwb3NlXzEgcHVycG9zZV8yIiwiZXhwIjoxNTA0ODA3NzMxLCJpYXQiOjE1MDQ4MDQxMzEsImp0aSI6IjUzZjQyZWIxLWI3NTEtNDRiNS1iYWRhLTY5OTBlMDhmMzVhZCJ9.SIHLtTkbB0ch8_WX7y7B4_epSkXf3m7K2U8BMUTaWKy9wOHTo85wcyVGps3mn_1_ZlBhCqFojAmO6n5vVlU_PFtwgLuPw5I_Z3AUOxwYODgmlaoOmobmsAV-BDWOyQY1t5rMKgjyA1bfHgn8d2G97Jo-JfWkpYrcKya9oj8ugP1Oa9L4w-4hDN9InCQw81FU7Ut-LK36fvB1qrFHYizEzLUWTeME0H9dm_UxP1J9nQPMdJzUNz-rQnWyQiYjOGWnU8s2SK5pKblXWxcac7Jk8eKdZjetX9eWHdJMwygWBp5isMOCINxyKNsqCghxpVk61C4L7eKMBXI0pWYSqjtThg

HTTP/1.1 200 OK
Content-Type: application/json;charset=UTF-8

{
  "access_token":"2YotnFZFEjr1zCsicMWpAA",
  "token_type":" Bearer",
  "authorization_id":"AAAorm2v3v4b3n4otnXdFtGhUhDf",
  "expires_in":3600,
  "scope":"qos-session-write",
  "purpose":"improve-network-performance"
}
```

The response must return a new created `access_token` with the granted scopes and purposes. The `authorization_id` in the response MUST be the same as the one included in the assertion. A new `authorization_id` MUST NOT BE created. New `authorization_id` can only be created using the Login authorization flow because it represents an access session for an authenticated user.

The login authorization session expiration will be extended if the initial `authorization_id` was requested with the `offline_access` scope. The `refresh_token` obtained with initial `authorization_id` is still valid and can still be used to extend the login authorization expiration with the Refresh token.

The Auth server MUST check the user consent of the purposes given in the assertion using the **Consent API**, verifying that the opt-in has been previously captured and registered by the application or a delegated third party. No error response will be received if the consent for non-automatic purposes is not active or revoked. The purposes will be just removed from the response or the access token. An error will only be received if after all the filtering processes in Auth Server there is no scope left in the access token.

The assertion to request an access token related to a previous authorization will include de following fields:

| **assertion field** | Description | Type |
| --- | --- | --- |
| `aud` | The audience for this assertion. | REQUIRED |
| `iss` | The issuer identifier associated to the app. | REQUIRED |
| `sub` | The sub that can be extracted from the ```id_token``` obtained with the Login authorization flow corresponding with the ```authorization_id```. It usually represents a user id. | REQUIRED |
| `exp`| The timestamp (UNIX epoch time format) at which this JWT assertion will expire. | REQUIRED |
| `iat` | The timestamp (UNIX epoch time format) at which this JWT assertion was issued. | REQUIRED |
| `jti` | A globally unique identifier for this JWT assertion. | REQUIRED |
| `authorization_id` | The `authorization_id` of the previous authentication obtained with Login authorization flow. It represents a valid authorization session for which the new access token will be created. | REQUIRED |
| `scope`| The list of scopes, separated by space, that the app requests for the new access token. | OPTIONAL |
| `purpose` | The list of purposes, separated by space, that the app requests for the new access token. | OPTIONAL |

_Example: assertion to get an access token for a previous _authorization\_id_ for the non-automatic purpose "improve-network-performance"._

```json
{
  "aud": "https://auth.example.com/",
  "iss": "https://your-app-issuer.example.com",
  "sub": "412d606f-4937-443b-b5e7-a8d0f63ef0bc",
  "authorization_id": "96eee0c3-a4a0-4413-a9bd-3c30050c50d2",
  "purpose": "improve-network-performance",
  "exp": 1504807731,
  "iat": 1504804131,
  "jti": "53f42eb1-b751-44b5-bada-6990e08f35ad"
}
```

The assertion must be a Signed JWT (JWS), so the application MUST provide the Auth server with the public key to verify the signature. The recommended mechanism is that the app provides an endpoint where it publishes the JWK to be used for the verification, but other mechanisms can be enabled such as a fix key provisioned for the application.

## Consent API and GDPR API

As described in previous sections, an Operator NaaS Platform shall be built following a Privacy by Design approach, which guarantees an application can only access or modify the personal information it has permission to. This means that every time an application wants to use an API containing personal information, the Platform checks automatically purpose, purpose level, and user opt-in. However, this way of working **requires to implement a Consent API**.

The reasons why Consent API is required are two:

1. A third-party application can register the **consent** gathered from a **user** for a specific **purpose** which grants access to user personal information associated to some specific **scope/s**. Consent is collected by a third-party and not directly managed in auth server.
2. During delegated authorized process (jwt-bearer flow), the **auth server** can validate as pre-requisite to issue an access token if there is user consent (opt-in) registered for the user and the requested purpose/s. 

Operator NaaS platform MUST define **Consent API** and **delegated authorization** (jwt-bearer flow) to meet current requirements in telco operators, where user consents are gathered and managed by a third-party element and not by Auth server itself.

The API allows an application back-end to perform the following actions on behalf of a specific user:

- Find if it has the consent to fulfill a certain purpose.
- Create a consent
- Revoke a consent
- Simply inform that the consent was prompted to the user but he did not accept it

But there is another API required, referred to as the **GDPR API**. This API is required for the management and provision of purposes, legal entities, and PI scopes. In order to request access to Personal Information under certain purpose, that purpose must be previously provisioned (see example in [Purposes](#purposes) section), and the PI scopes associated properly defined. In the same way, user consent is created for the legal entity associated to the client application and those legal entities must be also provisioned.

So typically, the steps that an application backend will need to follow having an access token (let's call it _access\_token\_1_) for a logged in user (login authorization) would be as follows:

1. Try to get a second access token (let's call it _access\_token\_2_) for the non-automatic purposes associated to the application.
2. If an error is received or if in the `purpose` field of the token response there are one or more missing purposes for which the application needs to be granted access to, then application will need to ask the user for consent.
3. Using _access\_token\_1_, get the information from the GDPR API to prompt the user for consent for each of the purposes the application requires (i.e. "opt-in" field of the provisioned purpose).
4. Using _access\_token\_1_, create the consents captured through the Consent API.
5. Wait for the completion of the consent creation (status polling by `operation_id`)
6. Repeat step 1 and now the application back-end should receive all the purposes the application needs listed in the `purpose` field of the token response you get. This is _access\_token\_2_.
7. Use _access\_token\_2_ to consume the scopes the application requires.

Below you can see a flow diagram explaining these steps for an application that wants to consume the _Health API_ under the purpose _determine-health_.

![Consent gathering with Consent API flow](./images/userconsent-2.png)

## Annex: Flow source code

### Delegated authorization jwt-bearer flow

```
participant "App" as app
participant "App Backend" as BE
participant "Auth Server" as AS
participant "API Gateway" as AG
 
app -> +BE: [1] Consume Service API\nresource protected under\npurpose {improve-network-performance}
alt JWT-Bearer grant type
BE -> +AS: [2] POST /token\nBody: signed JWT assertion\n\nAssertion includes:\n sub: {user_id},\n authorization_id: {authorization_id},\n purpose: improve-network-performance
note over AS: Validate Consent
AS --> -BE: [3] HTTP 200 OK\naccess_token: {access_token}\nauthorization_id: {authorization_id}
end
BE -> +AG: [4] Access Service API\nAuthorization: Bearer {access_token}
AG -->-BE: [5] HTTP 200 OK
BE --> -app: [6] HTTP 200 OK
```

### Consent gathering with Consent API flow
```
participant "User" as user  
participant "App Backend" as BE    
participant "Operator NaaS platform\n(Auth Server/API GW)" as ONP   
 
note over BE: App Backend has access_token_1 for the logged-in user.\nIt can use it to read purposes via GDPR API,\nread and write consents via Consents API\nand refresh_token to extend the session.  
 
BE -> +ONP: [1] POST /token\nBody: signed JWT assertion\nclient_id: {application}\ngrant_type: urn:ietf:params:oauth:grant-type:jwt-bearer\n\nAssertion includes:\n sub: {user_id},\n authorization_id: {authorization_id},\n purpose: determine-health   
 
alt No Consent exists   
  ONP --> -BE: error getting token or purpose determine-health missing   
  note over BE: [2] App Backend needs to gather consent for determine-health  
  BE -> +ONP: [3] GET gdpr/v1/purposes/determine-health\nAuthorization: Bearer {access_token_1}  
  ONP --> -BE: purpuse info {level, UX, descriptions, etc}   
  BE -> user: Do you consent?  
  user -> BE: Yes  
  BE -> +ONP: [4] POST /clients/v2/clients/consents\nAuthorization: Bearer {access_token_1}\n{"purpose_id": "determine-health"}   
  ONP --> -BE: HTTP 2O2 Accepted {operation_id}  
  loop   
    BE -> +ONP: [5] GET /operations/v2/operations/{operation_id}   
    ONP --> -BE: HTTP 200 OK  {global_status: "InProgress"} 
  end 
  BE -> +ONP: [5] GET /operations/v2/operations/{operation_id}   
  ONP --> -BE: HTTP 200 OK  {global_status: "Completed"}
  note over ONP: At this point, Operator NaaS Platform is aware of the consent\ngiven by the User to the Legal Entity developing the App\nfor the purpose indicated.  
  alt JWT-Bearer grant-type   
    BE -> +ONP: [6] POST /token\nBody: signed JWT assertion\nclient_id: {application}\ngrant_type: urn:ietf:params:oauth:grant-type:jwt-bearer\n\nAssertion includes:\n sub: {user_id},\n authorization_id: {authorization_id},\n purpose: determine-health   
    ONP --> -BE: HTTP 200 OK\naccess_token: {access_token_2}  
  end  
 
else Consent exists
  ONP --> -BE: HTTP 200 OK\naccess_token: {access_token_2}    
end  
 
note over BE: App Backend now has a token to consume health API\nunder determine-health purpose  
BE -> +ONP: [7] Access health API\nAuthorization: Bearer {access_token_2}   
ONP --> -BE: HTTP 200 OK {"health": "average"}
```