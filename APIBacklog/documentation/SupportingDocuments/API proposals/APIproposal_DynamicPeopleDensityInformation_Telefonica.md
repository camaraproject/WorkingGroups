| **Field** | Description | 
| ---- | ----- |
| API family name | Dynamic People Density Information | 
| API family owner | Telefonica |
| API summary | The service enables developers with the capability to get dynamic population density data in a specific area for a future date&time, considering anonymized information of the network connected devices in the requested area at the flight time.<br /> Use Case (1): Providing BVLOS flight the data to meet SORA 2.5 requirements in terms of intrinsic Ground Risk Class (iGRC).<br /> Use Case (2): Providing data to identify if the ground risk class for a given drone flight is acceptable for the time of the flight, or an alternative time should be considered to lower the risk.<br /> Service Inputs: Area of the flight (delimited space).<br /> Service Outputs: maximum population density value for the given area. |
| Technical viability | The viability has been checked and it is based on providing the amount of people on a flight path obtained by aggregating number of SIMs connected to each antenna on the path and without considering M2M SIMs, extrapolating to real-desnsity of population based on tht level of radio occupancy. No individual subscriber data will be delivered as the information will be anonymized.  |
| Commercial viability | For use in drone flight scenarios, where  population density is required to ensure a secure level of risk | 
| YAML code available? | NO<br>To be provided  |
| Validated in lab/productive environments? | NO |
| Validated with real customers? | NO |
| Validated with operators? | YES<br>Proposal validates in OGW drop3 |
| Supporters in API Backlog Working Group | Telefonica; China Unicom (To align with RegionUserCount API) |