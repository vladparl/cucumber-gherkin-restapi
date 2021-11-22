const { request, settings } = require('pactum');
const { Before } = require('@cucumber/cucumber');

Before(() => {
  request.setBaseUrl('https://reqres.in');
  request.setDefaultHeaders("Content-Type", "application/json");
  settings.setLogLevel('DEBUG');
});