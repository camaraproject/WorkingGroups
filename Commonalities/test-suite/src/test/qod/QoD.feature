Feature: CAMARA QoD API
   # This feature need you configure the QoD API to interact with NEF/SCEF mock running on port 8090.

  Background:
    # Define functions / variables to use in scenarii
    * def wait = function(){ java.lang.Thread.sleep(2000) }
    * def baseUrl = 'http://localhost:8080/qod/v0'
    * def getId = function(self){org.apache.commons.lang3.StringUtils.substringAfterLast(self,"/")}

  Scenario: Start the NEF/SCEF mock for QoD
    # Starts the NEF/SCEF mock
    # NEF/SCEF mock use fields from the request to choose the reply to send
    * karate.start({ mock: 'QoDMock.feature', port: 8090 })

  Scenario: Send QoD request with valid qos param should return an 201
    # Sample of single request scenario that should fail
    Given url baseUrl
    And path 'sessions'
    And request
    """
    {
      "duration": 600,
      "ueId": {"ipv4addr": "172.20.120.40"},
      "asId": {"ipv4addr": "172.20.120.84"},
      "uePorts": { "ports": [50984] },
      "asPorts": { "ports": [10000]},
      "qos": "QOS_M",
      "notificationUri": "https://webhook.site/c1ae90f8-b7b6-4185-a848-2d1f63a08ff7"
    }
    """
    When method POST
    Then status 201
    And match response.id == '#uuid'

  Scenario: Send QoD request with invalid qos param should return an error
    # Sample of single request scenario that should fail
    Given url baseUrl
    And path 'sessions'
    And request
    """
    {
      "duration": 600,
      "ueId": {"ipv4addr": "172.20.120.40"},
      "asId": {"ipv4addr": "172.20.120.84"},
      "uePorts": { "ports": [50984] },
      "asPorts": { "ports": [10000]},
      "qos": "QOS_Z",
      "notificationUri": "https://webhook.site/c1ae90f8-b7b6-4185-a848-2d1f63a08ff7"
    }
    """
    When method POST
    Then status 400

  Scenario Outline: Send QoD request for <ue> using port <port> should return <status>
    # Sample of multi-request scenario
    Given url baseUrl
    And path 'sessions'
    And request
    """
    {
      "duration": 600,
      "ueId": {"ipv4addr": "<ue>"},
      "asId": {"ipv4addr": "172.20.120.84"},
      "uePorts": { "ports": [<port>] },
      "asPorts": { "ports": [ 10000 ]},
      "qos": "QOS_M",
      "notificationUri": "https://webhook.site/c1ae90f8-b7b6-4185-a848-2d1f63a08ff7"
    }
    """
    When method POST
    Then status <status>

    Examples:
      | ue            | port  | status |
      | 172.20.120.40 | 50984 | 201    |
      | 172.20.120.41 | 50984 | 500    |


  Scenario Outline: Send Invalid QoD request for ue <ueIp:<uePort> and <asIp>:<asPort> should return <status>
    Given url baseUrl
    And path 'sessions'
    And request
    """
    {
      "duration": 600,
      "ueId": {"ipv4addr": "<ueIp>"},
      "asId": {"ipv4addr": "<asIp>"},
      "uePorts": { "ports": [<uePort>] },
      "asPorts": { "ports": [<asPort>]},
      "qos": "<qos>",
      "notificationUri": "https://webhook.site/c1ae90f8-b7b6-4185-a848-2d1f63a08ff7"
    }
    """
    When method POST
    Then status <status>

    Examples:
      | ueIp                 | uePort | asIp          | asPort | qos   | status |
      | 172.20.120.403       | 50984  | 172.20.120.84 | 10000  | QOS_M | 400    |
      | 172.20.120.106.23.24 | 50984  | 172.20.120.84 | 10000  | QOS_M | 400    |
      | 172.20.120.105       | 50984  | 172.20.120.84 | 10000  | QOS_Z | 400    |



