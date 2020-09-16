pipeline {
    agent {
       docker {
         label 'master'  // both label and image
          image 'wilton/php-ci:7.4'
       }  
    }
    stages {
        stage('Teste_PP') {
             
            
            steps {
                sh 'ls -lsa'
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
