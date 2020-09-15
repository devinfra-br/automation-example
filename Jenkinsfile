pipeline {
    agent {   
     docker {
        image 'wilton/php-ci:7.4'
        label 'pipeline'
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
}