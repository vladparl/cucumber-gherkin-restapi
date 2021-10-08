Feature: Users

Scenario: Create user
    Given Make a POST request to /api/users
    And I set body to
    """
    {
    "name": "morpheus",
    "job": "leader"
    }
    """
    When receive a response
    Then I expect response should have a status 201
