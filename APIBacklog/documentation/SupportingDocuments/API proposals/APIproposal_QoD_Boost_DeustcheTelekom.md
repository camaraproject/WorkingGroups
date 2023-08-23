### QoD Boost API submission

| **Field** | Description | 
| ---- | ----- |
|API name | Quality on Demand (Automatic Boost)|
|API owner | Deutsche Telekom AG – Noel Wirzius |  
|API Contributors| TBD |
|API summary | In an empty cell a user doesn’t really need a quality on demand API and don’t want to pay for something which is not giving any benefit for the end user performance. On the other side consumers want to have a guarantee that their Use-Cases are also performing when the cell is getting temporary congested. With this new QoD Boost API a developer can set a minimum of throughput (or other performance indicators), which is required for a good UX in their application. The new QoD Boost API is then checking the quality of the connection against the defined parameters:  <br> 1. If the measured parameter drops under the defined level then the QoD Boost API is calling the right `QoD_Profile` to lift back the connection into the required performance range.<br> 2. As soon as the network calms down again and provides the developer's specified quality parameters, the API suspends the request for the `QoD_profile`. <br><br> Use-Cases: <br> *Moving objects*: A person in a train is travelling through different cells. Some of them are empty, some of them are congested. <br> *Autonomous Valet Parking*: Most of the parking lots are nearly not congested but in the case of cases – they need the guarantee of the network to avoid any accidents. <br>*Content Delivery (Streaming)*: Streaming providers are needing a minimum of throughput to deliver their content. <br>*Payment (Point of Sales)*: Pop-Up Shops, Festivals or other Events. In a normal congested area, the best effort is enough to send out the data. But if there are a lot of people for a defined time frame (rush hour) – they need a boost. With the API they can trust the telco to delivers exactly in these peak hours a better performance |
|Technical viability  |<li> Only 5GSA  <br><li>IETF L4S Architecture ([RFC9330](https://datatracker.ietf.org/doc/rfc9330/)) <br><li> [DT Whitepaper](https://www.telekom.com/resource/blob/628056/db8412520298f03744f938dc33b0dc9a/dl-210526-whitepaper-data.pdf) |
|Commercial viability | Customer demand has been validated. <br>
|YAML code available?  | No |
|Validated in lab/productive environments? |Yes, partly  <br> With hardware vendor |
|Validated with real customers? |Yes, partly |
|Validated with operators?| No |
