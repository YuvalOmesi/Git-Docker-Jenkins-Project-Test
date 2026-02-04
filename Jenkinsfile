pipeline {
    agent any
    environment{
        docker_exist = 'false'
    }
    parameters {
      choice choices: ['c.txt', 'py.txt', 'java.txt'], name: 'Choose_File'
    }

    stages {
        stage('First Job - Information') {
            steps {
                echo "------------ Information ------------"
                echo "this is your choice: ${params.Choose_File}"
                echo "this is build number: ${BUILD_NUMBER}"
                echo "this is build id: ${BUILD_ID}"
                echo "this is JOB NAME: ${JOB_NAME}"
                echo "this is JOB NAME: ${JOB_NAME}"
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
                        ${docker_exist}='true'
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
            sh """
                docker build --build-arg TESTWORD=${params.Choose_File} -t myimage .
                docker run -d --name MyContainer myimage
                docker ps -a
            """
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
    post {
    always {
        script{
            if (env.docker_exist=='true'){
                echo "post always is run"
            }
        }
    }
    success {
        echo "Total duration: ${currentBuild.durationString}"
            }
        }
    }
