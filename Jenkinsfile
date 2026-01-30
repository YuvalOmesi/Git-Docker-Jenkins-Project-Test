pipeline {
    agent ubuntu2

    stages {
        stage('First Job - Information') {
            steps {
                echo "------------ Information ------------"
                sh 'whoami'
                
                sh 'ls -l /usr/bin/docker || echo "Docker not in /usr/bin"'
                sh 'command -v docker || echo "Docker command not found in PATH"'
                echo "end of stage information"
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
                        echo "exist"
                        echo "deleting..."
                        docker rm MyContainer
                        echo "deleting complete"
                        docker ps -a
                    else
                        echo "not exist"
                    fi
                '''
                echo "------------ END Second Job ------------"
            }
        }

        stage('3-run DockerFile') {
            echo "------------ stage 3 - dockerfile ------------"
            sh '''
                ls -la
                docker build -t myimage .
                docker run -d --name MyContainer myimage
                docker ps -a
            '''
            echo "------------ END stage 3 - dockerfile ------------"
            }
            
            steps {
                echo "------------ DOCKER1 ------------"
                }
            }
        stage('4-check docker again'){
            agent any
            steps{
                echo "------------ stage 4 - checking ------------"
                sh '''
                    whoami
                    echo $PATH
                    command -v docker
                    docker --version
                    docker ps -a
                '''
                echo "------------ END stage 4 - checking ------------"
            }
        }
        }
    }

