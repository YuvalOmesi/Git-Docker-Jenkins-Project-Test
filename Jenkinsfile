pipeline {
    agent any
    parameters {
      choice choices: ['c.txt', 'py.txt', 'java.txt'], name: 'Choose_File'
    }

    stages {
        stage('First Job - Information') {
            steps {
                echo "------------ Information ------------"
                echo "this is your choice: ${params.Choose_File}"
                sh "docker ps -a"
                echo "------------ END Information ------------"
            }
        }

        stage('Second Job - Check if exist MyContainer') {
            steps {
                echo "------------ Second Job ------------"
                sh '''
                    docker ps -a
                    if docker ps -a | grep -q 'MyContainer'; then
                        echo "the container MyContainer exist"
                        echo "Goodbye"
                        exit 1
                    else
                        echo "not exist --> continue..."
                    fi
                '''
                echo "------------ END Second Job ------------"
            }
        }

        stage('3-run DockerFile') {
            steps {
            echo "------------ stage 3 - dockerfile ------------"
            sh '''
                docker build --build-arg MY_FILE=${params.MY_FILE} -t myimage .
                docker run -d --name MyContainer myimage
                docker ps -a
            '''
            echo "------------ END stage 3 - dockerfile ------------"
            }
        }
        stage('4-check docker again'){
            agent any
            steps{
                echo "------------ stage 4 - checking ------------"
                sh '''
                    docker ps -a
                '''
                echo "------------ END stage 4 - checking ------------"
            }
        }
        }
    }

