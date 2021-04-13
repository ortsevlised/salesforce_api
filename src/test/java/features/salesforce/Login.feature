Feature: Login to Salesforce using OAuth 2.0
# Please have a look at the API documentation for further details
# LOGIN https://developer.salesforce.com/docs/atlas.en-us.230.0.api_rest.meta/api_rest/quickstart_oauth.htm
# EVENTS: https://developer.salesforce.com/docs/atlas.en-us.platform_events.meta/platform_events/platform_events_publish_api.htm
  Scenario: Salesforce login using OAuth 2.0
    Given url apiUrl
    And path 'services/oauth2/token'
    * form field grant_type = 'password'
    * form field client_id = 'replace_me'
    * form field client_secret = 'replace_me'
    * form field username = 'replace_me
    * form field password = 'replace_me'
    When method post
    Then status 200

    * def accessToken = response.access_token
    * def instance_url = response.instance_url
    # Up to here should work fine
    # Once we log in we can use the access token and instance_url to perform our next requests,
    # I would suggest to move the login as another method to use as precondition for other tests

    #This part is failing, I need more details about the event request.
    Given url instance_url
    And path 'services/data/v51.0/sobjects/TestEvent__e'
    And header Authorization = 'Bearer ' + accessToken
    And param access_token = accessToken
    And request {"replayId":-1, "rawPayload":true}

    When method post
    Then status 200

