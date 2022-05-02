# General principles doc (Issue #7)

**Issue 1: API format** : Suported API format will be OAS3. We shall support both sync (200/201 response code) and async (202 response code) API spec. Note that support of async API is subject to capabilities of underlying assets and bound to specific operations (e.g. feasibility check, etc.).

**Issue 2: Criteria to go from step 3 (testing) to step 4 (validation)**
<ul>
  <li> At least one independent method 100% implemented. </li>
  <li> In case a method "x" has dependencies with other methods "{Y,Z}", for method "X" to be validated, methods "{Y,Z}" need to be implemented as well.</li>
</ul>
  
**Issue 3: API design principles**
<ul>
  <li> API First </li>
  <ul>    
    <li> API-First Strategy benefits</li>
  </ul>
  <li> Information representation standard </li>
  <li> API Definition </li>
  <ul>    
    <li> API REST </li>
    <li> HTTP Verbs </li>
    <li> HTTP Response Codes </li>
    <li> Query Parameters Use</li>
    <ul>
         <li> Good Practises </li>
    </ul>
    <li> HTTP Header definitions </li>
    <ul>
         <li> include HTTP Headers Forbidden </li>
    </ul>
    <li> MIME Types </li>
    <li> HATEOAS </li>
 </ul>
 <li> API Resources Definitions </li>
 <ul>    
    <li> URL Definition </li>
    <ul>
         <li> Good Practises </li>
         <li> Hierarchy </li>
    </ul>
    <li> I/O resources definition </li>
 </ul>
 <li> Versioning </li>
 <ul>    
    <li> Strategy </li>
    <li> Backward and forward compability </li> 
    <ul>
         <li> Type of modifications  </li>
         <li> Compability management </li>
    </ul>
 </ul>
 <li> Error Responses </li>
 <li> Common Data Types (AddressType structure, E164Type, EmailAddressType, ExceptionType structure,...) </li>
 <li> Filtering, sorting and pagination </li>
 <ul>    
    <li> Pagination </li>
    <li> Sorting </li>
    <li> Filtering  </li>
    <li> Partial responses </li>
 </ul>
 <li> Architecture Headers </li>
 <li> Security </li>
     <ul>    
     <li> API REST Security </li>
     <ul>
         <li> REST security design principles  </li>
         <li> REST APIs Securitzation Good practises </li>
    </ul>    
     <li> Security Implementation </li>
     <ul>
         <li> Channel security (TLS and authentication, certificate chain validation, recommended ciphers) </li>
         <li> Access security (OAuth, scopes) </li>
         <li> Data security (Headers Validations, Body Validation) </li>
    </ul>
    </ul>
 <li> Open API definition </li>
 <ul>    
    <li> General Information </li>
    <li> Request Params </li>
    <li> Response Structure </li>
    <li> Data Definitions </li>
    <li> OAUuh Definitions </li>
 </ul>
</ul>
