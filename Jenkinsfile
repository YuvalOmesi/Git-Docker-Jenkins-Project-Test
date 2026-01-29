pipeline {
    agent any

    stages {
        stage('First Job - Information') {
            steps {
                echo "------------ Information ------------"
                sh 'whoami'
                sh 'ls -l /usr/bin/docker || echo "Docker not in /usr/bin"'
                sh 'command -v docker || echo "Docker command not found in PATH"'
                echo "end of stage information"
                sh "docker ps -a"
            }
        }

        stage('Second Job - Check if exist MyContainer') {
            steps {
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
            }
        }

        stage('3-run DockerFile') {
            agent {
                dockerfile {
                    filename 'Dockerfile'
                    dir '.'
                    //
                    args '--name MyContainer'
                }
            }
            steps {
                echo "start stage run docker file"
                echo "------------ DOCKER ------------"
                sh 'docker ps -a' 
                echo "end of stage DOCKER"
            }
        }
    }
}
