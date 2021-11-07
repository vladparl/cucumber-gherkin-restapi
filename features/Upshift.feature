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