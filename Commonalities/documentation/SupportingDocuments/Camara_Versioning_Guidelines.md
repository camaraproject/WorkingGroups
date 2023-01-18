# Camara versioning guidelines

* Release name for subprojects should be same as the tag-name for e.g. v0.8.0. The Github [release feature](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository) should be used for this purpose. If referenced outside the subproject, it can be referred to as Release **\<sub-project-name>\<tag-name>** for eg. Release QualityOnDemand v0.8.0
* Every release includes the **CHANGELOG.md** file in the root directory of the subproject. Please make sure that the content is structured in a format that is easy to read. Please refer to the template provided here for possible sections that could be added to a changelog [CHANGELOG_TEMPLATE.md](./CHANGELOG_TEMPLATE.md). Every release would add to the changelog. An example of how a changelog could look over time is shown below.
* The release can be agreed within the subproject by making a pull request for the changelog. The merge of this pull request would be marked as the release commit and the text within the changelog would be used as the release description
* Changelog content:
    * APIs/Software in alpha release needs to be clearly specified
    * API changes
    * New features
    * Fixes
    * Deprecation (if any)
* Going ahead, we could decide on a pull request process where use of right PR annotations could allow us to use tooling such as [krel](https://github.com/kubernetes/release/blob/master/docs/krel/README.md) or similar to automate atleast parts of release management. 
* Release branches should have naming convention **release-x.y.z**
* Tags should follow the naming conventions <strong>vx.y.z</strong> for versions
* Adding relevant annotations to tags will be useful for later reference.
* Bugfix branches can follow, naming as **patch-x.y.z**
* Provider implementation repos can have their own naming conventions with regard to branches, tags etc. It is however mandatory to provide as a part of the  CHANGELOG.md - the API release version, capabilities and changes that are a part of the respective provider implementation release.
* Main branch is assumed to be the latest.
* Camara subproject will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release of any given subproject within Camara.

<img src="../images/versioning-pic.png" alt="Ver"
	title="Versioning Sample"/>
<img src="../images/CL.png" alt="Changelog"
	title="Changelog Sample"/>
