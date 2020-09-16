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
                sh 'cp src/.env.example src/.env'
                sh 'composer install --working-dir=src'
                sh 'src/vendor/bin/phpunit src/.'
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
