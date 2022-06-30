<br>

### *! internal Commonalities draft - only for Workgroup discussion/review !*

## Introduction

This document aims to indicate the testing principles for Service APIs developed within Camara, the Telco Global API Alliance.
API tests are fast and simplify the validation of business logic, security and compliance of the application. In cases where the API is a public one, as in Camara, API tests effectively become end-to-end tests and should cover a complete user story.

Content proposal:

* Approach of API Testing
    * Functional testing
    * Test API coverage/ Test scenarios
    * Documenting results of API test design
* Best Practices of API Testing
* Reference testing steps for Camara
* API testing tools

## Approach of API Testing

The purpose of API Testing is to check the functionality, reliability, performance, and security of the programming interfaces.
API testing usually covers three major areas:
* Functional testing
* Load and performance testing
* Security testing

Both performance and security testing are strictly related to specific implementations that are not in the scope of Camara. Thus, in this document we focus mostly on functional testing.

### Functional testing

In this document we concentrate on compliance with the standards proposed by CAMARA Alliance and, therefore, our focus area is functional testing — ensuring that the API functions correctly.
The main objectives in functional testing of the API are:

* to ensure that the implementation is working correctly as expected according to general REST API criterias 
* to ensure that the implementation is working as specified according to the requirements specification (and possibly the API documentation as well).
* to prevent regressions between code merges and releases.

The Types of Bugs that API functional testing should detect are:
* Fails to handle error conditions gracefully
* Missing or duplicate functionality
* Input/output errors:
    * Improper errors/warning to a caller
    * Incorrect handling of valid argument values
    * Response Data is not structured correctly (JSON or XML)
    * Unused flags


### Test scenario categories

Test cases fall into the following general test scenario groups [13]:
* Basic positive tests (_happy paths_, execute API call with valid required parameters)
* Extended positive testing with optional parameters
* Negative testing with invalid input
* Destructive testing
* Security, authorization, and permission tests (which are out of scope of Camara)

Additionally, if applicable, API workflows and concurrent multiple API testing should be performed for the same UE (to verify if there is an interference).


### Documenting results of API test design

A sample list of fields which should be documented in test design: 

* API Function, version;
* Verification being performed (test case description);
* Expected result;
* Planned time interval;
* Status/outcome of a test;
* Date of a test;
* Test environment: testing tool (if multiple), etc.

## Best Practices of API Testing

1. Use a comprehensive API testing tool (possible tools are listed in the next chapter).
2. Start with basic API functionality tests.
3. Ensure that all tested API responses are tracked and saved (see Documenting results of API test design) 
4. Make sure to perform _negative_ testing.
5. Mock missing APIs and components (if needed).
6. Remove testing dependencies when possible.

Although out of scope in Camara, it is important to keep in mind also the below practices:
* simulate production conditions for the API during testing;
* don’t neglect security tests;
* verify API performance, e.g. for SLA applicability.


## Reference testing steps for Camara

The reference testing steps for APIs should include:
    * path testing 
    * response testing
    * functionality testing (*)
    * security testing (*)
    * performance testing (*)

(*) _Functionality, security and performance testing can be done only after respective implementation of a specific network capability and IdM solution. Therefore they are not in direct scope of Camara, but remain crucial issues for testing._

Each test is comprised of test actions. These are the individual actions a test needs to take per API test flow. For each API request, the test would need to take the following actions: 

1. Verify correct response HTTP status code. For example, creating a resource should return 201 CREATED and unpermitted requests should return 403 FORBIDDEN, etc.
2. Verify response payload. Check valid JSON body and correct field names, types, and values — including in error responses.
3. Verify response headers. HTTP server headers have implications on both security and performance.
4. Verify correct application state. This is optional and applies mainly to manual testing, or when a UI or another interface can be easily inspected.
5. Verify basic performance sanity. If an operation was completed successfully but took an unreasonable amount of time, the test fails. API design quality check

Response testing should include both positive and negative testing: every response message and return code should be validated for appropriateness and consistency.


## API Testing tools

API testing requires an application to interact with sample API for testing. To test an API, two things are required:
* Use a testing tool to drive the API
* Write custom code to test the API

In order to avoid or minimize custom code creation, existing testing tools can be applied.
There are several popular solutions, the ones listed below are the most prominent open source projects:

* Swagger OpenAPI Testing Tool [https://swagger.io/](https://swagger.io/) [https://inspector.swagger.io/](https://inspector.swagger.io/)
* SoapUI [https://www.soapui.org/downloads/soapui/](https://www.soapui.org/downloads/soapui/)
* Insomnia [insomnia.rest](https://insomnia.rest)
* Hoppscotch [https://github.com/hoppscotch/hoppscotch](https://github.com/hoppscotch/hoppscotch)
* Dredd [https://github.com/apiaryio/dredd](https://github.com/apiaryio/dredd)
* Rest Assured Java library [https://github.com/rest-assured/rest-assured](https://github.com/rest-assured/rest-assured) [https://rest-assured.io](https://rest-assured.io)
* Apache Jmeter [https://jmeter.apache.org/](https://jmeter.apache.org/)
* While [Postman](https://www.getpostman.com/) is not fully open source, it [is based on open source projects](https://www.postman.com/company/open-philosophy/) available at [https://github.com/postmanlabs](https://github.com/postmanlabs)

### Automation of testing

CI/CD pipelines can be used to implement automated testing both on code level and API specification verification.
For example, since Camara currently uses a git-based platform, built-in options (e.g. GitHub Actions or Gitlab CI/CD) can be leveraged for API spec linting.
Several tools can be included in the CI/CD pipelines to verify API definitions correctness:
* [yamllint](https://github.com/adrienverge/yamllint) - a basic linux CLI tool that verifies YAML correctness, but won't check for API specific requirements
* [Spectral](https://stoplight.io/open-source/spectral) API linter [https://github.com/stoplightio/spectral](https://github.com/stoplightio/spectral) - a more advanced linter, but still can miss more subtle API errors, e.g. a missing definition reference
* [oas-kit](https://mermade.github.io/oas-kit/) - a collection of packages which comprise an OpenAPI 2.0 to 3.0.x converter, a resolver, a validator, a schema-walker and a linter. 
* [Swagger CLI tools](https://github.com/APIDevTools/swagger-cli) may be a more complicated, but comprehensive way of testing API, e.g. by configuring a [Swagger linter](https://github.com/tmobile/swagger-lint) from [swagger-tools](https://github.com/apigee-127/swagger-tools)
* [GitHub Code scanning](https://docs.github.com/en/code-security/code-scanning) identify potential security vulnerabilities and coding errors. This may not directly find errors in API specifications, but is a must for automated security or DevSecOps in GitHub.


_*Disclaimer:*_ Camara is a Linux Foundation project and is not affiliated with any particular tool or platform.


**References:**

1. [https://www.soapui.org/docs/rest-testing/](https://www.soapui.org/docs/rest-testing/)
2. [https://codeburst.io/dredd-swagger-for-rest-api-testing-715d1af5e8c5](https://codeburst.io/dredd-swagger-for-rest-api-testing-715d1af5e8c5)
3. [https://smartbear.com/solutions/api-testing/](https://smartbear.com/solutions/api-testing/)
4. [https://smartbear.com/learn/api-testing/rest-testing-for-beginners/](https://smartbear.com/learn/api-testing/rest-testing-for-beginners/)
5. [https://www.baeldung.com/rest-assured-tutorial](https://www.baeldung.com/rest-assured-tutorial)
6. [https://www.toolsqa.com/rest-assured-tutorial/](https://www.toolsqa.com/rest-assured-tutorial/)
7. [https://www.softwaretestinghelp.com/api-testing-using-postman/](https://www.softwaretestinghelp.com/api-testing-using-postman/)
8. [https://projects.tmforum.org/wiki/display/API/Open+API+Conformance](https://projects.tmforum.org/wiki/display/API/Open+API+Conformance)
9. [https://www.guru99.com/testing-rest-api-manually.html](https://www.guru99.com/testing-rest-api-manually.html)
10. [https://www.w3schools.in/software-testing/api-testing/](https://www.w3schools.in/software-testing/api-testing/)
11. [https://swagger.io/blog/api-design/api-design-best-practices/](https://swagger.io/blog/api-design/api-design-best-practices/)
12. [https://github.com/APIDevTools/swagger-cli](https://github.com/APIDevTools/swagger-cli) 
13. [https://www.sisense.com/blog/rest-api-testing-strategy-what-exactly-should-you-test/](https://www.sisense.com/blog/rest-api-testing-strategy-what-exactly-should-you-test/)
