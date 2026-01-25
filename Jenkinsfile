pipeline {
    agent { label 'only_master' }

    stages {
        stage('First Job - Information') {
            steps {
                echo "------------ Information ------------"
                sh 'whoami'
                sh 'ls -l /usr/bin/docker || echo "Docker not in /usr/bin"'
                sh 'command -v docker || echo "Docker command not found in PATH"'
                echo "end of stage information"
            }
        }

        stage('Second Job - Check if exist MyContainer') {
            steps {
                script{ 
                    if sudo docker ps -a | grep -q 'MyContainer'; then
                        echo "exist"
                    else
                        echo "not exist"
                    fi
                }
            }
        }

        stage('3-deploy') {
            steps {
                echo "start stage Deploy"
                echo "------------ Deploy ------------"
                echo "end of stage deploy"
                sh 'pwd'
                sh 'ls -la'
                sh 'whoami'
            }
        }
    }
}
