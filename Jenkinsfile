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
          stage('Wait for user to input text?') {
    steps {
            script {
            // Define Variable
             def USER_INPUT = input(
                    message: 'User input required - Some Yes or No question?',
                    parameters: [
                            [$class: 'ChoiceParameterDefinition',
                             choices: ['no','yes'].join('\n'),
                             name: 'input',
                             description: 'Menu - select box option']
                    ])

            echo "The answer is: ${USER_INPUT}"

            if( "${USER_INPUT}" == "yes"){
                //do something
            } else {
                //do something else
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
