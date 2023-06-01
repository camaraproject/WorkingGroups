# API Proposal Template
This template captures all the information that a partner should fill out when proposing a new API (or API family) to CAMARA.


| **Field** | Description | 
| ---- | ----- |
| API family name | Click to Dial |
| API family owner | China Mobile |
| API summary |Click-to-Dial provides the ability to effectively protect user privacy during a call. It helps companies using this API to establish voice calls for their users. It also protects the privacy of the users of the enterprise during the voice call.<br><br>Through this API, when users initiate a call request through the enterprise platform or application, it dial both the caller and the called party in turn, and the caller and the called party answer the call to achieve the peer-to-peer voice call between the caller and the called party.<br><br>For example, such information could be useful in the following scenarios: <br>•For privacy and security protection, it can hide personal information of users through number hiding to ensure the privacy and security of users.<br>•For improving work efficiency, through this API can reduce the tedious operation of calls between employees of enterprises and improve the overall office efficiency of enterprises.<br><br>Input：<br>Enterprise ID, API product code, platform number, caller number, called number and other information.<br>Output：<br>API call success or failure response, call duration, call pickup listen notification, hang-up timestamp. |
| Technical viability | Requires voice network support for outbound calls to two parties. |
| Commercial viability | API Commercially available.|
| YAML code available? | YES.|
| Validated in lab/productive environments? | YES. <br>Available in China Mobile test environment.|
| Validated with real customers? | YES.<br> Click-to-Dial is being used by several companies, such as YIDIANLING,China Mobile (Hangzhou) Information Technology Co., Ltd. and others.|
| Validated with operators? | NO.|

