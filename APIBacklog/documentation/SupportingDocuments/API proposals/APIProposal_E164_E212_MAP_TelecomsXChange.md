

Field | Description
-- | --
API family name | Dial Code Lookup API (E.212 to E.164 Map)
API family owner | TelecomsXchange
API summary | The Dial Code Lookup API provides up-to-date information on the mapping of dial codes (also known as calling codes or country codes) to countries and regions. Currently, there is no standardized mapping list for dial codes, and each operator creates their own list, which is often out-of-date. This API aims to standardize the mapping list to increase the accuracy of billing and routing and reduce disputes related to mis-matched dial code mapping. By accessing the Camara API, telecom solution software developers, such as IMS, Softswitches, and SMSCs, can easily and automatically pull updated dial codes as they change, improving the accuracy and reliability of their systems.
Technical viability | This API requires access to a database that contains the latest information on E.212 to E.164 mappings, I suggest https://github.com/ajamous/OpenMSISDNMapper as a start. The database should be updated on a regular basis to ensure the accuracy of the mappings. The API can be implemented using standard RESTful protocols, and it requires support for JSON and XML data formats.
Commercial viability | When TelecomsXchange built the SMS Exchange marketplace platform, we encountered difficulty accessing E.212 to E.164 mapping data as every operator maintains its own version of the list that is neither open-source nor available to the public. However, TelecomsXChange (TCXC) and its Partner, Telin (a subsidiary of Telkom Indonesia), have manually collected and built an extensive and up-to-date database using over 7 sources such as Wikipedia, GSMA, Tekom Group, and others. This database can be used to implement the API and is based on open-source software that is publicly available for download. To ensure that the API remains current and accurate, it would be advantageous to include an automated mechanism in the Camara API that allows operators to suggest dial code additions, removals, or changes through a pull request. This would enable operators to provide updates efficiently and effectively, ultimately keeping the API up-to-date with the latest mapping information.
YAML code available? YES | YAML sample is available on https://github.com/ajamous/OpenMSISDNMapper .
Validated in lab/productive environments? | YES, this list is being used by TCXC and Telin for the past 3 years to bill voice, SMS traffic for over 2 Billion transactions annually.
Validated with real customers? | YES.
Validated with operators? | YES.
Supporters in API Backlog Working Group | N/A

