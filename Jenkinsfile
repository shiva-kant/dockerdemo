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
                sh("cp -R /Users/shiva/.jenkins/workspace/dockerpipeline/HelloCICDIMAGE/target/*.jar /Users/shiva/.jenkins/workspace/dockerpipeline")
              sh("cp -R /Users/shiva/.jenkins/workspace/dockerpipeline/HelloCICDIMAGE/Dockerfile /Users/shiva/.jenkins/workspace/dockerpipeline ")
              echo   'copy ###########FINIshed###############'
            }
        }
   stage('DOCKER TASK'){
         steps {
            echo 'DOCKER Start....................'

              sh "docker build  -t myimage:1 . "
              sh "docker run -d -p 8085:1234 myimage:1"
              
            echo 'DOCKER Done.........................'
               }

         }
  stage('DOCKER LOGIN AND PUSH'){
         steps {
            echo 'DOCKER LOGIN Start....................'
              sh "docker tag myimage:1 shivakant/myimage2:thirdtag"
              sh "docker login -u shivakant -p shiva@docker123"
              sh "docker push shivakant/myimage2"
              
            echo 'DOCKER PUSH DONE.........................'
               }

         }
}

}
