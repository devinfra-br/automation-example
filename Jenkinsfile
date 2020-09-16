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
                echo 'Rename Env file'
                sh 'cp src/.env.example src/.env'
                echo 'Composer'
                sh 'composer install --working-dir=src'
                echo 'PHPUnit'
                sh 'src/vendor/bin/phpunit src/tests/'
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
