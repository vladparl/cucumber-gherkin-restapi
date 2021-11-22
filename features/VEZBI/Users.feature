Feature: Users

Scenario: Create user
    When make a POST request to /api/users
    And set body to:
    """
    {
    "name": "test",
    "job": "user"
    }
    """
    Then response is received
    Then response status is 201
