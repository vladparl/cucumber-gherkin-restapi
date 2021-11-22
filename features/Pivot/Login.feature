@Authentication
Feature: Authentication

    Scenario: Login with valid username and password
        Given base URL is https://api.test.pivotenergy.com
        When make a POST request with body to /auth/login
        """
        {
            "username": "admin@nwh.com",
            "password": "9ceBABfA7G-g42k"
        }       
        """
        Then response is received
        And response status is 200
        And response body contains idToken

    Scenario: Login with invalid username
        Given base URL is https://api.test.pivotenergy.com
        When make a POST request with body to /auth/login
        """
        {
            "username": "invalid@nwh.com",
            "password": "9ceBABfA7G-g42k"
        }       
        """
        Then response is received
        And response status is 401
        And response have a json
        """
        {
            "code": "USER_NOT_FOUND",
            "message": "User does not exist",
            "statusCode": 401
        }
        """

    Scenario: Login with invalid password
        Given base URL is https://api.test.pivotenergy.com
        When make a POST request with body to /auth/login
        """
        {
            "username": "admin@nwh.com",
            "password": "invalid"
        }       
        """
        Then response is received
        And response status is 401
        And response have a json
        """
        {
            "code": "WRONG_CREDENTIALS",
            "message": "Incorrect username or password",
            "statusCode": 401
        }
        """

        @PA21_452 
        @ignore
        Scenario: Login without username
        Given base URL is https://api.test.pivotenergy.com
        When make a POST request with body to /auth/login
        """
        {
            "username": "",
            "password": "invalid"
        }       
        """
        Then response is received
        And response status is 401
        And response have a json
        """
        {
            "code": "WRONG_CREDENTIALS",
            "message": "Incorrect username or password",
            "statusCode": 401
        }
        """
