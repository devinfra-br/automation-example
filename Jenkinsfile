pipeline {
    agent none
    stages {
        stage('Composer install') {
         // Image Docker   
          agent { 
            docker {
              label 'master'  // both label and image
              image 'wilton/php74-ci:v1'
              args '-u root:root'
            }  
          }
          // Commands Execute
          steps {
                //sh 'gpg --import-ownertrust iac/key/git-crypt.txt'
                sh 'git-crypt unlock'
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
