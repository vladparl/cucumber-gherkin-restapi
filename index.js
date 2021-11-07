var reporter = require('cucumber-html-reporter');

var options = {
        name: "BDD Rest API Testing Report",
        theme: 'bootstrap',
        jsonFile: 'reports/report.json',
        output: 'reports/cucumber_report.html',
        reportSuiteAsScenarios: true,
        scenarioTimestamp: true,
        launchReport: true,
        scenarioTimestamp: true,
        metadata: {
            "App Version":"1.0.0",
            "Test Environment": "TESTING",
            "Platform": "Windows 10",
        }
    };

    reporter.generate(options);