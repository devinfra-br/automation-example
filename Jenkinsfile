pipeline {
    agent none

    stages {
      stage('Application Testes') {
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

      // New Stage
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage("Publish") {
            parallel {
                stage('Pre-Release') {
                    when { expression { !params.RELEASE } }
                    steps {
                        echo "Teste"
                    }
                }
                stage("Release") {
                    when { expression { params.RELEASE } }
                    steps {
                        echo "Teste2"
                    }
                }
            }
        }

               stage("Deploy") {
            steps {
                script {
                    switch(params.DEPLOY_TO) {
                        case "INT": echo "./deploy.sh int"; break
                        case "PRE": echo "./deploy.sh pre"; break
                        case "PROD": echo "./deploy.sh prod"; break
                    }
                }
            }
        }
    }
    post { 
      always { 
        echo 'Testes Post Pipeline'
      }
    }
}
