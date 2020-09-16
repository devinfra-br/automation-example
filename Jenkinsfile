pipeline {
    agent { label 'master' }  

    stages {
        stage('Teste_PP') {
             agent {
                docker {
                  label 'master'  // both label and image
                  image 'wilton/php-ci:7.4'
                }
            }
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
}