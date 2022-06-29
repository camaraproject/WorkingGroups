# X. API Versioning


## X.1. Versioning Strategy

Service versioning is a practice by which, when a change occurs in the API of a service, a new version of that service is released so that the new version and the previous one coexist for a period of time.

Consumers will be migrated to the new version of the service sequentially. When everyone is consuming the latest version of the service, the previous version may be removed.

Consumers can distinguish between one version of the service and another, the technique of adding the API version to the context of the base URL will be used, since this technique is the most used in the main reference APIs.

The structure of the URL would have the following form:

**[https://host:port/api/v1/resource](https://host:port/api/v1/resource)**

When accessing a resource by URL, only the *MAJOR version* is included since any change in a minor version should not break compatibility, therefore it cannot alter the access path. Only an incompatible change (thus, incrementing the major version) will require a modification of the address string.

API implementation versioning will follow [Semantic Versioning 2.0.0](https://semver.org/). Given a MAJOR.MINOR.PATCH version number, it increments:
 1)  The MAJOR version when you make an incompatible API change.
 2)  The MINOR version when you add new functionality that is backwards compatible.
 3)  The PATCH version when you fix backward compatible bugs.

Tags for pre-release and final software are available as extensions to the MAJOR.MINOR.PATCH format (e.g., 1.0.0-RELEASE, 1.0.1-SNAPSHOT). The Semantic Versioning standard recommends using a hyphen to attach the additional tag suffixes. 

### X.1.1 Agreement on major version

Before an API is officially approved by the respective API working group, the *major version* should be less than 1.
The approval process for a major version change should be based on fulfilling Camara Commonalities' [API readiness minimum criteria checklist](https://github.com/camaraproject/WorkingGroups/blob/main/Commonalities/documentation/Working/API-Readiness-Checklist.md) followed by the working group's majority vote.
The majority vote can be obtained either during a scheduled meeting of an API working group or within a separate GitHub issue dedicated to review a given proposal of version change.

### X.1.2 Version change history

To simplify tracking of changes between versions, a standard changelog file will be kept in the main folder of the respective API work group repository.
A changelog is a file which contains a chronologically ordered list of notable changes for each version of a project.
Considering the close relationship with semantic versioning, a changelog handling structure based on the [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format is proposed.

### X.1.3 Repository tagging and releases

To further improve tracking of versions' changes, [tagging of repositories](https://git-scm.com/book/en/v2/Git-Basics-Tagging) (a standard feature available in git, irrespective of the platforms) should be considered. A standard tag would consist of the MAJOR.MINOR.PATCH version number preceded by the letter v, e.g., v1.0.0 or v0.9.1.
Additional tagging could also be optionally applied as mentioned above (e.g., 0.9.7-ALPHA).

Releases are an extension of the tag concept featured both in [GitHub](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases) and [GitLab](https://docs.gitlab.com/ee/user/project/releases/) (the most popular git-based hosting platforms). Releases are deployable software iterations you can package and make available for a wider audience to download and use. GitHub converts all tags to releases when pushing up from the local repository and that is why they can be listed as both releases and tags.  A tag date may be different than a release date since they can be created at different times in the GUI portal.
Currently Camara's repositories are hosted on GitHub - more information about viewing existing tags and releases in GitHub is available in [GitHub's documentation](https://docs.github.com/en/repositories/releasing-projects-on-github/viewing-your-repositorys-releases-and-tags). 


<br/>

## X.2. Backward and forward compatibility

Avoid breaking backwards compatibility unless strictly necessary, that means, new versions should be compatible with previous versions.

Bearing in mind that APIs are continually evolving and certain operations will no longer be supported, the following considerations must be taken into account:
* Agree to discontinue an API with consumers.
* Establish the obsolescence of the API in a reasonable period of time (6 months).
* Monitor the use of deprecated APIs.
* Remove deprecated APIs documentation.
* Never start using already deprecated APIs.

### X.2.1. Types of modifications

Not all API changes have an impact on API consumers. These changes are often referred to as backward compatible changes. If API undergoes changes of this type, it should not be necessary to release a new version, it would suffice to replace the current one. What would be very convenient is to notify our consumers with the new changes so that they take them into account.

This is a list of changes to an API that should NOT affect consumers:
* Add new operations to the service. Translated to REST, it would be to add new actions on a resource (PUT, POST...)
* Add optional input parameters to requests on existing resources. E.g., a new filter parameter in a GET on a collection of resources.
* Modify input parameters from required to optional. E.g., when creating a resource, a property of said resource that was previously mandatory becomes optional.
* Add new properties in the representation of a resource returned by the server. E.g., now, to a Person resource that was previously made up of DNI and name, we add a new age field.


This other list shows changes that YES should affect consumers:
* Delete operations or actions on a resource. E.g., POST requests on a resource are no longer accepted.
* Add new mandatory input parameters. E.g., now, to register a resource, a new required field must be sent in the body of the request.
* Modify input parameters from optional to mandatory. E.g., now, when creating a Person resource, the age field, which was previously optional, is now mandatory.
* Modify a parameter in existing operations (resource verbs). Also applicable to parameter removal. For example, when consulting a resource, a certain field is no longer returned. Another example: a field that was previously a string is now numeric.
* Add new responses to existing operations. E.g., Now creating a resource can return a 412 response code.

### X.2.2. Compatibility Management

To ensure this compatibility, the following rules must be followed:

**As API provider**

* New fields should always be added as optional.
* Postel's Law: “Be conservative in what you do, be liberal in what you accept from
others”. When you have input fields that need to be removed, mark them as unused
so they can be ignored.
* Do not change the field’s semantics.
* Do not change the field’s order.
* Do not change the validation rules of the request fields to more restrictive ones.
* If you use collections that can be returned with no content, then answer with an
empty collection and not null.
* Layout pagination support from the start.

**As API Consumer**

* **Tolerant reader**: if it does not recognize a field when faced with a response from a
service, do not process it, but record it through the log (or resend it if applicable).
* Ignore fields with null values.
* **Variable order rule**: DO NOT rely on the order in which data appears in responses from
the JSON service, unless the service explicitly specifies it.
* Clients MUST NOT transmit personally identifiable information (PII) parameters in the URL. If necessary, use headers.
