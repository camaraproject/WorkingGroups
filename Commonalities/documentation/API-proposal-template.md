# API Proposal Template
This template captures all the information that a partner should fill out when proposing a new API (or API family) to CAMARA.


| **Field** | Description | 
| ---- | ----- |
| API name | Name of the API proposal |
| API owner | Company submitting the API proposal. |
| API summary | High level description of the objective(s) of the API proposal, and two/three examples of in-scope business cases. |
| Technical viability | Identify the underlying network/cloud capabilities which are needed for the support of CAMARA API, relating these capabilities them to standards maturity. <br><em>Example: this API requires the availability of NEF with this Rel-15 "X"feature</em>. 
| Commercial viability | Specify the availability of commercial or (industrialized) open-source solutions for the identified network/cloud capabilities. <br><em> NOTE: If open-source, provide a publicly available reference/link to the actual solution, and specify the version under consideration.</em>|
| YAML code available? | YES / NO. |
| Validated in lab/productive environments? | YES / NO. <br>If YES, specify if it was lab network or productive network. |
| Validated with real customers? | YES / NO. <br>If YES, specify how many customers participated in the evaluation , and what their use cases were. <br><em>NOTE: It is not mandatory (though recommendable) to specify the name of the customers. </em> |
| Validated with operators? | YES / NO. <br> If YES, specify how many operators participated in the evaluation. <br><em>NOTE: It is not mandatory (though recommendable) to specify the name of the operators. </em> |

**Guidelines on template submission**

- Option A (default): the API proposal is out of scope of an existing API Sub Project
  - Upload this template to API backlog, [in this directory](https://github.com/camaraproject/WorkingGroups/tree/main/APIBacklog/documentation/Contributions/API%20Proposals), using this filename: `APIproposal_<APIname>_<APIowner>.md`. The submission shall be done via PR, assigning at least with one reviewer.


- Option B (shortcut): the API proposal is in scope of an existing API Sub Project
  - Upload this template to the target Sub Project, using this filename: `APIproposal_<APIname>_<APIowner>.md`, assigning at least with one reviewer.

