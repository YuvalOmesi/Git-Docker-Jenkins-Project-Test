pipeline {
    agent any

    stages {
        stage('First Job - Information') {
            steps {
                echo "------------ Information ------------"
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
            steps {
            echo "------------ stage 3 - dockerfile ------------"
            sh '''
                docker build -t myimage .
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

