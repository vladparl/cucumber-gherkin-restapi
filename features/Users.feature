Feature: Users

Scenario: Create user
    When I make a POST request to /api/users
    And I set body to:
    """
    {
    "name": "test",
    "job": "user"
    }
    """
    Then I receive a response
    Then response status is 201
