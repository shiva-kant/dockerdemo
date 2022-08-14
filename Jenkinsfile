pipeline {
  agent 'any'
   tools {
        maven 'MAVEN_HOME'
    }
stages {

   stage('Git Clone'){
       steps {

              echo 'Clonning Start'

              git url: 'https://github.com/shiva-kant/dockerdemo.git'

              echo 'Clonning Done'
              }
          }

   stage('MAVEN TASK'){
         steps {
            echo 'MAVEN Start....................'

            sh 'mvn -f HelloCICDIMAGE/pom.xml clean package'
            
            
            
            echo 'MAVEN Done.........................'
               }

         }
 
        stage ('Copying file') {
            steps {
               echo '##################copy start############'
                sh("cp -R /Users/shiva/.jenkins/workspace/${env.JOB_NAME}/HelloCICDIMAGE/target/*.jar /Users/shiva/.jenkins/workspace/${env.JOB_NAME}")
              sh("cp -R /Users/shiva/.jenkins/workspace/${env.JOB_NAME}/HelloCICDIMAGE/Dockerfile /Users/shiva/.jenkins/workspace/${env.JOB_NAME}/ ")
              echo   'copy ###########FINIshed###############'
            }
        }
   stage('DOCKER TASK'){
         steps {
            echo 'DOCKER Start....................'

              sh "docker build  -t myimage2 . "
              sh "docker run -d -p 80${env.BUILD_NUMBER}:1234 myimage2"
              
            echo 'DOCKER Done.........................'
               }

         }
  stage('ECR LOGIN AND PUSH'){
         steps {
            echo 'ECR LOGIN Start....................'
sh "aws ecr get-login-password --region us-eat-1 | docker login --username AWS --password-stdin 563442890870.dkr.ecr.us-east-1.amazonaws.com/hello"
sh "docker tag image_name 563442890870.dkr.ecr.us-east-1.amazonaws.com/hello:ecrtag"
sh "docker push 563442890870.dkr.ecr.us-east-1.amazonaws.com/hello:ecrtag"
              
            echo 'ECR PUSH DONE.........................'
               }

         }
}

}
