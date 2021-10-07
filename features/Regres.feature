Feature: Regres

  In order to keep Regres api stable
  As a tester
  I want to make sure that everything works as expected

  Scenario: Get A User
    Given I make a GET request to /api/users/1
     When receive a response
     Then I expect response should have a status 200
      And I expect response should have a json at data
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
        "data": {
          "id": 1,
          "first_name": "George"
        }
      }
      """

  Scenario: List Users
    Given Make a GET request to /api/users
      And I set query param page to 2
     When receive a response
     Then I expect response should have a status 200
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
    Given Make a GET request to /api/users/{id}
      And I set path param id to $S{UserId}
     When receive a response
     Then I expect response should have a status 200
      And I expect response header content-type should have application/json; charset=utf-8
      And I expect response should have a json like
      """
      {
        "data": {
          "id": 7
        }
      }
      """

  Scenario: Create A User
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

  Scenario: Take a list of users
    Given Make a GET request to /api/users?page=2
    When receive a response
    Then I expect response should have a status 200
    And I expect response should have a json like
    """
    {
       "support": {
       "url": "https://reqres.in/#support-heading",
       "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
    }
    """
