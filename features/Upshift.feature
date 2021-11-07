Feature: Pivot

  Scenario: Login user
    When make a POST request with body to /api/users
    """
    {
      "name": "morpheus",
      "job": "leader"
    }
    """
    Then receive a response
    And response status is 201

  Scenario: Login user
    Given baseURL is https://dog.ceo
    When make a GET request to /api/breeds/image/random
    Then receive a response