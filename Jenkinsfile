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
      stage('Ambiente Deploy') {
    steps {
            script {
            // Define Variable
             def USER_INPUT = input(
                    message: 'Escolha o ambiente para realizar o deploy',
                    parameters: [
                            [$class: 'ChoiceParameterDefinition',
                             choices: ['TEST', 'QA','PROD'].join('\n'),
                             name: 'input',
                             description: 'Ambiente de test']
                    ])

            echo "Você escolheu o deploy: ${USER_INPUT}"

            if( "${USER_INPUT}" == "TEST"){
              parallel {
                stage('Deploy QA') {
                    when {
                      expression { ENV == "TEST" }
                    }
                    steps {
                        echo 'Deploy Ambiente Test'
                    }
                 } 
                }
            } else {
                            parallel {
                stage('parallel stage 1') {
                    when {
                      expression { ENV == "something" }
                    }
                    steps {
                        echo 'something'
                    }
                }
            }
        }

    }
}
        stage('Ambiente de Deploy') {
            input {
                message "Para continuar o pipe você precisa me dizer em qual ambiente será o deploy?"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Aceite para continuar?')
                }
            }
            steps {
                echo "Hello, ${PERSON}, nice to meet you."
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
    post { 
      always { 
        echo 'Testes Post Pipeline'
      }
    }
}
