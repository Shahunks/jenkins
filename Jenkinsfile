pipeline {
     agent {
              label "Agent2"
     }
    stages {
     
        
         stage('Pre-tadmin') {
            
            steps {
               
                 
                 sh 'bash -c "echo ${BUILDS_ALL_TIME}"'
                checkout([$class: 'GitSCM', branches: [[name: '*/ng-248']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ng-tadmin']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'db5ece3a-688e-4261-aa2d-b3023985cb47', url: 'https://github.com/imanagedev/ng-tadmin-api-server.git']], workspaceUpdater: [$class: 'UpdateUpdater']])
              checkout([$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ng-tadmin/ng-server-components']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'db5ece3a-688e-4261-aa2d-b3023985cb47', url: 'https://github.com/imanagedev/ng-server-components.git']]])
                checkout([$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ng-server-components']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'db5ece3a-688e-4261-aa2d-b3023985cb47', url: 'https://github.com/imanagedev/ng-server-components.git']]])
               sh 'bash -c "cd ng-tadmin && rm -rf node_modules"'
               sh 'bash -c "cd ng-tadmin && npm install"'
               sh 'bash -c "cd ng-tadmin && npm install sonarqube-scanner"'
               sh 'bash -c "cd ng-tadmin &&  npm install jest"'
               sh 'bash -c "cd ng-tadmin && npm install jest-junit"'        
            }
        }
                
                
           stage('Sonar-ngtadmin') {
                
                steps {
              
        
           sh 'cd ng-tadmin &&  ./node_modules/sonarqube-scanner/dist/bin/sonar-scanner  -Dsonar.sources=. -Dsonar.projectKey=ng-tadmin -Dsonar.password=72b9cad2dacc1cde8dc1eed5df24d3cb4a761938  -Dsonar.host.url=http://10.8.201.78:9000/ -Dsonar.exclusions=**node_modules** -Dsonar.eslint.reportPaths=report.json'
           //sh 'sh sonartadmin.sh'
            
               
            }  
              
          }        
           stage('test-tadmin') {
            
           steps {
                sh 'bash -c "sh kill.sh"'
               sh 'bash -c "sh  run.sh"'
              
               
               
           }
}     
               stage('eslint-tadmin') {
           
           steps {
                sh  "sh eslist-tadmin.sh"
               
              
               
               
           }
}   
           

        stage('Build-tadmin') {
             
            steps {
               
              
                sh 'bash -c "sh build-tadmin.sh "'
                
            }
        }
        
       
    
     
     stage('Pre-ng') {
         
           steps {
               
               checkout([$class: 'GitSCM', branches: [[name: '*/ng-248']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ng-api-server']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'db5ece3a-688e-4261-aa2d-b3023985cb47', url: 'https://github.com/imanagedev/ng-api-server.git']]])
               checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ng-server-components']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'db5ece3a-688e-4261-aa2d-b3023985cb47', url: 'https://github.com/imanagedev/ng-server-components.git']]])
               checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ng-api-server/ng-server-components']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'db5ece3a-688e-4261-aa2d-b3023985cb47', url: 'https://github.com/imanagedev/ng-server-components.git']]])
               sh 'bash -c "cd ng-api-server && rm -rf node_modules"'
               sh 'bash -c "cd ng-api-server && npm install"'
               sh 'bash -c "cd ng-api-server && npm install sonarqube-scanner"'
               sh 'bash -c "cd ng-api-server &&  npm install jest"'
               
               
                
                
           }
}
           stage('sonar-ng-api') {

         
            steps {
                sh 'cd ng-api-server &&  ./node_modules/sonarqube-scanner/dist/bin/sonar-scanner  -Dsonar.sources=. -Dsonar.projectKey=ng-api -Dsonar.password=72b9cad2dacc1cde8dc1eed5df24d3cb4a761938  -Dsonar.host.url=http://10.8.201.78:9000/ -Dsonar.exclusions=**node_modules** -Dsonar.eslint.reportPaths=report.json'
            }  
           
           
} 
        stage('test-api') {
            
           steps {
                sh 'bash -c "sh kill.sh"'
               sh 'bash -c "sh  run-apt.sh"'
              sh 'bash -c "sh kill.sh"'
              
               
               
           }
} 
        
        
         stage('eslint-api') {
           
           steps {
                sh 'bash -c "cd ng-api-server && ./node_modules/.bin/eslint . -f checkstyle  > eslint.xml"'
               
              
               
               
           }
}    
           

        stage('build-ngapi') {
           
            steps {
               
                
                sh 'bash -c "sh build-api.sh "'
                
            }
        }
    }
        
        post {
            always {
                 archiveArtifacts artifacts: '*', defaultExcludes: false
                 recordIssues enabledForFailure: true, tools: [esLint(pattern: 'ng-tadmin/eslint.xml')]
                
           }
            
    }

       
}
