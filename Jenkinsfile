pipeline {
    agent any

    stages {
        stage('First Job - Information') {
            steps {
                echo "------------ Information ------------"
                echo "end of stage information"
            }
        }

        stage('Second Job - Check if exist MyContainer') {
            steps {
                sh '''
                    if docker ps -a | grep -q 'my-container'; then
                        return 1 && echo "1"
                    else
                        return 0 && echo "0"
                    fi
                '''
            }
        }

        stage('3-deploy') {
            steps {
                echo "start stage Deploy"
                echo "------------ Deploy ------------"
                echo "end of stage deploy"
                sh 'pwd'
                sh 'ls -la'
            }
        }
    }
}
