| Feature       | Mandatory/Optional?  | TEF portal    | Postman Enterprise | Stoplight.io |
| ------------- | -------------------- | ------------- | ---------------------------- |---------------------------- |
| API catalogue | M                  | Yes           | Yes                          | Yes  |       
| tagged descriptions of each API  | M  |Yes  | Yes  | Yes |
| tags to include functional category and API status (e.g. draft)  | M  | Yes  | Yes  | Yes |
| Documentation repository | M  | Yes  | Yes  | Yes |
| Conformance testing automation for documentation against CAMARA API documentation templates  | O  | No  | Yes (via CI/CD pipeline)  | Yes (requires Gitlab integration) |
| Client & server code generation | O  | Yes  | Yes  | Yes |
| API testing automation against CAMARA commonalities/API principles  | ? | No | Yes (via CI/CD pipeline)  | Yes (via CI/CD pipeline)  
| Sandbox execution of API requests against local stubs (dummy data) | ?  | No  | Yes  | Yes |
| API consumer AuthN/AuthZ capability for executing the dummy API requests  | O  | No  | Yes  | ? |
| Links to operator API portals | M  | No (but possible to add) | No (but could add as a Markdown doc)  | No (but could add as a Markdown doc)  |


# out of scope: the portal will _not_
- expose, invoke or proxy live API calls against operator network
- provide registration to operator API portals
