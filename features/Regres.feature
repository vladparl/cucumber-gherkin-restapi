Feature: Regres

  Scenario: Get A User
    When I make a GET request to /api/users/1
    Then I receive a response
    And response status is 200
    And response should have a json at data
      """
      {
        "id":1,
        "email":"george.bluth@reqres.in",
        "first_name":"George",
        "last_name":"Bluth",
        "avatar":"https://reqres.in/img/faces/1-image.jpg"
      }
      """
    And I expect response should have a json like
      """
      {
        "data": 
      {
        "id": 1,
        "first_name": "George"
      }
      }
      """

  Scenario: List Users
    When I make a GET request to /api/users
    And I set query parameter: page with value: 2
    Then I receive a response
    And response status is 200
    And I expect response should have a json like
    """
    {
      "page": 2
    }
    """
    And I expect response should have a json schema
      """
      {
        "type": "object",
        "properties": {
          "page": {
            "type": "number"
          }
        }
      }
      """
    And I store response at data[0].id as UserId
  
  Scenario: Get A User With Id
    When I make a GET request to /api/users/{id}
    And I set path parameter: id in URL with value: $S{UserId}
    Then I receive a response
    And response status is 200
    And response header content-type is application/json; charset=utf-8
    And I expect response should have a json like
    """
    {
      "data": {
        "id": 7
      }
    }
    """

  Scenario: Create A User
    When I make a POST request to /api/users
    And I set body to:
    """
    {
      "name": "morpheus",
      "job": "leader"
    }
    """
    Then I receive a response
    And response status is 201

  Scenario: Take a list of users
    When I make a GET request to /api/users?page=2
    Then I receive a response
    And response status is 200
    And I expect response should have a json like
    """
    {
       "support": {
       "url": "https://reqres.in/#support-heading",
       "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
    }
    """
