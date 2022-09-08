const sonarqubeScanner = require('sonarqube-scanner');

sonarqubeScanner({
  serverUrl: 'http://localhost:9000/',
       options : {
	    'sonar.projectDescription': 'This is a Node JS application',
	    'sonar.projectName': 'sonar-demo',
	    'sonar.projectKey':'sonar-demo',
	    //'sonar.login': 'sqa_2bb8b05844bdacda587c4c379f57c0acc66c71e4',
	    'sonar.login': 'admin',
	    'sonar.password': 'sqa_2bb8b05844bdacda587c4c379f57c0acc66c71e4',
            'sonar.projectVersion':'1.0',
	    'sonar.language':'js',
            'sonar.sourceEncoding':'UTF-8',
            'sonar.sources': '/var/lib/jenkins/workspace/sonar-demo/',
	  //'sonar.tests': 'specs',
          //'sonar.inclusions' : 'src/**'
       },
}, () => {});
