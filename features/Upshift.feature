Feature: Pivot

  Scenario: Login user
    When I make a POST request with body to /api/users
    """
    {
      "name": "morpheus",
      "job": "leader"
    }
    """
    Then I receive a response
    And response status is 201