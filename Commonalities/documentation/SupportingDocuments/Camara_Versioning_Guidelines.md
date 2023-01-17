# Camara versioning guidelines

* Every release includes a **CHANGELOG.md** file. Please make sure that the content is structured in a format that is easy to read.
* Release should follow the convention **\<subprj-name> \<tag-name>** for e.g. qod v0.8.0
* Changelog content:
    * APIs/Software in alpha release needs to be clearly specified
    * API changes
    * New features
    * Fixes
    * Deprecation (if any)
* Release branches should have naming convention **release-x.y.z**
* Tags should follow the naming conventions <strong>vx.y.z</strong> for versions
* Adding relevant annotations to tags will be useful for later reference.
* Bugfix branches can follow, naming as **patch-x.y.z**
* Provider implementation repos can have their own naming conventions with regard to branches, tags etc. It is however mandatory to provide as a part of the  CHANGELOG.md - the API release version, capabilities and changes that are a part of the respective provider implementation release.
* Main branch is assumed to be the latest.
* Camara subproject will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release of any given subproject within Camara.

<img src="../images/versioning-pic.png" alt="Ver"
	title="Versioning Sample"/>
