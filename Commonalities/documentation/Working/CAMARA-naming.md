# X. API resources definition

## X.1. URL Definition

A full resource URL, e.g. https://mycompany.com/user/v1/user/1244?properties=address, consists of:

1. Protocol: Protocol on which it works. We will always use HTTPS.
2. Domain: Our machine name or domain. It will be defined at the server level.
3. Context: The name of the API. Our system may have several differentiated APIs
according to its objectives and the relationship of its resources.
4. Version: MAJOR version. Part of semantic versioning.
5. Resource: Specific resource that we are accessing. It can be made up of several levels.
6. Path param: Part of the resource identifier that precedes it. Indicates that it is the user unequivocally identified by "1244".
7. Query Param: Resource filter parameters. They are preceded by question mark (_?_) and can be concatenated by the ampersand symbol (_\&_).

### X.1.1. Good practices

URIs should be designed according to the following considerations:
* URI with lowercase and hyphens. URIs must be "human readable" to facilitate identification of the offered resources. Lowercase words and hyphenation (_kebab-case_) help achieve this best practice. For example: /customer-segments
* URIs must contain the exposed resource.
* Verbs use is not allowed.
* URIs must contain the "major version" of the API.
* The resource chain will be defined in the API URI following a hierarchical relationship.
 &nbsp; o \<Resource1>/{\<id>}/\<Resource2>/{\<id>}
 &nbsp; o A collection must always be followed by a member of the collection.
 &nbsp; o The API response should return, if possible, the hypermedia resource which it refers to. Although it is recommended that the REST API be more pragmatic to return in a single call what is necessary to avoid concatenated calls from clients.
 &nbsp; o Short URIs use is recommended for relevant entities. Failure to define a clear hierarchical model will lead to inconsistencies in publishing interfaces through the API and will make it difficult to consume.
• Avoid using the package type nomenclature, e.g.: _com.mycompany.api(...)_, in the API URI because it makes it difficult for the developer or consumer to use the API.
* URIs are defined per entity based on CRUD operations. Generally, we should only have one operation verb per functional entity (GET, PUT, POST, PATCH, DELETE).
* The URI at the business entity level will always be a plural noun.

## X.1.2. Hierarchy
Hierarchy could be introduced with the concepts of entity and sub-entity:
* **Entity**: It is understood as a enough relevant business object to be identified as a product. A single entity is defined by an API.
* **Sub-entity**: It is understood as a business object that by itself has no business relevance. It is an object that is hierarchically related to an entity.
To make the hierarchy, the following aspects must be applied:
* Two levels of hierarchy should not exceed and should not be more than 8 resources (6-8).
* A resource has multiple operations identified by HTTP Verbs.
* Resources defined through URIs establish a hierarchical relationship with each other:

  &nbsp; &nbsp; /\<entity>
  &nbsp; &nbsp; /\<entity>/{<entity\_id>}
  &nbsp; &nbsp; /\<entity>/{<entity\_id>}/<sub\_entity>
  &nbsp; &nbsp; /\<entity>/{<entity\_id>}/<sub\_entity>/{<sub\_entity\_id>}

<br>
## X.2. Input/Output resources definition

At this point, some considerations are outlined about the business input and output data of the API resources. This data can be informed by different means: QueryString, Header, Body...

These considerations are below:
* API input and output business data will follow the lowerCamelCase notation.
* The field names in JSON and XML will follow the same URIs standard.
  o Business data must be human readable.
  o Commercial data name must be a noun, that means, it corresponds to an entity information.
* Business data sent as part of the HTTP protocol will be exempt from these rules. In these cases, compliance with the standard protocol will apply.
* Sensitive data (considered this way for security) must go in the body if it is a POST request and in the header if it is a GET, encrypted by default by the HTTP protocol.
* Description of the input and output data must have:
  o Functional description
  o DataType
  o Value range supported