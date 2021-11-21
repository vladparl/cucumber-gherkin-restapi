const pactum = require('pactum');
const { request } = require('pactum');
const { Given, When, Then, Before, After } = require('@cucumber/cucumber');

let spec = pactum.spec();

Before(() => {
  spec = pactum.spec();
  spec.withRequestTimeout(5000);
});

Given(/^base URL is (.*)$/, function (baseURL) {
  request.setBaseUrl(baseURL);
});

Given(/^set path parameter: (.*) in URL with value: (.*)$/, function (key, value) {
  spec.withPathParams(key, value);
});

Given(/^set query parameter: (.*) with value: (.*)$/, function (key, value) {
  spec.withQueryParams(key, value);
});

Given(/^set basic authentication credentials (.*) and (.*)$/, function (username, password) {
  spec.withAuth(username, password);
});

Given(/^request header (.*) is (.*)$/, function (key, value) {
  spec.withHeaders(key, value);
});

Given(/^upload file at filepath: (.*)$/, function (filePath) {
  spec.withFile(filePath);
});

Given(/^set multi-part form param (.*) to (.*)$/, function (key, value) {
  spec.withMultiPartFormData(key, value);
});

When(/^make a (.*) request to (.*)$/, function (method, endpoint) {
  spec[method.toLowerCase()](endpoint);
});

When(/^make a (.*) request with body to (.*)$/, function (method, endpoint, body) {
  spec[method.toLowerCase()](endpoint);
  spec.withBody(body);
});

When(/set body to:/, function (body) {
  spec.withBody(body);
});

Then('response is received', async function () {
  await spec.toss();
});

Then('response status is {int}', function (code) {
  spec.response().should.have.status(code);
});

Then(/^response header (.*) is (.*)$/, function (key, value) {
  spec.response().should.have.header(key, value);
});

Then(/^response header (.*) contains (.*)$/, function (key, value) {
  spec.response().should.have.headerContains(key, value);
});

Then(/^response body contains (.*)$/, function (key) {
  spec.response().should.have.bodyContains(key);
});

Then(/^response have a json$/, function (json) {
  spec.response().should.have.json(JSON.parse(json));
});

Then(/^response should have a json at (.*)$/, function (path, value) {
  spec.response().should.have.json(path, JSON.parse(value));
});

Then(/^response should have a json like$/, function (json) {
  spec.response().should.have.jsonLike(JSON.parse(json));
});

Then(/^response should have a json like at (.*)$/, function (path, value) {
  spec.response().should.have.jsonLike(path, JSON.parse(value));
});

Then(/^response should have a json schema$/, function (json) {
  spec.response().should.have.jsonSchema(JSON.parse(json));
});

Then(/^response should have a json schema at (.*)$/, function (path, value) {
  spec.response().should.have.jsonSchema(path, JSON.parse(value));
});

Then(/^response should have a body$/, function (body) {
  spec.response().should.have.body(body);
});

Then('response should have {string}', function (handler) {
  spec.response().should.have._(handler);
});

Then(/^store response (.*) in (.*)$/, function (path, name) {
  spec.stores(name, path);
});

Then(/^request completes within a specified duration of (.*)$/, function (miliseconds) {
  spec.expectResponseTime(miliseconds);
});

After(() => {
  spec.end();
});