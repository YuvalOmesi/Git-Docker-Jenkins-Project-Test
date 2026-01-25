pipeline {
    agent { label 'only_master' }

    stages {
        stage('First Job - Information') {
            steps {
                echo "------------ Information ------------"
                echo "end of stage information"
            }
        }

        stage('Second Job - Check if exist MyContainer') {
            steps {
                script{ 
                    if sudo docker ps -a | grep -q 'my-container'; then
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
            }
        }
    }
}
