pipeline {
    agent none
    stages {
     
        
        stage('Pre-tadmin') {
             agent {
               label "Agent2"
      }
            steps {
               
                checkout([$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ng-tadmin']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'f4a43310-1870-43ec-a51f-c52d8d8a396e', url: 'https://github.com/Shahunks/ng-tadmin-api-server-deployment.git']]])
              checkout([$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ng-tadmin/ng-server-components']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'f4a43310-1870-43ec-a51f-c52d8d8a396e', url: 'https://github.com/Shahunks/ng-server-components-deployment.git']]])
               sh 'bash -c "cd ng-tadmin && rm -rf node_modules"'
               sh 'bash -c "cd ng-tadmin && npm install"'
               sh 'bash -c "cd ng-tadmin && npm install sonarqube-scanner"'
               sh 'bash -c "cd ng-tadmin &&  npm install jest"'
            }
        }
                
                
          stage('Sonar-ngtadmin') {

          agent {
               label "Agent2"
       }
            steps {
                sh 'cd ng-api-server &&  ./node_modules/sonarqube-scanner/dist/bin/sonar-scanner  -Dsonar.sources=. -Dsonar.projectKey=ng-tadmin -Dsonar.password=72b9cad2dacc1cde8dc1eed5df24d3cb4a761938  -Dsonar.host.url=http://10.8.201.78:9000/ -Dsonar.exclusions=**node_modules** -Dsonar.eslint.reportPaths=report.json'
            }  
           
           
} 
        stage('Build-tadmin') {
             agent {
               label "Agent2"
      }
            steps {
               
              
                sh 'bash -c "cd ng-tadmin && sh docker/build/shell.sh ${Ver_Tag}"'
                
            }
        }
        
       
    
     
     stage('Pre-ng') {
            agent {
              label "Agent2"
     }
           steps {
               
               checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ng-api-server']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'f4a43310-1870-43ec-a51f-c52d8d8a396e', url: 'https://github.com/Shahunks/ng-api-server.git']]])
               checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ng-server-components']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'f4a43310-1870-43ec-a51f-c52d8d8a396e', url: 'https://github.com/Shahunks/ng-server-components.git']]])
               sh 'bash -c "cd ng-api-server && rm -rf node_modules"'
               sh 'bash -c "cd ng-api-server && npm install"'
               sh 'bash -c "cd ng-api-server && npm install sonarqube-scanner"'
               sh 'bash -c "cd ng-api-server &&  npm install jest"'
               
               
                
                
           }
}
         stage('sonar-ng-api') {

          agent {
               label "Agent2"
       }
            steps {
                sh 'cd ng-api-server &&  ./node_modules/sonarqube-scanner/dist/bin/sonar-scanner  -Dsonar.sources=. -Dsonar.projectKey=ng-api -Dsonar.password=72b9cad2dacc1cde8dc1eed5df24d3cb4a761938  -Dsonar.host.url=http://10.8.201.78:9000/ -Dsonar.exclusions=**node_modules** -Dsonar.eslint.reportPaths=report.json'
            }  
           
           
} 
         stage('test-ngapi') {
            agent {
              label "Agent2"
     }
           steps {
               
              sh 'bash -c "cd ng-api-server &&  ./node_modules/jest/bin/jest.js --config jest.config.js"'
               
               
           }
} 
        stage('build-sngapi') {
             agent {
               label "Agent2"
      }
            steps {
               
                
                sh 'bash -c "cd ng-api-server && sh shell.sh "'
                
            }
        }
        
    }
       
}
