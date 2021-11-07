# pactum-cucumber-boilerplate

Boilerplate project to run REST API tests with [Cucumber](https://cucumber.io) and [PactumJS](https://pactumjs.github.io)

## Instalation
```sh
1. Install Node.js
2. npm install (Install NPM)
3. npm init -y (Initialize the project)
4. npm install --save-dev @cucumber/cucumber (Install Cucumber)
```

## Install Reporting
```
https://www.npmjs.com/package/cucumber-html-reporter
1. Run npm i cucumber-html-reporter
2. Run npm install cucumber-html-reporter --save-dev
3. Create index.js file
4. Update scripts in package.json with:
    "test": "cucumber-js --publish --format json:reports/report.json",
    "report": "node index.js"
5. Create  folder reports and inside create one empty report.json file
6. Run "npm run test" to execute tests
7. Run "npm run report" to see report
```

## Sample Test Case

```gherkin
Feature: Regres

  In order to keep Regres api stable
  As a tester
  I want to make sure that everything works as expected
  
  Scenario: Get A User With Id
    Given Make a GET request to /api/users/{id}
      And I set path param id to $S{UserId}
     When receive a response
     Then I expect response should have a status 200
      And I expect response should have a json like
      """
      {
        "data": {
          "id": 7
        }
      }
      """
```

## Gherkin Expressions

Sample Step Definitions

```gherkin
    GIVEN set path param: (.*) in URL with value: (.*)
    _Given set path parameter "Name" in URL with value "12345"_
    
    Given set query parameter (.*) with value (.*)
    _Given set query parameter "Name" with value "12345"_
    
    Given set basic authentication credentials (.*) and (.*)
    _Given set basic authentication credentials "username" and "password"_

    Given set header (.*) with value (.*)
    _Given set header "Authorization" with value "token"_
    
    Given upload file at filepath: (.*)
    _Given upload file at filepath: "api/data/upload"_
    
    Given set multi-part form param (.*) to (.*)
    _Given set multi-part form param "" to ""_
    
    When make a (.*) request to (.*)
    _When make a "POST" request to "/api/users"_
    
    When make a (.*) request with body to (.*)$/
    _When make a "POST" request with body to "/api/user/create"
    {
        "username": "example"
        "password": "example"
    }_
    
    When set body to:
    _When set body to:
    {
        "username": "example"
        "password": "example"
    }_
    
    Then receive a response 
    _(Mandatory step which guarantees that response is returned)_
  
    Then response status is {int}
    _Then response status is 200_
    I expect response header (.*) should be (.*)
    I expect response header (.*) should have (.*)
    I expect response should have a json
    I expect response should have a json at (.*)
    I expect response should have a json like
    I expect response should have a json like at (.*)
    I expect response should have a json schema
    I expect response should have a json schema at (.*)
    I expect response should have a body
    I expect response should have {string}
    I store response at (.*) as (.*)
```
