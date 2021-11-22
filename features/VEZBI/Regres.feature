Feature: Regres

  Scenario: Get A User
    When make a GET request to /api/users/1
    Then response is received
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
    Then response is received
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
    Then response is received
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
    Then response is received
    And response status is 201

  Scenario: Take a list of users
    When make a GET request to /api/users?page=2
    Then response is received
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

  Scenario: Login with invalid password returns 400
    Given base URL is https://reqres.in
    And make a POST request with body to /api/register
    """
    {
      "email": test@user.com 
    }
    """
    Then response is received
    And response status is 400

  Scenario: Get a list of all users
    When make a GET request to /api/users?page=2
    Then response is received
    And response status is 200
    And response should have a json like
      """
      {
    "page": 2,
    "per_page": 6,
    "total": 12,
    "total_pages": 2,
    "data": [
        {
            "id": 7,
            "email": "michael.lawson@reqres.in",
            "first_name": "Michael",
            "last_name": "Lawson",
            "avatar": "https://reqres.in/img/faces/7-image.jpg"
        },
        {
            "id": 8,
            "email": "lindsay.ferguson@reqres.in",
            "first_name": "Lindsay",
            "last_name": "Ferguson",
            "avatar": "https://reqres.in/img/faces/8-image.jpg"
        },
        {
            "id": 9,
            "email": "tobias.funke@reqres.in",
            "first_name": "Tobias",
            "last_name": "Funke",
            "avatar": "https://reqres.in/img/faces/9-image.jpg"
        },
        {
            "id": 10,
            "email": "byron.fields@reqres.in",
            "first_name": "Byron",
            "last_name": "Fields",
            "avatar": "https://reqres.in/img/faces/10-image.jpg"
        },
        {
            "id": 11,
            "email": "george.edwards@reqres.in",
            "first_name": "George",
            "last_name": "Edwards",
            "avatar": "https://reqres.in/img/faces/11-image.jpg"
        },
        {
            "id": 12,
            "email": "rachel.howell@reqres.in",
            "first_name": "Rachel",
            "last_name": "Howell",
            "avatar": "https://reqres.in/img/faces/12-image.jpg"
        }
    ],
    "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
    }
      """
    And store response data[0].id in id

  Scenario: Pass stored value in GET response
    #https://pactumjs.github.io/#/integration-testing?id=stores
    When make a GET request to /api/users/$S{id}
    Then response is received
    And response status is 200