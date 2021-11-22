Feature: Upshift

  Scenario: Login user
    When make a POST request with body to /api/users
    """
    {
      "name": "morpheus",
      "job": "leader"
    }
    """
    Then response is received
    And response status is 201

  Scenario: Login user
    Given base URL is https://dog.ceo
    When make a GET request to /api/breeds/image/random
    Then response is received