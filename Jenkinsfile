pipeline {
    agent any

    stages {
        stage('1-build') {
            steps {
                echo "start build 1"
                echo "------------ building ------------"
                echo "end of stage build"
            }
        }

        stage('2-Test') {
            steps {
                echo "start stage 2 Test"
                echo "------------ Testing ------------"
                echo "end of stage Test"
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
