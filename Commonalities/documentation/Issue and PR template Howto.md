# Using templates for Issues and Pull Request for CAMARA repositories 

## Introduction

Github enables using templates in order to customize and standardize the information contributors 
include when they open issues and pull requests in the repository.
The proposed set of templates is adjusted to be applicable mainly to CAMARA API specification subprojects.

GitHub will use and display default files for any repository owned by the account that does not have its own file of that type in any of the following places:
* the root of the repository
* the `.github` folder
* the `docs` folder

## Configuration

1. Copy the folder https://github.com/camaraproject/WorkingGroups/Commonalities/documentation/SupportingDocuments/Github_templates/.github
to the root of Subproject repository.

2. Edit the `config.yml` file inside `.github/ISSUE_TEMPLATE/` folder:
* to allow creating blank issues (without template) set:
```      
blank_issues_enabled: true
```
* Edit or add external links using the following structure in `contact_links:` array:

```
  - name: Subproject discussions 
    url: https://github.com/camaraproject/WorkingGroups/discussions
    about: Please ask and answer questions here.
 ```
3. Modify Issue and PR templates in Markdown files included in the  `.github` folder if needed.


## Usage

### Issue templates 


### Pull request template


## References
[Github documentation](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/about-issue-and-pull-request-templates)
