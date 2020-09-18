pipeline {
    agent none
    stages {
        stage('Compile App') {
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

            }
        }
        
        // New Stage Stack Tests
        stage("Test Stack") {
            parallel {
                stage('Unit') {
                    steps {
                        echo "Teste Unitário Aqui - PHPUnit"
                        sh 'src/vendor/bin/phpunit src/tests/'
                    }
                }
                stage("Integration") {
                    when {
                        expression {
                            return env.BRANCH_NAME != 'master';
                        }
                    }
                    steps {
                        echo "Testes de Integração Aqui"
                    }
                }
                stage("System") {
                    steps {
                        echo "Testes do Sistema Aqui"
                    }
                }
                stage("Acceptance") {
                    when {
                        expression {
                            return env.BRANCH_NAME != 'master';
                        }
                    }
                    steps {
                        echo "Testes de Aceitação Aqui"
                    }
                }
                stage("Security") {
                    steps {
                        echo "Testes de Segurança Aqui"
                    }
                }
                stage("Performance") {
                    steps {
                        echo "Testes de Perfomance Aqui"
                    }
                }  
                stage("Regression") {
                    when {
                        expression {
                            return env.BRANCH_NAME != 'master';
                        }
                    }
                    steps {
                        echo "Testes de Regressão Aqui"
                    }
                }                                              
            }
        }
      
        // New Stage Build Docker Image
        stage('Build Image') {
            steps {
                echo 'Buildar image docker + tag build'
                sh 'docker build -t wilton/app-name:$BUILD_ID'
            }
        }

        // New Stage Push Image Docker Repository
        stage('Push Image') {
            steps {
                echo 'Enviar imagem docker + tag build'
            }
        }

        // New Stage Generate Tag repository
        stage('Git Tag App') {
            steps {
                echo 'Gerar tag do repositório git'
            }
        }
        // New Stage Push Image Docker Repository
        stage("Deploy") {
            // Start parallel jos but contition true
            parallel {
                stage('Prod Deploy') {
                    when {
                        expression {
                            return env.BRANCH_NAME != 'master';
                        }
                    }
                    steps {
                        echo 'Deploy Env Prod'
                    }
                }
                stage('Dev Deploy') {
                    when {
                        expression {
                            return env.BRANCH_NAME != 'dev';
                        }
                    }
                    steps {
                        echo 'Deploy Env Dev'
                    }
                }
            }
        }
    }
}