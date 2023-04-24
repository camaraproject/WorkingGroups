# Using templates for Issues and Pull Request for CAMARA repositories 

## Introduction

Github enables using templates in order to customize and standardize the information contributors 
include when they open issues and pull requests in the repository.
The proposed set of templates is adjusted to be applicable mainly to CAMARA API specification subprojects.

GitHub uses templates for the repository if the respective template configuration files are placed in any of the following places:
* the root of the repository
* the `.github` folder
* the `docs` folder


## Configuration

In order to use templates for issues and pull request for the CAMARA Subproject the following steps need to be taken:

1. Copy the folder [.github](https://github.com/camaraproject/WorkingGroups/tree/main/Commonalities/documentation/SupportingDocuments/Github_templates/.github)
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
Templates are automatically imported when creating new issue or PR via Github web interface.

### Issue templates 

Github allows to multiple templates to be used for creating issues.
The screenshot below presents available options with proposed set of templates and configs: 

![](images/New%20Issue%20%C2%B7%20templates.png)

Note, that **Report a security vulnerability** option is added by Github and opening blank issues is enabled.
Preconfigured external links (here:  Subproject discussions,  CAMARA API Design Guidelines) will be opened in new tab of the browser.



The proposed issue categories are prepared with Github labels:

|Category| Description|Labels|
|---|---|---|
|Bug| Describing bugs in Provider Implementations|_implementation:bug_ |
|Correction|Suggesting corrections of API specification or indicating misalignment with API design guidelines|_correction_ |
|Documentation| Indicating issues with API documentation or supplementary documents| _documentation_ |
|Enhancement| Suggesting ideas for new API features or questions on directions for API evolution| _enhancement_ |
|Subproject management| Indicating issues with subproject repository or release management process|_subproject management_ |
|Tests | Indicating issues with API tests | _tests_ |


### Pull request template

Pull request template is based on the template use in [Kubernetes project](https://github.com/kubernetes/kubernetes/blob/master/.github/PULL_REQUEST_TEMPLATE.md)

It requires to indicate kind of PR as one of:
* bug
* correction
* enhancement/feature
* cleanup
* documentation
* subproject management
* tests

The proposed above values correspond to issue categories, with additional type: _cleanup_ for simple correction of typos/spelling mistakes or application of guidelines.

After describing what the PR does, the link to relevant issue should be added.
Thanks to Github keywords: `Fixes #<issue number>`, or `Fixes (paste link of issue)` pull request is linked to relevant issue to show that a fix is in progress and to automatically close the issue when the pull request is merged.

The pull request template includes the place to input a clear, concise description of the change that will facilitate creation of the **Release Notes**. 


## References
[Github templates documentation](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/about-issue-and-pull-request-templates)

[Github keywords to link an issue and pull request](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/using-keywords-in-issues-and-pull-requests)

[Full Emoji List](https://unicode.org/emoji/charts/full-emoji-list.html)
