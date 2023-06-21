# API design guidelines

This document captures guidelines for the API design in CAMARA project. These guidelines are applicable to every API to be worked out under the CAMARA initiative.

## Table of Contents

- [API design guidelines](#api-design-guidelines)
  - [Table of Contents](#table-of-contents)
  - [Common Vocabulary and Acronyms](#common-vocabulary-and-acronyms)
  - [1. Introduction](#1-introduction)
  - [2. APIfication Principles](#2-apification-principles)
    - [2.1 Domain Driven Design](#21-domain-driven-design)
    - [2.2 API First](#22-api-first)
    - [2.3 Interface standardization. Standardization fora.](#23-interface-standardization-standardization-fora)
    - [2.4 Information Representation Standard](#24-information-representation-standard)
  - [2.5 Reduce telco-specific terminology in API definitions](#25-reduce-telco-specific-terminology-in-api-definitions)
  - [3. API Definition](#3-api-definition)
    - [3.1 API REST](#31-api-rest)
    - [3.2 HTTP Response Codes](#32-http-response-codes)
    - [3.3 Query Parameters Use](#33-query-parameters-use)
    - [3.4 Path Parameters Use](#34-path-parameters-use)
    - [3.5 HTTP Headers Definition](#35-http-headers-definition)
    - [3.6 MIME Types](#36-mime-types)
  - [4. API Resource Definition](#4-api-resource-definition)
    - [4.1 URL Definition](#41-url-definition)
    - [4.2 Input/Output Resource Definition](#42-inputoutput-resource-definition)
  - [5. Versioning](#5-versioning)
    - [5.1 Versioning Strategy](#51-versioning-strategy)
    - [5.2 Backwards and Forward Compatibility](#52-backwards-and-forward-compatibility)
  - [6. Error Responses](#6-error-responses)
  - [7. Common Data Types](#7-common-data-types)
  - [8. Pagination, Sorting and Filtering](#8-pagination-sorting-and-filtering)
    - [8.1 Pagination](#81-pagination)
    - [8.2 Sorting](#82-sorting)
    - [8.3 Filtering](#83-filtering)
  - [9. Architecture Headers](#9-architecture-headers)
  - [10. Security](#10-security)
    - [10.1 API REST Security](#101-api-rest-security)
    - [10.2 Security Implementation](#102-security-implementation)
  - [11. Definition in OpenAPI](#11-definition-in-openapi)
    - [11.1 General Information](#111-general-information)
    - [11.2 Published Routes](#112-published-routes)
    - [11.3 Request Parameters](#113-request-parameters)
    - [11.4 Response Structure](#114-response-structure)
    - [11.5 Data Definitions](#115-data-definitions)
    - [11.6 OAuth Definition](#116-oauth-definition)
  - [12. Subscription, Notification \& Event](#12-subscription-notification--event)
    - [12.1 Subscription](#121-subscription)
    - [12.2 Event notification](#122-event-notification)


## Common Vocabulary and Acronyms

| **Term** | Description |
| --- | --- | 
|**API** | Application Programming Interface. It is a rule & specification group (code) that applications follow to comunicate between them, used as interface among programs developed with different technologies.|
|**Body**| HTTP Message body (If exists) is used to carry the entity data associated with the request or response.|
|**Camel Case**| It is a kind of define the fields’ compound name or phrases without whitespaces among words. It uses a capital letter at the beginning of each word. There are two different uses:<li>Upper Camel Case: When the first letter of each word is capital.</li><li>Lower Camel Case: Same that Upper one, but with the first word in lowercase.</li>|
|**Header**| HTTP Headers allow client and server send additional information joined to the request or response. A request header is divided by name (No case sensitive) followed by colon and the header value (without line breaks). White spaces on the left hand from the value are ignored.|
|**HTTP**| Hypertext Transfer Protocol (HTTP) is communication protocol that allows the information transfer using files (XHTML, HTML…) in World Wide Web.|
|**JSON**| JavaScript Object Notation|
|**JWT**| JSON Web Token (JWT) is an open standard based on JSON proposed by IETF (RFC 7519) for access token creations allowing the identity and purposes spread. |
|**Kebab-case**| Practice in the words denomination where the hyphen is used to separate words. |
|**OAuth**| Open Authorization is an open standard that allows simple Authorization flows to be used in web sites or applications.|
|**REST**| Representational State Transfer.|
|**TLS**| Transport Layer Security or TLS is a cryptographic protocol that provides secured network communications. |
|**URI**| Uniform Resource Identifier. |
|**Snake_case**|Practice in the words denomination where the underscore is used to separate words. |


## 1. Introduction
The purpose of this document is to technically describe aspects related to the proper design of Application Programming Interfaces (hereinafter API), so that it serves as a recommended reference for the development of APIs in telco operators and related projects.

Based on principles of standardization, normalization and good practices, this document explains the guidelines for the design and definition of an API, elaborating the following points:

- How to make a proper API definition.
- What are the main aspects to cover.
- What are the best practices for designing an API and managing it properly.
  
This document is addressed to all the roles and people that may participate in a Programmable Interface (API) design and assumes that they have basic knowledge of what an API is. 


## 2. APIfication Principles

APIs are critical components of digitization that enable us to expose the functions and capabilities existing in our systems and network in a secure and standardized way (service channels, between systems/platforms and third parties/partners) without needing to redesign or re-create them (enhancing reuse) with the consequent saving of time and investment.

The APIfication program is based on the following key principles: i) Domain Driven Design; ii) API First; and iii) Standardization.

### 2.1 Domain Driven Design
The main idea of the Domain Driven Design (DDD) approach is "<em>to develop software for a complex domain, we need to build a ubiquitous language that embeds the domain's terminology in the software systems we build</em>" (Fowler, 2020).

This approach to software development focuses efforts on defining, for each defined domain, a model that includes a broad understanding of the processes and rules of that domain.

DDD approach is particularly suitable for complex domains, where a lot of messy logic needs to be organized.
The DDD principles are based on:

- Placing the organization's business models and rules in the core of the application.
- Obtain a better perspective at the level of collaboration between domain experts and developers, to conceive software with very clear objectives.

As an initial reference to define the different domains and subdomains, we rely on the TM Forum SID model, illustrated in the figure below.

![TMF SID](./images/guidelines-fig-1.png)

This set of domains and subdomains is not fixed or static and can evolve over time, depending on the needs for the development and conceptualization of new business or technological elements.

The following figure shows a representation of the concepts handled by the Domain Driven Design approach. The entities located at the bottom are those necessary to analyse the domain, while those at the top of the graph are related to the more technical part of software architecture. Therefore, Domain Driven Design is an "<em>approach to the design of software solutions that ranges from the most holistic definition to the implementation of the objects in the code</em>". 
![Domain Driven Design approach ](./images/guidelines-fig-2.png)

### 2.2 API First

API First strategy consists of considering APIs and everything related to them (definition, versioning, development, promotion...) as a product.

This design strategy considers the API as the main interface of the application and initially begins with its design and documentation, to later develop the backend part, instead of setting up the entire backend first and then adapting the API to everything built.

In this way, the technological infrastructure depends directly on the design of the services instead of being a response to their implementation.

Among the main benefits of an "API First" development strategy we can highlight:

- Development teams can work in parallel. 
- Reduces the cost of application development.
- Increases speed to market.
- Ensures good developer experiences.



### 2.3 Interface standardization. Standardization fora. 

In order to ensure the reusability of the different integrations between elements and systems is essential the agreement of the industry (network element providers, system providers, customer service providers, ...) defining a series of interfaces that ensure specific functionality and responses.

There are different organizations, standardization forums and collaboration projects that define specific interfaces for certain domains, which are then implemented by different industry agents: integrators, software manufacturers, etc... Some of these organizations, specialized in network domains, include 3GPP, ETSI, IETF and Broadband Forum, among others.

At the systems level, the reference organization is the Telemanagement Forum (TM Forum). TM Forum is a global association that drives collaboration and collective problem solving to maximize the business success of telecommunications companies and their provider ecosystem. Its purpose is to help this ecosystem to transform and prosper in the digital age.

**TM Forum Frameworx** is a set of best practices and standards for evaluating and optimizing process performance, using a service approach to operations. The tools available in Frameworx help to improve end-to-end service management in complex, multi-stakeholder environments. It has been widely adopted by the telecommunications industry, providing a common language of processes, functional capabilities, and information. 

The TM Forum Frameworx is composed of:

- Business Process Framework, also known to as enhanced Telecom Operations Map (`eTOM`): it is a reference framework for defining the business processes of telecommunications operators.
- Application Framework Fundamentals (`TAM`): it groups functionalities into recognizable applications to automate processes that will help us to plan and optimize an application portfolio.
- The Information Framework, also known to as Shared Information/Data Model (`SID`): it unifies reference data model that provides a single set of terms for business objects in telecommunications. The goal is to enable people from different departments, companies, or geographic locations to use the same terms to describe the same real-world objects, practices, and relationships.

Over the last years, TMForum is performing a complete transformation of its architecture, moving from Frameworx, whose paradigm is based on applications, to the Open Digital Architecture (`ODA`), based on modular components.

TM Forum further defines a set of reference APIs (TMF Open APIs) between the different architecture components.


### 2.4 Information Representation Standard

As a messaging standard, the use of JSON is proposed by default, since it is a light data exchange format and is commonly adopted by current web technologies, although this does not imply that other types of data cannot be used depending on functional and technical requirements. 

JSON is made up with two structures:

- A collection of key/value pairs. In various languages this is known as an object, record, structure, dictionary, hash table, key list, or an associative array.
- An ordered list of values. In most languages, this is implemented as arrays, vectors, lists, or sequences.
Data exchange format that is independent of the programming language is based on universal structures supported virtually in all programming languages.

In JSON, the following structures are represented.

An **object** is an unordered set of key/value pairs. An object starts with a "`{`" opening brace and ends with a "`}`" closing brace. Each name is followed by a “`:`” colon and key/value pairs are separated by a “`,`” comma.
<p align="center">
<img src="./images/guidelines-fig-3.png" alt="drawing" width="300"/>
</p>

An **array** is a collection of values. An array starts with “`[`“ left bracket and ends with “`]`” right bracket. Values are separated by "`,`" comma.
<p align="center">
<img src="./images/guidelines-fig-4.png" alt="drawing" width="300"/>
</p>

A **value** can be a string with double quotes, or a number, or true or false or null, or an object or an array. These structures can be nested.
<p align="center">
<img src="./images/guidelines-fig-5.png" alt="drawing" width="300"/>
</p>

A **character string** is a collection of zero or more Unicode characters, enclosed in double quotes, using backslash escaping. A character is represented by a character string of a single character. A character string is similar to a C or Java character string.
<p align="center">
<img src="./images/guidelines-fig-6.png" height="300" width="300"/>
</p>


A **number** is similar to a C or Java number, except that octal and hexadecimal formats are not used.
<p align="center">
<img src="./images/guidelines-fig-7.png" height="300" width="300"/>
</p>

**White spaces** can be inserted between any pair of symbols.
<p align="center">
<img src="./images/guidelines-fig-8.png" alt="drawing" width="300"/>
</p>

Except for minor enconding details, the above-mentioned structures provide a full description of JSON language. 

## 2.5 Reduce telco-specific terminology in API definitions
CAMARA aims to produce 'intent-based' APIs, which have two key benefits:
- for the developer: it does not assume familiarity with the network that will fulfil the API.
- for the operator: it avoids tight-coupling, meaning the API can be fulfilled by various networks (mobile, fixed, satellite etc.)  and network versions (4/5/6G etc.)

To realise these benefits it is important to reduce the use of telco-specific terminolgy/acronyms in developer-facing APIs. 

CAMARA API designers should:
- Consider and account for how the API can be fulfilled on a range of network types
- Avoid terms/types specific to a given telco domain. For example the acronym 'UE': in 3GPP terminology this refers to 'User Equipment', but 'UE' means 'User Experience' for most Web developers: 'Terminal' would be a more appropriate, and unambiguous, term. If use of a telco-specific term is unavoidable, either:
- - allow a choice, so the developer can utilise other types. E.g. `MSISDN` should not be the _only_ way to identify an end user.
- - use abstractions, which can evolve: e.g. an `endUserIdentifier` enumeration can support mulitple identifiers.
- - explain the telco-specific term in the documentation, and any constraints it brings.


## 3. API Definition

API definition aims to capture 100% of the functional, syntax and semantic documentation of a contract. It is a critical element for the business strategy and will tag the product offered success.

Outstanding aspects in the API definition are:

- API must be defined from a product view focused to API consumers. It means, it should be prepared a top-down definition of all APIs.
- Product should be focused on the usability.
- API contract must be correctly documented, and it will be published in a shared catalog.
- API exposure definition will be based on “resources could be used by different services and product consumers”. That means, API definition should be a 360-degree product view.
  
API definition must consider the next assertions:

- API resources definition contains the URI and enterprise resources.
- REST specification compliance aims make the API fully interoperable.
- API resource security.
- Product consumption experience.
- API measurement over how many, who and when it is used.
- API must be versioned, and version must figure in all operations URL. It allows a better last develops management and surveillance, it avoids out of date URLs request and it makes available coexistence of more than one version productive in the same environment.
- Expose the required fields by the API consumers only. Sometimes, all the response body is not necessary for consumers. Allows more security, less the network traffic and agile the API usability.
- One of the API Quality requirements will be the evolution and management scalability, lined with versioning and backward compatibility considerations detailed in this document.
- At API definition time is necessary include audit parameters to allow make surveillance and next maintenances.
- English use must be applied in the OpenAPI definition.

### 3.1 API REST

Representational state transfer (REST) is a software architectural style that was created to guide the design and development of the architecture for the World Wide Web. REST defines a set of constraints for how the architecture of an Internet-scale distributed hypermedia system, such as the Web, should behave. 

The formal REST constraints are as follows:

- **Client–server architecture**. The client-server design pattern enforces the principle of separation of concerns: separating the user interface concerns from the data storage concerns. Portability of the user interface is thus improved. In the case of the Web, a plethora of web browsers have been developed for most platforms without the need for knowledge of any server implementations. Separation also simplifies the server components, improving scalability, but more importantly it allows components to evolve independently (anarchic scalability), which is necessary in an Internet-scale environment that involves multiple organisational domains.
- **Statelessness**. In computing, a stateless protocol is a communications protocol in which no session information is retained by the receiver, usually a server. Relevant session data is sent to the receiver by the client in such a way that every packet of information transferred can be understood in isolation, without context information from previous packets in the session. This property of stateless protocols makes them ideal in high volume applications, increasing performance by removing server load caused by retention of session information.
- **Cacheability**: As on the World Wide Web, clients and intermediaries can cache responses. Responses must, implicitly or explicitly, define themselves as either cacheable or non-cacheable to prevent clients from providing stale or inappropriate data in response to further requests. Well-managed caching partially or eliminates some client–server interactions, further improving scalability and performance.
- **Layered system**: A client cannot ordinarily tell whether it is connected directly to the end server or to an intermediary along the way. If a proxy or load balancer is placed between the client and server, it won't affect their communications, and there won't be a need to update the client or server code.
- **Uniform interface**: The uniform interface constraint is fundamental to the design of any RESTful system. It simplifies and decouples the architecture, which enables each part to evolve independently. The four constraints for this uniform interface are:
  - <u>Resource identification in requests</u>. Individual resources are identified in requests, for example using URIs in RESTful Web services. The resources themselves are conceptually separate from the representations that are returned to the client. For example, the server could send data from its database as HTML, XML or as JSON—none of which are the server's internal representation.
  - <u>Resource manipulation through representations</u>.  When a client holds a representation of a resource, including any metadata attached, it has enough information to modify or delete the resource's state.
  - <u>Self-descriptive messages</u>. Each message includes enough information to describe how to process the message. For example, which parser to invoke can be specified by a media type.
  - <u>Hypermedia as the engine of application state (HATEOAS)</u>. Having accessed an initial URI for the REST application) analogous to a human Web user accessing the home page of a website) a REST client should then be able to use server-provided links dynamically to discover all the available resources it needs. As access proceeds, the server responds with text that includes hyperlinks to other resources that are currently available. There is no need for the client to be hard-coded with information regarding the structure or dynamics of the application.

<font size="3"><span style="color: blue"> HTTP verbs </span></font>

HTTP standard should be followed to the verbs usability, resulting an API definition oriented to the RESTful design. Any HTTP correct verb usability are allowed.

Principal methods (Verbs) available to use are next ones:

| **HTTP Verb** | **CRUD operation** | **Description** |
| ---- | ----| ----| 
GET | Read | Retrieve the actual resource status |
POST | Create | Creates a new resource in the collection. Returns the resource URL when the creation ends.|
PUT |  Update | Replaces a specific resource. Returns the resource URL when the replace ends. |
DELETE | Delete | Delete a specific resource.  |
PATCH |  Update | Updates a specific resource, applying all changes at the same time. If resource does not exist, it will be created. Returns the resource URL when the update ends. If any error occurs during the update, all of them will be cancelled.   |
OPTIONS | Read | Returns a 200 OK with an allowed methods list in the specific resource destined to the header allowed joined to an HTML document about the resource + an API Doc link.  |
HEAD | Read | Returns the resource actual status without message body. |

In this document will be defined the principal verbs to use in the API definition.

- `POST`: it is used to send date to the server.
- `GET`: it allows performing all the read and retrieve operations. GET operation should be based on data retrieving, that’s why the retrieve operation must be realized directly from the URI including some identifiers and query params.
- `PUT`: it allows update entity data, deleting one or more fields from this entity body if there are not informed.  New information to update must be informed by JSON language sent in the body request. If operation requires extra information, Query params could be used. PUT case, if registry does not exist in server data storage, it will be created, that means this operation could be used to create new resources.
- `DELETE`: it allows deleting full entities from server. From consumer perspective, it is not a reversible action. (Rollback action is not available).
- `PATCH`: it allows updating partial fields of a resource.

<br>

#### **POST or GET for transferring sensitive or complex data**

Using the GET operation to pass senstive data potentially embeds this information in the URL if contained in query or path parameters. For example, this information can remain in browser history, could be visible to anyone who can read the URL, or could be logged by elements along the route such as gateways and load balancers. This increases the risk that the sensitive data may be acquired by unauthorised 3rd parties. Using HTTPS does not solve this vulnerability, as the TLS termination points are not necessarily the same as the API endpoints themselves.

The classification of data tagged as sensitive should be assessed for each API project, but might include the following examples:
-  phone number (MSISDN) must be cautiously handled as it is not solely about the number itself, but also knowing something about what transactions are being processed for that customer
-  localisation information (such as latitude & longitude) associated with a device identifier as it allows the device, and hence customer, location to be known
-  physical device identifiers, such as IP addresses, MAC addresses or IMEI

In such cases, it is recommended to use one of the following methods to transfer the sensitive data:
- When using `GET`, transfer the data using headers, which are not routinely logged or cached
- Use `POST` instead of `GET`, with the sensitive data being embedded in the request body which, again, is not routinely logged or cached 

When the `POST` methid is used, the resource in the path *must* be a verb (e.g. `retrieve-location` and not `location`) to differentiate from an actual resource creation.

It is also fine to use POST instead of GET to bypass technical limitations, such as URL character limits (if longer than 4k characters) or passing complex objects in the request.

### 3.2 HTTP Response Codes

HTTP status response codes indicate if a request has been completed successfully. Response codes are group by five classes.

1.	Inform responses (1XX)
2.	Success responses (2XX)
3.	Redirections (3XX)
4.	Client Errors (4XX)
5.	Server Errors (5XX)

Status codes are defined in the [RFC 2616](https://tools.ietf.org/html/rfc2616#section-10) 10th section. You can get the updated specifications from [RFC 7231](https://tools.ietf.org/html/rfc7231#section-6.5.1).

Common errors are captured in the table below. 

| **Error code** | **Description** |
| ---| ---| 
| 200 | 200 (OK) status code indicates that the request result successfully<br>`GET`-> 200 HTTP Code by default.<br>`POST`/`PUT`/`PATCH` -> Resource update actions, data is returned in a body from server side.<br>`DELETE` -> Resource delete action, data is returned in a body from server side.</br>|
| 201 | 201 (Created) HTTP code indicates that the request has created one or more resource successfully.<br>`POST`/`PUT` -> When a resource is created successfully.|
| 202 | 202 (Accepted) code indicated that the request has been accepted to be processed, but it has not ended.<br>Usually, when a `DELETE` is requested but the server cannot make the action immediately. It should applies to async processes. |
| 203 |  203 (Unathourized information) code indicated that the request has been successfully, but the attached payload was modified from the 200 (OK) response from the origin server using a transformation proxy.<br>It is used when data sent in the request could be modified as a third data subset.|
| 204 | 204 (No Content) indicated that the server has ended successfully the request and there are nothing to return in the body response.<br>`POST` -> When used to modify a resource and output is not returned.<br>`PUT`/`PATCH` -> When used to modify a resource and output is not returned.<br>`DELETE` -> Resource delete action and output is not returned.<br> _NOTE: This list of levels MAY be extended with new values. The OpenID Provider (Auth Server) and the APIs used by the Relying Parties (client Applications) MUST be ready to support new values in the future._|
| 206 | 206 (Partial Content) The server has fulfilled the partial GET request for the resource.
| 400 | 400 (Bad Request) status code indicates that the server cannot or will not process the request due to something perceived as a client error (for example, malformed request syntax, invalid request message structure, or incorrect routing). <br>This code must be documented in all the operations in which it is necessary to receive data in the request.|
| 401 | 401 (Unauthorized) status code indicates that the request has not been applied because it lacks valid authentication credentials for the target resource.<br>This code has to be documented in all API operations that require subscription by a client.|
| 403 | 403 (Forbidden) status code indicates that the server understood the request, but is refusing to authorize it. A server that wants to make public why the request was prohibited can describe that reason in the response payload (if applicable).<br>This code is usually documented in the operations. It will be returned when the OAuth token access does not have the required scope or when the user fails operational security.|
| 404 | 404 (Not Found) status code indicates that the origin server either did not find a current representation for the target resource or is unwilling to reveal that it exists.<br>This code will occur on `GET` operations when the resource is not available, so it is necessary to document this return in such situations.|
| 405 | 405 (Method Not Allowed) status code indicates that the origin server knows about the method received in the request line, but the target resource does not support it.<br>This code is documented at the API portal level, it should not be documented at the API level.|
| 406 | 406 (Not Acceptable) status code indicates that the target resource does not have a current representation that would be acceptable to the user, based on the proactive negotiation header fields received in the request, and the server is unwilling to provide a predetermined representation. It must be reported when there is no response by default, and header fields are reported to carry out the content negotiation (Accept, Accept-Charset, Accept-Encoding, Accept-Language). |
| 408 | Status code 408 (Request Timeout) indicates that the server did not receive the complete request message within the expected time.<br>This code is documented at the API portal level, it should not be documented at the API level.|
| 409 | The 409 (Conflict) status code indicates when a request conflicts with the current state of the server. |
| 500 | Status code 500 (Internal Server Error) indicates that the server encountered an unexpected condition that prevented it from fulfilling the request.<br>This code must always be documented. It should be used as a general system error.|
| 501 | Status code 501 (Not Implemented) indicates that the requested method is not supported by the server and cannot be handled. The only methods that servers require support (and therefore should not return this code) are `GET` and HEAD. |
| 502 | Status code 502 (Bad Gateway) indicates that the server, while working as a gateway to get a response needed to handle the request, got an invalid response. |
| 503 | Status code 503 (Service Unavailable) status code indicates that the server is currently unable to handle the request due to a temporary overload or scheduled maintenance, which will likely be alleviated after some delay. |
| 504 | Status code 504 (Gateway Timeout) indicates that the server is acting as a gateway and cannot get a response in time. |

### 3.3 Query Parameters Use

API query parameters can be defined as key-value pairs that appear after the question mark in the URL. Basically, they are URL extensions used to help determine the specific content or action based on the data being delivered. Query parameters are added at the end of the URL, using a "`?`". The question mark is used to separate the path and the query parameters.

<p align="center">
<img src="./images/guidelines-fig-9.png" alt="drawing" width="350"/>
</p>

If you want to add multiple query parameters, an "`&`" is placed between them to form a query string. You can present lot of objects types with different lengths, such as arrays, strings, and numbers.

### 3.4 Path Parameters Use

A path param is a unique identifier for the resource. For example:

- ```/users/{userId}```

Multiple path params can be entered if there is a logical path of mutually dependent resources.
- ```/users/{userId}/documents/{documentId}```

<font size="3"><span style="color: blue"> Good Practices </span></font>


1. Path params cannot be concatenated. A path param must be preceded by the resource represented. If we did this, the URL would be incomprehensible:
   - ```/users/{userId}/{documentId}```
   - ```/users/13225365/647658```
  <br></br>
2. The attribute must be identifying itself, it is not enough with "`{id}`"
   - ```/users/{id}```
  <br></br>

   Reason is that if this resource is "extended" in the future and includes other identifiers, we would not know which of the entities the "`{id}`" parameter refers to. For example:
   - Incorrect: ```/users/{id}/documents/{documentId}```
   - Correct: ```/users/{userId}/documents/{documentId}```
<br></br>
3. It is recommended that the identifier have a similar morphology on all endpoints. For example, “`xxxxId`”, where xxx is the name of the entity it references:
   - ```/users/{userId}```
   - ```/accounts/{accountId}```
   - ```/vehicles/{vehicleId}```
   - ```/users/{userId}/vehicles/{vehicleId}```
<br></br>
4. Care must be taken not to create ambiguities in the URIs when defining paths. For example, if the "user" entity can be identified by two unique identifiers and we will create two URIs. 
   - ```/users/{userId}```
   - ```/users/{nif}```
<br></br>
5. Identifiers must be, as far as possible, of a hash type or similar so that we avoid enumeration or brute force attacks for their deduction.

Upon API invocation, one of the options would be chosen and we would not be able to distinguish which one was chosen.

### 3.5 HTTP Headers Definition
Request header parameters are a great addition to the design of our API functionality. The purpose of this document is not to describe all the possibilities offered by the HTTP protocol, but to try to take the use of HTTP headers into account during the definition and design of APIs, in order to improve their characteristics.

The main HTTP headers are described below:

- `Accept`: this header can be used to specify certain types of data that are acceptable for the response. `Accept` headers can be used to indicate that the request is specifically limited to a small set of desired types, as in the case of a request for an image.
- `Accept-Encoding`: similar to the `Accept` header, but restricting the content encodings that are acceptable in the response. 
- `Accept-Language`: the consumer defines the list of languages in order of preference. The server answer with the `Content-Language` field in the header with the response language.
- `Authorization`: it allows sending the authorization token for API access, initially OAuth and JWT.
- `Content-Type`: it indicates the type of message sent to the recipient or, in the case of the HEAD method, the type of message that would have been sent if the request had been a GET. The MIME type of the response, or the content uploaded via POST/PUT in case it is a request. 
- `Content-Length`: it indicates the message size, in octets, sent to the recipient or, in the case of the HEAD method, the message size that would have been sent if the request had been a GET. The size of the response in octets (8 bits) 
- `Content-Encoding`: it is used as a message type modifier. The type of encoding used in the response is indicated.
- `Host`:  specifies the host and port number of the server to which the request is being sent.

<font size="3"><span style="color: blue"> Optional recommendended security headers by OWASP </span></font>

- `HTTP Strict Transport Security`: a web security policy mechanism which helps to protect websites against protocol downgrade attacks and cookie hijacking. t allows web servers to declare that web browsers (or other complying user agents) should only interact with it using secure HTTPS connections, and never via the insecure HTTP protocol.
- `X-Frame-Options`: a response header (also named XFO) which improves the protection of web applications against clickjacking. It instructs the browser whether the content can be displayed within frames.
- `X-Content-Type-Options`: setting this header will prevent the browser from interpreting files as a different MIME type to what is specified in the Content-Type HTTP header (e.g. treating text/plain as text/css).
- `Content-Security-Policy`: it requires careful tuning and precise definition of the policy. If enabled, CSP has significant impact on the way browsers render pages (e.g., inline JavaScript is disabled by default and must be explicitly allowed in the policy). CSP prevents a wide range of attacks, including cross-site scripting and other cross-site injections.
- `X-Permitted-Cross-Domain-Policies`: a cross-domain policy file is an XML document that grants a web client, such as Adobe Flash Player or Adobe Acrobat (though not necessarily limited to these), permission to handle data across domains. When clients request content hosted on a particular source domain and that content makes requests directed towards a domain other than its own, the remote domain needs to host a cross-domain policy file that grants access to the source domain, allowing the client to continue the transaction.
- `Referrer-Policy`: it governs which referrer information (sent in the Referer header) should be included with requests made.
- `Clear-Site-Data`: it clears browsing data (e.g., cookies, storage, cache) associated with the requesting website. It allows web developers to have more control over the data stored locally by a browser for their origins.
- `Cross-Origin-Embedder-Policy`: it prevents a document from loading any cross-origin resources that don’t explicitly grant the document permission
- `Cross-Origin-Opener-Policy`: this response header (also referred to as COOP) allows you to ensure a top-level document does not share a browsing context group with cross-origin documents. COOP will process-isolate your document and potential attackers can’t access to your global object if they were opening it in a popup, preventing a set of cross-origin attacks dubbed XS-Leaks
- `Cross-Origin-Resource-Policy`: this response header (also referred to as CORP) allows to define a policy that lets web sites and applications opt in to protection against certain requests from other origins (such as those issued with elements like "`<script>`" and "`<img>`"), to mitigate speculative side-channel attacks, like Spectre, as well as Cross-Site Script Inclusion (XSSI) attacks
- `Cache-Control`: it holds directives (instructions) for caching in both requests and responses. If a given directive is in a request, it does not mean this directive is in the response

To avoid cluttering the CAMARA OAS (Swagger) definition files, the above headers must not be included explicitly in the API definition files even when supported, as it can be assumed that developers will already be familiar with their use.

<font size="3"><span style="color: blue"> The following HTTP headers are not allowed:</span></font>

- `Server`. This header offers relevant information on the server side, including version and in-scope services. It is strongly recommended to disable this header to avoid disclosing such information. 
- `X-Powered-By`. This header describes the technology used to implement the exposed service. This information can be useful to potential attackers and should be avoided.
- `X-Frame-Options`. This header is generally used to prevent clickjacking attacks, but there is a more standard header to do this called "Content-Security-Policy". This header is no longer needed.
- `X-UA-Compatible`. This header was introduced by Microsoft to provide compatibility with legacy versions of IE (IE8, IE7, ...). APIs are not considered to have a web interface, so this header is not useful.
- `Expires`. Since the `Cache-Control` header can offer an expiration date/time for cached values, this header is no longer needed and should be avoided.
- `Pragma`. The `Cache-Control` header will do the same job as "Pragma" too, it is more standard, so should be avoided.


### 3.6 MIME Types 
During the API definition process, API MIME types must be identified, explaining how the data will be sent to the resource and how the resource will return it to the consumption.

Due to interoperability reasons and in order to comply as closely as possible with REST, it is recommended using standard mime-types, avoid the creation of new mime-types.

The standard headers that allow managing the data format are:
- `Accept`
- `Content-Type`

As a MIME Types example we can identify:
- `application/xml`
- `application/json`


## 4. API Resource Definition

### 4.1 URL Definition

The figure below shows an example of URL definition.
<p align="center">
<img src="./images/guidelines-fig-10.png" alt="drawing" width="400"/>
</p>
As seen, the full URL consist of:

1. **Protocol**: transport protocol specification. We will always use HTTPS.
2.	**Domain**: machine name or domain. It is defined at the server level.
3.	**Context**: the name of the API. Our system may have several differentiated APIs according to its objectives and the relationship of its resources.
4.	**Version**: MAJOR version. Part of semantic versioning.
5.	**Resource**: specific resource that we are accessing. It can be made up of several levels.
6.	**Path param**: part of the resource identifier that precedes it. Indicates that it is the user unequivocally identified by "1244".
7.	**Query Param**: rsource filter parameters. They are preceded by "?" and as many as defined with "&" can be concatenated.

<font size="3"><span style="color: blue"> Good practices </span></font>

URIs should be designed according to the following considerations:

- URI with lowercase and hyphens. URIs must be "human readable" to facilitate identification of the offered resources. Lowercase words and hyphenation (kebab-case) help achieve this best practice. For example: `/customer-segments`
- URIs must contain the exposed resource.
- Verbs use is not allowed.
- URIs must contain the "major version" of the API. 
- The resource chain will be defined in the API URI following a hierarchical relationship.
  - `<Resource1>/{<id>}/<Resource2>/{<id>}`
  - A collection must always be followed by a member of the collection.
  - The API response should return, if possible, the hypermedia resource which it refers to. Although it is recommended that the REST API be more pragmatic to return in a single call what is necessary to avoid concatenated calls from clients.
  - Short URIs use is recommended for relevant entities. Failure to define a clear hierarchical model will lead to inconsistencies in publishing interfaces through the API and will make it difficult to consume.   
- Avoiding usage of the package type nomenclature (e.g.,"com.mycompany.api...") in the API URI, because it makes it difficult for the developer or consumer to use the API.
- URIs are defined per entity based on CRUD operations. Generally, we should only have one operation verb per functional entity (`GET`, `PUT`, `POST`, `PATCH`, `DELETE`).
- The URI at the business entity level will always be a plural noun.
- OperationIds are defined in lowerCamelCase: For example: `helloWorld`
- Objects are defined in CamelCase inside properties field. For example: `Greetings`, `ExampleObject`.


<font size="3"><span style="color: blue"> Hierachy </span></font>

Hierarchy could be introduced with the concepts of entity and sub-entity:
- **Entity**: it is understood as a enough relevant business object to be identified as a product. A single entity is defined by an API.
- **Sub-entity**: it is understood as a business object that by itself has no business relevance. It is an object that is hierarchically related to an entity.

To make the hierarchy, the following aspects must be applied:
- Two levels of hierarchy should not exceed and should not be more than 8 resources (6-8).
- A resource has multiple operations identified by HTTP Verbs.
- Resources defined through URIs establish a hierarchical relationship with each other:
  - `/<entity>`<br>
   `/<entity>/{<entityId>}`<br>
   `/<entity>/{<entityId>}/<subEntity>`<br>
   `/<entity>/{<entityId>}/<subEntity>/{<subEntityId>}`


### 4.2 Input/Output Resource Definition

At this point, some considerations are outlined about the business input and output data of the API resources. This data can be informed by different means: QueryString, Header, Body...

These considerations are below:
- API input and output business data will follow the camelCase notation.
- The field names in JSON and XML will follow the same URIs standard.
  - Business data must be human readable.
  - commercial data name must be a noun, that means, it corresponds to an entity information.

- Business data sent as part of the HTTP protocol will be exempt from these rules. In these cases, compliance with the standard protocol will apply. 
- Sensitive data (considered this way for security) must go in the body if it is a `POST` request and in the header if it is a `GET`, encrypted by default by the HTTPs protocol.
- Description of the input and output data must have:
  - Functional description
  - Data Type
  - Value range supported



## 5. Versioning

### 5.1 Versioning Strategy

Service versioning is a practice by which, when a change occurs in the API of a service, a new version of that service is released so that the new version and the previous one coexists for a certain period of time.

Consumers will be migrated to the new version of the service sequentially. When everyone is consuming the latest version of the service, the previous version is removed.

Consumers can distinguish between one version of the service and another, the technique of adding the API version to the context of the base URL will be used, since this technique is the most used in the main reference APIs.

The structure of the URL would have the following form:
```http
https://host:port/api/v1/resource
```


When we version through the URL, only the "MAJOR version" is included since this would change when a change incompatible with the previous version occurs.

API implementation versioning will follow semantic versioning. Given a `MAJOR.MINOR.PATCH` version number, it increments:
1)	The `MAJOR` version when you make an incompatible API change.
2)	The `MINOR` version when you add functionality that is backwards compatible.
3)	The `PATCH` version when you fix backward compatible bugs.

Related to the versioning of rest parts involved in Apification projects, best practises are detailed below:

SHARED CODE ON REPOSITORIES

1) MAJOR - Major of API Contract
2) MINOR - Minor of API Contract
3) PATCH - New Updates / Contributions of shared code

MICROSERVICE DEPLOYMENTS (NOT MANDATORY BUT RECOMMENDED)

1) MAJOR - Major of API Contract
2) MINOR - Minor of API Contract
3) PATCH - New Microservice Deployments


### 5.2 Backwards and Forward Compatibility

Avoid breaking backwards compatibility unless strictly necessary, that means, new versions should be compatible with previous versions.

Bearing in mind that APIs are continually evolving and certain operations will no longer be supported, the following considerations must be taken into account:

- Agree to discontinue an API with consumers.
- Establish the obsolescence of the API in a reasonable period (6 months).
- Monitor the use of deprecated APIs.
- Remove deprecated APIs documentation.
- Never start using already deprecated APIs.


<font size="3"><span style="color: blue"> Types of modification </span></font>

Not all API changes have an impact on API consumers. These changes are often referred to as backward compatible changes. If API undergoes changes of this type, it should not be necessary to release a new version, it will suffice to replace the current one. What would be very convenient is to notify our consumers with the new changes so that they take them into account.

This is a list of changes to an API that **DO NOT** affect consumers:

- Add new operations to the service. Translated to REST, it would be to add new actions on a resource (`PUT`, `POST`, ...).
- Add optional input parameters to requests on existing resources. For example, adding a new filter parameter in a GET on a collection of resources.
- Modify input parameters from required to optional. For example: when creating a resource, a property of said resource that was previously mandatory becomes optional.
- Add new properties in the representation of a resource returned by the server. For example, adding a new age field to an Person resource which originally was made up of nationality and name. 

This other list shows changes that **DO** affect consumers:
- Delete operations or actions on a resource. For example:  POST requests on a resource are no longer accepted.
- Add new mandatory input parameters. For example: now, to register a resource, a new required field must be sent in the body of the request.
- Modify input parameters from optional to mandatory. For example: when creating a Person resource, the age field, which was previously optional, is now mandatory.
- Modify a parameter in existing operations (resource verbs). Also applicable to parameter removal. For example, when consulting a resource, a certain field is no longer returned. Another example: a field that was previously a string is now numeric.
- Add new responses to existing operations. For example: creating a resource can return a 412 response code.

<font size="3"><span style="color: blue"> Compatibility management </span></font>

Tho ensure this compatibility, the following must be followed.

**As API producer**:
- New fields should always be aAdded as optional.
- Postel's Law: “<em>Be conservative in what you do, be liberal in what you accept from others</em>”. When you have input fields that need to be removed, mark them as unused so they can be ignored. 
- Do not change the field’s semantics.
- Do not change the field’s order.
- Do not change the validation rules of the request fields to more restrictive ones.
- If you use collections that can be returned with no content, then answer with an empty collection and not null.
- Layout pagination support from the start.

**As API consumer**:
- Tolerant reader: if it does not recognize a field when faced with a response from a service, do not process it, but record it through the log (or resend it if applicable).
- Ignore fields with null values.
- Variable order rule: DO NOT rely on the order in which data appears in responses from the JSON service, unless the service explicitly specifies it.
- Clients MUST NOT transmit personally identifiable information (PII) parameters in the URL. If necessary, use headers.

## 6. Error Responses

In order to guarantee interoperability, one of the most important points is to carry out error management aimed at strictly complying with the error codes defined in the HTTP protocol.

An error representation must not be different from the representation of any resource. A main error message is defined, with JSON structure with the following fields:
- A field "`status`", which can be identified in the response as a standard code from list of Hypertext Transfer Protocol (HTTP) response status codes.
- A unique error "`code`", which can be identified and traced for more details. It must be human readable; therefore, it must not be a numeric code. In turn, to achieve a better location of the error, you can reference the value or field that is causing it, and include it in the message. 
- A detailed description of "`message`"
  
A JSON error structure is proposed below: 

```json
{
   "status": 400,
   "code": "INVALID_ARGUMENT",
   "message": "A human readable description of what the event represent"
}
```

In error handling different cases must be considered, even at the functional level that it is possible to modify the error message returned to the API consumer. For this error handling there are two possible alternatives listed below:
- Error handling done with custom policies in the API admin tool.
- Error management performed in a service queried by API.
  
The essential requirements to consider would be:
- Error handling should be centralized in a single place.
- Customization of the generated error based on the error content returned by the final core service should be contemplated.
- Latency should be minimized in its management.

In the following, we ellaborate on the exisiing client errors. In particular, we identify the different error codes and cluster them into separate tables, depending on their nature: i) syntax exceptions, ii) service exceptions, and iii) server errores. 

<font size="3"><span style="color: blue"> Syntax Exceptions </span></font>

| **Error code** | Description |
|-----|-----|
|`INVALID ARGUMENT` |  A specified resource duplicate entry found. |
|`CONFLICT` |  A specified resource duplicate entry found. |
|`OUT_OF_RANGE`| Client specified an invalid range. |
|`PERMISSION_DENIED`|  Client does not have sufficient permissions to perform this action. |
|`ABORTED` |  Concurrency conflict.|
|`ALREADY_EXISTS` | The resource that a client tried to create already exists. |

<font size="3"><span style="color: blue"> Service Exceptions </span></font>

| **Error code** | Description |
|-----|-----|
|`UNAUTHENTICATED` |  Request not authenticated due to missing, invalid, or expired credentials.|
|`NOT_FOUND`|  The specified resource is not found. |
|`TOO_MANY_REQUESTS`| Either out of resource quota or reaching rate limiting. |
|`AUTHENTICATION_REQUIRED`|  New authentication is required. |

<font size="3"><span style="color: blue"> Server Exceptions </span></font>

| **Error code** | Description |
|-----|-----|
|`FAILED_PRECONDITION` |  Request cannot be executed in the current system state.|
|`DATA_LOSS`| Unrecoverable data loss or data corruption. |
|`INTERNAL`| Unknown server error. Typically a server bug.|
|`BAD_GATEWAY`| An upstream internal service cannot be reached. |
|`UNAVAILABLE`| Request timeout exceeded. |
|`TIMEOUT`| Request timeout exceeded. |
|`NOT_IMPLEMENTED`| This functionality is not implemented yet |
|`METHOD_NOT_ALLOWED`|	The requested method is not allowed/supported on the target resource. |
|`NOT_ACCEPTABLE` | The server cannot produce a response matching the content requested by the client through `Accept-*` headers. |
|`UNSUPPORTED_MEDIA_TYPE`	| The server refuses to accept the request because the payload format is in an unsupported format. |

> _NOTE: When no login has been performed or no authentication has been assigned, a non-descriptive generic error will always be returned in all cases, a `UNAUTHENTICATED` 401 “Request not authenticated due to missing, invalid, or expired credentials.” is returned, whatever the reason._


## 7. Common Data Types 

The aim of this clause is to detail standard data types that will be used over time in all definitions, as long as they satisfy the information that must be covered.

It should be noted that this point is open to continuous evolution over time through the addition of possible new data structures. To allow for a proper management of this ever-evolving list, an external repository has been defined to that end. This repository is referenced below. 

[Link to Common Data Types documentation repository](https://github.com/camaraproject/WorkingGroups/blob/main/Commonalities/documentation/CAMARA_common.json)


## 8. Pagination, Sorting and Filtering

Exposing a resources collection through a single URI can cause applications to fetch large amounts of data when only a subset of the information is required. For example, suppose a client application needs to find all orders with a cost greater than a specific value. You could retrieve all orders from the /orders URI and then filter these orders on the client side. Clearly, this process is highly inefficient. It wastes network bandwidth and processing power on the server hosting the web API.

### 8.1 Pagination
Services can answer with a resource or article collections. Sometimes these collections may be a partial set due to performance or security reasons. Elements must be identified and arranged consistently on all pages. Paging can be enabled by default on the server side to mitigate denial of service or similar.

Services must accept and use these query parameters when paging is supported:
- `perPage`: number of resources requested to be provided in the response 

- `page`: requested page number to indicate the start of the resources to be provided in the response (considering perPage page size)
- `seek`: index of last result read, to create the next/previous number of results. This query parameter is used for pagination in systems with more than 1000 records. `seek` parameter offers finer control than `page` and could be used one or another as an alternative. If both are used in combination (not recommended) `seek` would mark the index starting from the page number specified by `page` and `perPage` [index = (page * perPage) + seek].


Services must accept and use these headers when paging is supported:
- `Content-Last-Key`: it allows specifying the key of the last resort provided in the response
- `X-Total-Count`: it allows indicating the total number of elements in the collection

If the server cannot meet any of the required parameters, it should return an error message.

The HTTP codes that the server will use as a response are:
- `200`: the response includes the complete list of resources
- `206`: the response does not include the complete list of resources
- `400`: request outside the range of the resource list
 
Petitions examples:
- `page=0 perPage=20`, which returnss the first 20 resources
- `page=10 perPage=20`, which returns 20 resources from the 10th page (in terms of absolute index, 10 pages and 20 elements per page, means it will start on the 200 position as 10*20=200)



### 8.2 Sorting

Sorting the result of a query on a resources collection requires two main parameters:
- `orderBy`: it contains the names of the attributes on which the sort is performed, with comma separated if there is more than one criteria.
- `order`: by default, sorting is done in descending order. 

If you may want to specify which sort criteria you need to use "ascp" or "desc" as query value.

For example: The list of orders is retrieved, sorted by rating, reviews and name with descending criteria.
```http
https://api.mycompany.com/v1/orders?orderBy=rating,reviews,name&order=desc
```

### 8.3 Filtering


Filtering consists of restricting the number of resources queried by specifying some attributes and their expected values. It is possible to filter a collection on multiple attributes at the same time and allow multiple values for a filtered attribute.

Next, it is specified how it should be used according to the filtering based on the type of data being searched for: a text, a number or a date and the type of operation.
 
| **Operation** |	Text |	Numbers | 	Dates |
| ----- |	-----  |	 -----  |  -----  |
| Equal | `GET .../?name=Juan` | `GET .../?amount=807.24`	| `GET .../?executionDate=2018-30-05` | 
| Greater or equal	| N/A | `GET .../?amount.gte=807.24` | `GET.../?executionDate.gte=2018-30-05` |
| Strictly greater | N/A | `GET .../?amount.gt=807.24` | `GET.../?executionDate.gt=2018-30-05` | 
| smaller or equal	| N/A | `GET .../?amount.lte=807.24` | `GET.../?executionDate.lte=2018-30-05` |
| Strictly smaller | N/A | `GET .../?amount.lt=807.24` | `GET.../?executionDate.lt=2018-30-05` | 
|Contains | `GET .../?name=~Juan` |N/A | N/A | 


**Additional rules**:
- The operator "`&`" is evaluated as an AND between different attributes.
- A Query Param (attribute) can contain 1 or n values separated by "`,`".
- For operations on numeric, date or enumerated fields, the use of the suffixes `.(gte|gt|lte|lt)$` will be allowed, which will act as comparators for “greater - equal to, greater than, smaller - equal to, smaller than”.

**Examples**:
- <u>Equals</u>: to search users with first name "david" and last name "munoz":
  - `GET /users?name=david&surname=munoz`
  - `GET /users?name=David,Noelia`
    - Search for several values separating them by "`,`".
- <u>Inclusion</u>: if we already have a filter that searches for "equal" and we want to provide it with the possibility of searching for "inclusion", we must include the character "~"
  - `GET /users?name=dav`
    - Search for the exact name "dav"
  - `GET /users?name=~dav`
    - Look for names that include "dav"
- <u>Greater than / less than</u>: new attribute will be created and it will be preceded with the suffixes .(gte|gt|lte|lt)$.
  - `GET /users?creationDate.gte=2021-01-01T00:00:00`
    - Find users with creation Date greater than 2021
  - `GET /users?creationDate.gt=2021-11-31T23:59:59`
    - Find users with creationDate less than 2022
  - `GET /users?creationDate.gte=2020-01-01T00:00:00&creationDate.lte=2021-11-31T23:59:59`
    - Search for users created between 2020 and 2021


## 9. Architecture Headers

With the aim of standardizing the request observability and traceability process, common headers that provide a follow-up of the E2E processes should be included. The table below captures these headers.

| Name | Description |  Type | Pattern	| Longitude | Location | Required by API Caller | Required in OAS Definition |	Example | 
|---|---|---|---|---|---|---|---|---|
| `X-Version` |	Service version description to help observability process |	String| N/A	| | Request | No | No | |	
| `X-Correlator`|	Service correlator to make E2E observability |		String |	UUID (8-4-4-4-12)	| Max 36	| Request/Response | No | No |	b4333c46-49c0-4f62-80d7-f0ef930f1c46 |

## 10. Security

One of the key points in the API definition process is to specify and validate the security needs that will be maintained to guarantee data integrity and access control. There are multiple ways to secure a RESTful API, e.g. basic authentication, OAuth, etc., but one thing is for sure: RESTful APIs should be stateless, so authentication/authorization requests should not rely on cookies or sessions. Instead, each API request must come with some form of authentication credentials that must be validated on the server for each request.

Basic idea in terms of security is to understand that various types of data will require different levels of security, depending on the confidentiality of the data you are trying to obtain and the level of trust between Telefónica and the consumer.


### 10.1 API REST Security

<font size="3"><span style="color: blue"> REST security design principles </span></font>
The document "The Protection of Information in Computer Systems", by Jerome Saltzer and Michael Schroeder, outlines eight design principles to secure information in computer systems, which are listed and elaborated below:

1. **Least privilege**. An entity should only have the set of permissions necessary to perform the actions for which it is authorized, and no more. Permissions can be added as needed and should be revoked when no longer in use.
2. **Fail-safe defaults**. A user's default level of access to any system resource should be "denied" unless "permission" has been explicitly granted.
3. **Mechanism economics**. The design should be as simple as possible. All component interfaces and interactions between them should be simple enough to understand.
4. **Full mediation**. A system must validate access rights to all of its resources to ensure that they are allowed and must not rely on the cached permissions array. If the level of access to a certain resource is revoked, but that is not reflected in the permissions matrix, it would violate security.
5. **Open Design**. This principle underlines the importance of building a system in an open way, without secret and confidential algorithms.
6. **Separation of privileges**. Granting permissions to an entity should not be based purely on a single condition, a combination of conditions based on resource type is a better idea.
7. **Least Common Mechanism**. It refers to the risk of sharing state between different components. If one can corrupt the shared state, then it can corrupt all other components that depend on it.
8. **Psychological acceptance**. This principles states that the security mechanisms must not make the resource more difficult to access than if the security mechanisms were not present. In short, security should not worsen the user experience (restfulapi.net,2021)


<font size="3"><span style="color: blue"> Good practices to secure REST APIs </span></font>

The following points can serve as a checklist to design the security mechanism of the REST APIs.

1. **Simple Management**. 
   Securing only the APIs that need to be secure. Any time the more complex solution is made "unnecessarily", it is also likely to leave a hole. 
2. **HTTPs must be always used**. 
   By always using SSL, authentication credentials can be simplified to a randomly generated access token. The token is delivered in the username field of HTTP Basic Auth. It is relatively easy to use, and you get a lot of security features for free.
   - If HTTP 2 is used, to improve performance, you can even send multiple requests over a single connection, this way you will avoid the complete overhead of TCP and SSL on subsequent requests.

3. **Using hash password**. 
Passwords should never be sent in API bodies, but if it is necessary it must hashed to protect the system (or minimize damage) even if it is compromised in some hacking attempts. There are many hashing algorithms that can be really effective for password security, for example PBKDF2, bcrypt and scrypt algorithms.

4. **Information must not be exposed in the URLs**
Usernames, passwords, session tokens, and API keys should not appear in the URL, as this can be captured in web server logs, making them easily exploitable. For example, this URL (```https://api.domain.com/user-management/users/{id}/someAction?apiKey=abcd123456789```) exposes the API key. Therefore, never use this kind of security.

5. **Authentication and authorization must be considered**
   - The OAuth 2.0 authorization framework allows a third-party application to gain limited access to an HTTP service, either on behalf of a resource owner, by orchestrating an approval interaction between the resource owner and the HTTP service, or by allowing the third-party app get access on your behalf. 
   - OpenID Connect is built on the OAuth 2.0 protocol and uses an additional JSON Web Token (JWT), called an ID token, to standardize areas that OAuth 2.0 leaves up to choice, such as scopes and endpoint discovery. It is specifically focused on user authentication and is widely used to enable user logins on consumer websites and mobile apps.<br>
   - All the information about the authN-authZ concepts for CAMARA APIs are documented in https://github.com/camaraproject/WorkingGroups/blob/main/Commonalities/documentation/CAMARA-AuthN-AuthZ-Concept.md
  
6. **Add request time flags should be considered**. 
Along with other request parameters, a request timestamp can be added as a custom HTTP header in API requests. The server will compare the current timestamp with the timestamp of the request and will only accept the request if it is within a reasonable time frame (1-2 minutes maybe).
   - This will prevent very basic replay attacks from people trying to hack your system without changing this timestamp.

7. **Entry params validation**
Validate the parameters of the request in the first step, before it reaches the application logic. Put strong validation checks and reject the request immediately if validation fails. In the API response, send relevant error messages and an example of the correct input format to improve the user experience.

### 10.2 Security Implementation
The security implemented in an API can be divided into three different layers: i) channel security; ii) access security; and iii) data security.


<font size="3"><span style="color: blue"> Channel security </span></font>

The API must ensure that the channel where the consumer and the API will exchange information is secure.

<u>a) TLS and mutual authentication</u><br>
As for today, it is commonly agreed that all communications over the Internet must be done via secure HTTP (HTTPS) using Transport Layer Security (TLS) to generate a secure and recorded communication channel. In some cases, the TLS channel must be more strictly added a mutual authentication process to identify both actors.

Protect communications with TLS is mandatory for all APIs. Any API that accepts requests without TLS will not be published to the API Manager. The TLS version to use for APIs is TLS 1.2 (for compatibility) and TLS 1.3 (for security and because it is the latest version available). The API Manager should not accept requests made with some of the older versions of TLS. 

In case the request does not use the proper TLS, the API should send an HTTP 403 (Forbidden) code with the corresponding response body.

<u>b) Certificate Chain Validation</u><br>
When establishing a TLS with mutual authentication, the API must validate that the consumer's certificate is validated by one of the allowed CAs.

In case the request does not use the proper TLS, the API should send an HTTP 401 (Unauthorized) code with the corresponding response body.

<u>c) Recommended Ciphers</u><br>
These include:
- `TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384`
- `TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256`
- `TLS_DHE_RSA_WITH_AES_256_GCM_SHA384`
- `TLS_DHE_RSA_WITH_AES_128_GCM_SHA256`
- `TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384`
- `TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256`



<font size="3"><span style="color: blue"> Access security </span></font>

The API must ensure that the consumer is known and can access the requested resources.

<u>a) OAuth</u><br>

All APIs must be protected by the OAuth 2.0 Framework. All API requests must include an HTTP header called "Authorization" with a valid OAuth access token.

The following controls will be performed on the access token:
- **Check if the access token is still valid**. If it is expired or revoked, the API will return an HTTP 401 (Unauthorized) code.
- **Check if the access token was created to be used by the requestor**. Otherwise, the API will return an HTTP 401 (Unauthorized) code.
- **Check the scope of the access token**, if it is expired or revoked, the API will return an HTTP 403 (Forbidden) code.


<u>b) Scopes</u><br>

The scopes allow defining the permission scopes that a system or a user has on a resource, ensuring that they can only access the parts they need and not have access to more. These restrictions are done by limiting the permissions that are granted to OAuth tokens.

Scopes should be represented as:
- API Name: address-management, numbering-information...
- Protected Resource: orders, billings…
- Grant-level: read, write…
  
To correctly define the scopes, when creating them, the following recommendations should be taken:
- **Appropriate granularity**. Scopes should be granular enough to match the types of resources and permissions you want to grant.
- **Use a common nomenclature for all resources**.  Scopes must be descriptive names and that there is no conflict between the different resources.
- **Use the kebab-case nomenclature** to define API names, resources, and scope permissions.
- **Recommended Format**: `<API_name>-<Resource>-<Permission>`

Next, we illustrate an example on how to define series of scopes for a OpenAPI file.

The first step is to create the security definitions according to the nomenclature that we have defined.
<p align="center">
<img src="./images/guidelines-fig-11.png" width="400"/>
</p>

Then, each operation is assigned the necessary scope:
<p align="center">
<img src="./images/guidelines-fig-12.png" width="400"/>
</p>
<p align="center">
<img src="./images/guidelines-fig-13.png" width="400"/>
</p>


<font size="3"><span style="color: blue"> Data security </span></font>

The API must ensure that the information sent is as expected and has not been altered by possible attackers.

<u>a) Headers Validation</u><br>

An attacker can collect information from an API by sending malicious data via headers, so the API must verify that:

1.	API must receive supported headers only. 

```
HEADER.HACK: SELECT* FROM USERS;
Authorization: Bearer 7894df-ds8f7-sdf84-sdf878u
````

2. Supported headers must have values and longitudes agreed.

```
Authorization: INSERT INTO …

To avoid this, validate that the "Authorization" header is JWT type and consists of three concatenated Base64url-encoded strings, separated by dots (.)
```

If a header contains a malicious value or an unaccepted header is received, the API should send an HTTP 400 response.

<u>b) Response body validation</u><br>

A more common way to attack an API is to send incorrect values or malicious codes within the data sent in the request to obtain relevant information from internal services. Mainly, the APIs do not know if the transmitted data is valid or not, so in the end the malicious data can navigate to the backend and cause serious problems.

To avoid these undesirable situations, the APIs can carry out a previous control of the payload structure. These validations are performed using JSON definitions with a description of the JSON structure, fields, and value formats in this payload.

In case the payload does not follow these definitions, the API must send an HTTP 400 response.

<u>c) Do not repudiate</u><br>

Sometimes the attacker just wants to modify the payload values to change the behavior of the Customer Service Provider ecosystem to their advantage. For example, if you are running a payment, you can modify the payment payload to change the account id to your own account. This will not change either the structure or the value format of the payload.

In these situations, it is mandatory to require the consumer to send the payload in JWT format, signed with one of the allowed consumer signing certificates.

The API must validate the signature of the JWT in the payload following next requirements:
- The API must validate that the certificate used by the consumer is accepted by one of the allowed CAs (see Certificate Chain Validation section for a list of accepted CAs).
- Validate that the payload has not been modified during its transmission. Below options should be checked:
  - Encryption/decryption of the JWT signature using the appropriate consumer public key. The JWT is encoded in Base64.
  - Making sure that that the decrypted and decrypted signature has the following String value ("`JWT_Header.JWT_Payload`")
  - Making sure that the JWT payload has the same structure and values as the decrypted part of "`JWT_Signature`".



## 11. Definition in OpenAPI

API documentation helps customers integrate with the API by explaining what it is and how to use it. All APIs must include documentation for the developer who will consume your API.

API documentation usually consists of:
- Conceptual information to introduce clients to the API and the domain.
- Practical information to help customers get involved with the API.
- Reference information to inform customers of every detail of your API.

Below considerations should be checked when an API is documented:
- The API functionalities must be implemented following the specifications of the [Open API version 3.0.3](https://spec.openapis.org/oas/v3.0.3) using the .yaml or .json file extension.
- The API specification structure should have the following parts:
   -	General information ([Section 11.1](#111-general-information))
   -  Published Routes ([Section 11.2](#112-published-routes))
   -  Request Parameters ([Section 11.3](#113-request-parameters))
   -  Response Structure ([Section 11.4](#114-response-structure))
   -  Data Definitions ([Section 11.5](#115-data-definitions))
   -  OAuth Definition ([Section 11.6](#116-oauth-definition))

### 11.1 General Information

This part must include the following information:
- API Version in the next format: X.Y.Z.
- API title with public name.
- A brief description of the main functions of the API.
- API Terms of Service.
- Contact information, with name, email and website of the API Holder.
- License information (name, website…)
- Schemes supported (HTTP, HTTPS…)
- Allowed response formats (“application/json”, “text/xml”…)
- Response format (“application/jwt”…)

<p align="center">
<img src="./images/guidelines-fig-14.png" width="400"/>
</p>

### 11.2 Published Routes

This part must contain the list of published functions, with the following description:
- URI functionality.
- HTTP Methods. For each one, the following shall be included:
   - Functionality summary.
   - Functionality method description.
   - Tag list to classify methods.
   - Request param list, making reference to "Request params " part.
   - Supported responses list, describing success and erros cases.

<p align="center">
<img src="./images/guidelines-fig-15.png" width="400"/>
</p>

### 11.3 Request Parameters

This part contains a list of expected payload requests, if any. This description should have the following items:
- Parameter name, used to reference it in other sections
- Parameter description
- Parameter place (header, route…)
- Type (basic types like chains, integers, complex objects,...)
- Required field or optional flag

<p align="center">
<img src="./images/guidelines-fig-16.png" width="400"/>
</p>

### 11.4 Response Structure

This part describes the list of possible messages returned by the API. It also includes the description of the error response objects:
- Name of the response object, used to refer to it in other sections.
- Response object description.
- Object type (basic types like string, integer... or even more complex objects defined in the "Data definition" part...)
- Metadata links (HATEOAS)

<p align="center">
<img src="./images/guidelines-fig-17.png" width="400"/>
</p>


### 11.5 Data Definitions

This part captures a detailed description of all the data structures used in the API specification. For each of these data, the specification must contain:
- Name of the data object, used to reference it in other sections.
- Data type (String, Integer, Object…).
- If the data type is an object, list of required properties.
- List of properties within the object data, including:
   - Property name
   - Property desctiption
   - Property type (String, Integer, Object …)
   - Other properties by type:
      - String ones: min and max longitude
      - Integer ones: Format (int32, int64…), min value.


In this part, the error response structure must also be defined, which must be as follows:
- Type (Array, Integer, Object …)
- Mandatory fields of the structure
- Properties:
   - Error Code
      - Type (Array, Integer…)
      - Error codes supported, as Enum list
   - Error description
       - Type (Array)
       - Min longitude
       - Max longitude

<p align="center">
<img src="./images/guidelines-fig-18.png" width="400"/>
</p>

#### 11.5.1 Usage of discriminator

As mentioned in Openapi doc [here](https://spec.openapis.org/oas/v3.0.3#discriminator-object) usage of discriminator may
simplify serialization/deserialization process and so reduce resource consumption.

To achieve this in the Camara context, we decided that :

    - objects containing oneOf or anyOf section MUST include a discriminator defined by a propertyName
    - objects involved in oneOf / anyOf section MUST include the property designed by propetyName

The following sample illustrates this usage.

``` yaml 
    IpAddr:
      oneOf:
        - $ref: '#/components/schemas/Ipv6Addr'
        - $ref: '#/components/schemas/Ipv4Addr'
      discriminator:
        propertyName: objectType <-- objectType property MUST be present in the objects referenced in oneOf

    Ipv4Addr: <-- object involved in oneOf MUST include the objectype property
      type: object
      required:
        - objectType
        - address
      properties:
        objectType:
          type: string
        address:
          type: string
          format: ipv6
        ...

    Ipv6Addr: <-- object involved in oneOf MUST include the objectype property
      type: object
      required:
        - objectType
        - address
      properties:
        objectType:
          type: string
        address:
          type: string
          format: ipv4
        ...

```

When IpAddr is used in a payload the property objectType MUST be present to indicate which schema to use

``` json
{ 
    "ipAddr": {
        "objectType": "Ipv4Addr",   <-- objectType indicates to use Ipv4Addr to deserialize this IpAddr
        "address": "192.168.1.1",
        ...
    }    
}
```

### 11.6 OAuth Definition

Finally, this part describes the OAuth security applied to the API. This spec is for client testing purposes only, but
there should be as similar as possible to the OAuth flows in your production environment. This definition has the
following aspects:

- Security Type: oauth2, oauth…
- Security Flow (Depends of security type): implicit, password…
- Security Flow description applied (String)
- Endpoint token URL
- URL to endpoint authorization ( If flow is based on "`authorizationCode`").	

## 12. Subscription, Notification & Event

In order to provide event-based interaction, CAMARA API could provided capabilities for subscription & notification management.
A subscription allows an API consumer to request event notification reception at a given URL (callback address) for a specific context.
A notification is the publication at the listener address about an occurred event.
Managed event types are explicitly defined in CAMARA API OAS.

### 12.1 Subscription

We distinguish 2 types of subscriptions:
- Instance-based subscription (indirect creation)
- Resource-based subscription (direct creation)

**Instance-based subscription**

An instance-based subscription is a subscription indirectly created, additionally to another resource creation. For example for a Payment request (in Carrier Billing API), in the `POST/payments`, the API consumer could request to get event notification about **this** Payment request processing update. The subscription is not an autonomous entity and its lifecycle is linked to the managed entity (the Payment resource in this case). The subscription terminates with the managed entity.

Providing this capability is optional for any CAMARA API depending on UC requirements.

If this capability is present in CAMARA API, following attributes **must** be used in the POST request, within a `webhook` object, for the managed entity:

| attribute name | type | attribute description | cardinality |
| ----- |	-----  |	 -----  | -----  | 
| notificationUrl | string | https callback address where the notification must be POST-ed | mandatory |
| notificationAuthToken | string | OAuth2 token to be used by the callback API endpoint. It MUST be indicated within HTTP Authorization header e.g. Authorization: Bearer $notificationAuthToken | optional |

_example:_

```json
{
<Resource instance representation>
"webhook": {
   "notificationUrl": "https://callback..."
   "notificationAuthToken" : "sdfr5sff...lmp"
   }
}
```

Recommended format conventions regarding ```notificationAuthToken``` attribute, in order to provide Uniqueness, Randomness and Simplicity for its management are the following:
- It SHOULD BE an opaque attribute, meaning that should not be based in security info shared between API Consumer and API Provider 
- It has to be restricted in length, a string between [20-256] characters.
- It is HIGHLY recommended to have random-based pattern (e.g. UUIDv4 or another one. Anycase it is an implementation topic not design one) 

**Resource-based subscription**

A resource-based subscription is a event subscription managed as a resource. An API endpoint is provided to request subscription creation.  As this event subscription is managed as an API resource, it is identified and operations to search, retrieve and delete it must be provided.

Note: It is perfectly valid for a CAMARA API to have several event types managed. The subscription endpoint will be unique but 'eventType' attribute is used to distinguish distinct events subscribed.

In order to ease developer adoption, the pattern for Resource-based event subscription should be consistent for all API providing this feature.

4 operations must be defined:

| operation | path | description |
| ----- |	-----  |	 -----  | 
| POST | `/event-subscriptions` |  Operation to request a event subscription.     |
| GET | `/event-subscriptions` |  Operation to retrieve a list of event subscriptions - could be an empty list.  eg. `GET /event-subscriptions?type=ROAMING_STATUS&ExpireTime.lt=2023-03-17` |
| GET | `/event-subscriptions/{eventSubscriptionsId}` | Operation to retrieve a event subscription |
| DELETE | `/event-subscriptions/{eventSubscriptionsId}` | Operation to delete a event subscription |


Note on the operation path:
The recommended pattern is to use `/event-subscriptions` path for the subscription operation. But API design team, for specific case, has the option to append `/event-subscriptions` path with a prefix (e.g. `/roaming/event-subscriptions` and `/connectivity/event-subscriptions`). The rationale for using this alternate pattern should be explicitly provided (e.g. the notification source for each of the supported events may be completely different, in which case separating the implementations is beneficial). 

Following table provides `/event-subscriptions` attributes

| name | type | attribute description | cardinality |
| ----- |	-----  |	 -----  |  -----  | 
| webhook | object | detail for event channel - in current version only webhook description are provided but other event channel descriptor could be added in future | mandatory |
| eventSubscriptionId | string | Identifier of the event subscription - This attribute must not be present in the POST request as it is provided by API server | mandatory in server response |
| subscriptionExpireTime | string - datetime| Date when the event subscription should end. Provided by API requester. Server may reject the suscription if the period requested do not comply with Telco Operator policies (i.e. to avoid unlimited time subscriptions). In this case server returns exception 403 "SUBSCRIPTION_PERIOD_NOT_ALLOWED" | optional |
| startsAt | string - datetime| Date when the event subscription will begin/began. This attribute must not be present in the `POST` request as it is provided by API server. It must be present in `GET` endpoints | optional |
| expiresAt | string - datetime| Date when the event subscription will expire. This attribute must not be present in the `POST` request as it is provided by API server.  | optional |
| subscriptionDetail | object | Object defined for each event subscription depending on the event - it could be for example the ueID targeted by the subscription | optional |


The `webhook` object definition: 

| name | type | attribute description | cardinality |
| ----- |	-----  |	 -----  |  -----  | 
| notificationUrl | string | https callback address where the event notification must be POST-ed | mandatory |
| notificationAuthToken | string | OAuth2 token to be used by the callback API endpoint. It MUST be indicated within HTTP Authorization header e.g. Authorization: Bearer $notificationAuthToken  | optional |

The `subscriptionDetail` must have at least an eventType attribute:

| name | type | attribute description | cardinality |
| ----- |	-----  |	 -----  |  -----  | 
| eventType | string | Type of event subscribed. This attribute must be present in the `POST` request. It is open to API working group to allow providing a list of event type based on specific UC. `eventType` must follow UPPER_SNAKE_CASE format. | mandatory  |


_Error definition for subscription_

Error definition described in this guideline applies for subscriptions.

Following Error code must be present:
* for `POST`: 400, 401, 403, 409, 500, 503
* for `GET`: 400, 401, 403, 500, 503
* for `GET/{subscriptionId}`: 400, 401, 403, 404, 500, 503
* for `DELETE`: 400, 401, 403, 404, 500, 503

_Termination for resource-based subscription_

3 scenarios subscription termination are possible (business conditions may apply):

* case1: subscriptionExpireTime has been provided in the request and reached. The operator in this case has to terminate the subscription.
* case2: subscriber requests the `DELETE` operation for the subscription (if the subscription did not have a subscriptionExpireTime or before subscriptionExpireTime expires). 
* case3: subscription ends on operator request. 

It could be useful to provide a mechanism to inform subscriber for case3 (and probably case1). In this case a specific event type could be used.

_Termination rules regarding subscriptionExpireTime usage_
* When client side providing a `subscriptionExpireTime`, service side has to terminate the subscription without expecting a `DELETE` operation.
* When the `subscriptionExpireTime` is not provided, client side has to trigger a `DELETE` operation to terminate it.


_Subscription example_
In this example, we illustrate a request for a device roaming status event subscription. Requester did not provide anticipated expiration time for the subscription. In the response, server accepts this request and sets an event subscription end one year later. This is an illustration and each implementation is free to provide - or not - a subscription planned expiration date.

Request:

```
curl -X 'POST' \
  'http://localhost:9091//device-status/v0/event-subscriptions' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d
 ```
 ```json 
{
  "webhook": {
    "notificationUrl": "https://application-server.com",
    "notificationAuthToken": "c8974e592c2fa383d4a3960714"
    }
  "subscriptionDetail": {
    "ueId": {,
      "ipv4Addr": "192.168.0.1"
    },
    "uePort": 5060,
    "eventType": "ROAMING_STATUS"
  }
}
```

response:

```
201 Created
```
```json 
{
  "webhook": {
    "notificationUrl": "https://application-server.com",
    "notificationAuthToken": "c8974e592c2fa383d4a3960714"
    }
  "subscriptionDetail": {
    "ueId": {
      "ipv4Addr": "192.168.0.1"
    },
    "uePort": 5060,
    "eventType": "ROAMING_STATUS"
  },
  "eventSubscriptionId": "456g899g",
  "startsAt": "2023-03-17T16:02:41.314Z",
  "expiresAt" : "2024-03-17T00:00:00.000Z"
}
```

Note: If the API provides both patterns (indirect and resource-based), and the API customer requests both (instance based + subscription), the 2 requests should be handled independently & autonomously. Depending on server implementation, it is acceptable, when the event occurrs, that one or two notifications are sent to listener.


### 12.2 Event notification

The event notification endpoint is used by the API server to notify the API consumer that an event occured.

Note: The notification is the message posted on listener side. We describe the notification message in the CAMARA OAS but it could confusing because this endpoint should be implemented on the business API consumer side. This notice should be explicited mentioned in all CAMARA API documentation featuring notifications.

Only Operation POST is provided for `eventNotifications` and the expected response code is `204`.

For consistence among CAMARA APIs the uniform `eventNotifications` model must be used:

| name | type | attribute description | cardinality |
| ----- |	-----  |	 -----  |  -----  | 
| eventSubscriptionId | string | subscription identifier - could be valued for Resource-based subscription | optional |
| event | object | event structure - see next table | mandatory |

Following table defines event attribute object structure: 

| name | type | attribute description | cardinality |
| ----- |	-----  |	 -----  |  -----  | 
| eventId | string - uuid | Identifier of the event from the server where the event was reported | optional |
| eventType | string | Type of event as defined in each CAMARA API. The event type are written in UPPER_SNAKE_CASE| mandatory |
| eventTime | string - datetime | Date time when the event occurred | mandatory |
| eventDetail | object | Event details structure depending on the eventType | mandatory |

Note: For operational and troubleshooting purposes it is relevant to accommodate use of `X-Correlator` header attribute. API listener implementations have to be ready to support and receive this data.

Specific eventType "SUBSCRIPTION_ENDS" is defined to inform listener about subscrition termination. It is used when the subscription expire time (required by the requester) has been reached or if the API server has to stop sending notification prematurely. For this specific event, the `eventDetail` must feature `terminationReason` attribute.

_Error definition for event notification_

Error definition are described in this guideline applies for event notification.

Following Error code must be present:
* for `POST`: 400, 401, 403, 500, 503

_Managing correlation between resource-based event souscription and event notification_
To manage correlation between the subscription management and the event notification (as these are 2 distinct operations):
- use `eventSubscriptionId` attribute (in body) - this identifier is provided in event subscription and could be valued in each event notification. 

note: There is no normative enforcement to use any of these patterns and they could be used on agreement between API consumer & provider.

_Examples_

Example for Roaming status - Request:

```
curl -X 'POST' \
  'https://application-server.com/v0/notifications' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer c8974e592c2fa383d4a3960714' \
  -H 'Content-Type: application/json' \
  -d
 ```
 ```json 
{
  "eventSubscriptionId": "456g899g",
  "event": {
    "eventType": "ROAMING_STATUS",
    "eventTime": "2023-01-19T13:18:23.682Z",
    "eventDetail": {
      "ueId": {
        "ipv4Addr": "192.168.0.1"
      },
      "uePort": 5060,
      "roaming": true,
      "countryCode": 208,
      "countryName": "FR"
    }
  }
}
```

response:

```
204 No Content
```


Example for subscription termination - Request:

```
curl -X 'POST' \
  'https://application-server.com/v0/notifications' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer c8974e592c2fa383d4a3960714' \
  -H 'Content-Type: application/json' \
  -d
 ```
 ```json 
{
  "eventSubscriptionId": "456g899g",
  "event": {
    "eventType": "SUBSCRIPTION_ENDS",
    "eventTime": "2023-01-24T13:18:23.682Z",
    "eventDetail": {
      "ueId": {
        "ipv4Addr": "192.168.0.1"
      },
      "uePort": 5060,
      "terminationReason": "Service terminates for lack of consent"
    }
  }
}
```

response:

```
204 No Content
```
