pipeline{
  agent any
  tools {
     nodejs "Node"
    // maven "Maven"
     
 }
 environment {

        ProjectName = "Lakeshore-uat"

}

    stages {
   
   
     stage('Git Clone'){
        steps{
           sh 'sleep 10'
           cleanWs()
         
           sh 'npm cache clean --force'
  echo "Cloning the ${ProjectName} project from GitLab"
      git url: 'https://github.com/Nishanth80/nodejs-app-mss.git', branch: 'master', credentialsId: '888'
  echo "Code has been checked out into ${JENKINS_HOME}/workspace/${JOB_NAME} workspace..!"
}
     }
     stage('Tag Push') {
     
       steps{
          withCredentials([usernamePassword(credentialsId: '888', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
      sh('bash gittag.sh')
      sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/Nishanth80/nodejs-app-mss.git --tags')
    }
       }
     }
     stage("Build") {
         steps{
      //   nodejs(nodeJSInstallationName: 'nodejs15.2.1') {
     
              sh 'npm install'
      //   }
         }
     }
     stage('ExecuteSonarQubeReport') {
         steps{
          // nodejs(nodeJSInstallationName: 'nodejs15.2.1') {
        sh 'npm run sonar'
         //  }
         }
     
     }
     stage('UploadintoNexus') {
         steps{
      // nodejs(nodeJSInstallationName: 'nodejs15.2.1') {
         // sh 'npm login --registry=http://3.94.53.202:8081/'
        // sh 'npm adduser'
          sh('bash version.sh')
          sh 'npm publish --registry http://3.94.53.202:8081/repository/Nodejs/'
     // }
         }
      }
    }
  
