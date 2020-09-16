pipeline {
    agent none
  
    stages {
        stage('Teste_PP') {
            agent { docker {
         label 'master'  // both label and image
          image 'wilton/php-ci:7.4'
       }   } 
            steps {
                sh 'cd src'
                sh 'ls -lsa'
                sh 'composer install'
                sh 'cat .env'
            }
        }
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
