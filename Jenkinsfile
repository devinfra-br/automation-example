pipeline {
    agent none
  
    stages {
        stage('Composer install') {
         // Image Docker   
          agent { 
            docker {
              label 'master'  // both label and image
              image 'wilton/php-ci:7.4'
            }  
          }
          environment { 
            GIT-GRYPT-KEY="CF5D531E52DC98269C6B32AEBFDBC02BC279AD31" 
          } 
          // Commands Execute
          steps {
                sh 'apk update && apk add git-crypt'
                sh 'git-crypt unlock -k $GIT-GRYPT-KEY'
                sh 'composer install --working-dir=src'
                sh 'cat .env'
            }
        }

        // New Stage
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
