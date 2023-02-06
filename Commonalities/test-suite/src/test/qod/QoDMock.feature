Feature: CAMARA SCEF mock for QoD

  Scenario: pathMatches('/oauth/token/v3')
    # Returns a fake oidc token to be able to connect API OIDC client to the mock as it was a real SCEF/NEF
    * def responseStatus = 200
    * def responseHeaders = { 'Content-Type': 'application/json' }
    * def response = read('reply/OIDCToken.json')

  Scenario: pathMatches('/subscriptions/{id}') && methodIs('delete')
    # A delete that works
    * def responseStatus = 200
    * def responseHeaders = { 'Content-Type': 'application/json' }
    * def response = read('reply/deleteSession200.json')

  Scenario: pathMatches('/subscriptions')
  && methodIs('post')
  && request.ueIpv4Addr == "172.20.120.40"
    # Returns 201 for 172.20.120.40
    * def responseStatus = 201
    * def responseHeaders = { 'Content-Type': 'application/json' }
    * def response = read('reply/createSession201.json')


  Scenario: pathMatches('/subscriptions')
  && methodIs('post')
  && request.ueIpv4Addr == "172.20.120.41"
    # ReturnS 500 error for 172.20.120.41
    * def responseStatus = 500
    * def responseHeaders = { 'Content-Type': 'application/json' }
    * def response = read('reply/createSession500.json')


  Scenario:
    # Catches all other requests
    * print request
    * def responseStatus = 500
    * def response = {"code":10000,"status":500,"message":"unknown request"}