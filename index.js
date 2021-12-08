var reporter = require('cucumber-html-reporter');

var options = {
        name: "Tallarna REST API Report",
        theme: 'bootstrap',
        jsonFile: 'reports/report.json',
        output: 'reports/cucumber_report.html',
        reportSuiteAsScenarios: true,
        scenarioTimestamp: true,
        launchReport: true,
        scenarioTimestamp: true,
        metadata: {
            "Environment": "TEST",
            "Created By": "Vladimir Parlikj",
            "App Version":"1.10.0",
            "Date": "12/08/2021"
        }
    };

    reporter.generate(options);