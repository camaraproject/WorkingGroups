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
* Issue templates include headers, where the name and descripttion of issue category, the suggested title of the issue, 
the labels and assigness for the issue can be configured, e.g. 

```
---
name:  Bug 
about: Describe the bug in Provider Implementation
title: ''
labels: 'implementation:bug'
assignees: ''
---
```

## Usage
Templates are automatically imported when creating new issue or PR in Github web interface.

### Issue templates 

Github allows to multiple templates to be used for creating issues.
The screenshot below presents available options with proposed set of templates and configs: 

![](images/New%20Issue%20%C2%B7%20templates.png)

Note, that **Report a security vulnerability** option is added by Github and opening blank issues is enabled.

The proposed issue categories are intended for:

|Category| Description|
|---|---|
| Bug| Describing bugs in Provider Implementations|
|Correction|Suggesting corrections of API specification or indicating misalignment with API design guidelines|
|Enhancement| Suggesting ideas for new API features or questions on directions for API evolution| 



### Pull request template


## References
[Github documentation](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/about-issue-and-pull-request-templates)

[Full Emoji List](https://unicode.org/emoji/charts/full-emoji-list.html)
