# Device Identifier


| **Field** | Description | 
| ---- | ----- |
| API name | Device Identifier |
| API owner | Vodafone |
| API summary | Device (i.e. UE) status indications are an important family of APIs where the API consumer is not the device itself. One status indication that has several use cases is the identity of the device being used by the subscriber. This information is known to the mobile network in the form of the IMEI, which is primarily used for blacklisting unauthorised devices. However, there are scenarios where this information can be useful to external API consumers. |
| | For example, such information could be useful in the following scenarios: (1) for insurance purposes, to automatically identify a device that a customer wishes to insure, (2) for security / fraud reasons, to establish that a customer is not using a device they claim to have broken or lost, (3) for service delivery reasons, to optimise content for a particular device or OS type |
| | Inputs: the target UE whose device identity is required should be explicitly identified by its GPSI (MSISDN or External Identifier). It is not expected that the UE itself will call this API, and hence OpenID Connect will not identify the target UE. |
| Technical viability | UE device identity information can be obtained directly from the HSS. |
| Commercial viability | Commercial solutions for HSS do already exist on operators, as it's a key element of LTE and IMS core networks. |
| YAML code available? | NO |
| Validated in lab/productive environments? | YES, validated in lab environment |
| Validated with real customers? | NO |
| Validated with operators? | NO |

