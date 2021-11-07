Feature: Regres

  Scenario: Get A User
    When make a GET request to /api/users/1
    Then receive a response
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
    And response should have a json like
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
    When make a GET request to /api/users
    And set query parameter: page with value: 2
    Then receive a response
    And response status is 200
    And response should have a json like
    """
    {
      "page": 2
    }
    """
    And response should have a json schema
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
    And store response data[0].id in UserId
  
  Scenario: Get A User With Id
    When make a GET request to /api/users/{id}
    And set path parameter: id in URL with value: $S{UserId}
    Then receive a response
    And response status is 200
    And response header content-type is application/json; charset=utf-8
    And response should have a json like
    """
    {
      "data": {
        "id": 7
      }
    }
    """

  Scenario: Create A User
    When make a POST request to /api/users
    And set body to:
    """
    {
      "name": "morpheus",
      "job": "leader"
    }
    """
    Then receive a response
    And response status is 201

  Scenario: Take a list of users
    When make a GET request to /api/users?page=2
    Then receive a response
    And response status is 200
    And response should have a json like
    """
    {
       "support": {
       "url": "https://reqres.in/#support-heading",
       "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
    }
    """
