Age Verification API submission

| **Field** | Description |
| ---- | ----- |
| API name | Location Retrieval |
| API owner | Ericsson DT Orange Telefonica Vodafone |
| Initial API Contributors | Joachim Dahlgren Ericsson & Ludovic Robert - Orange | 
| API summary | This API allows for the API Consumer to get the raw location of a mobile device. This would serve use cases in which the device does not have built in GNSS support. Extended with subscription support it would also serve use cases for tracking such devices. Location data should be provided in form of geographical coordinates (x, y). The reason for this is that network identities such as CellID etc. are typically not known by developers (and should perhaps not even be exposed externally). The location could be given as a point or a shape with uncertainty area. Location is in most jurisdictions considered to be sensitive data and thereby consent by device owner/user must be verified before providing it to the developer.|
| Technical viability | This API uses mobile subscriber info to retrieve cell identifier and then from that cell iidentifier get the location.  </em>.
| Commercial viability | This service is requested in several UC to track device location for moving "things" like container or truck. <br/> This service can be serves also in APPs to verify the validity for a transaction (check that both party are in a same location for an App payment). |
| YAML code available? | Yes - done |
| Validated in lab/productive environments? | Yes (Orange lab) |
| Validated with real customers? | No </em> |
| Validated with operators? | Yes in GSMA Drop 3</em> |
