pipeline {
    agent any
    environment{
        DOCKEREXSIST='false'
        START = sh(script: "date +%s", returnStdout: true).trim()
        
    }
    parameters {
      choice choices: ['c.txt', 'py.txt', 'java.txt'], name: 'Choose_File'
      string (name: 'MAILTO', defaultValue: 'yuval.study42@gmail.com', description: 'Enter your email for recive job results')
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
    success {
        script{

                def END = sh(script: "date +%s", returnStdout: true).trim()

                def DURATION = sh(script: END.toInteger() - env.START.toInteger())

                emailext(
                    subject: "✅ Jenkins Job Successful",
                    to: "${env.MAILTO}",
                    mimeType: 'text/html',
                    body: """
                    <div style="border:2px solid #4CAF50; padding:20px; border-radius:10px; background-color:#f9f9f9; font-family:Arial;">
                        <h2 style="color:#4CAF50;">Jenkins Test Successful!</h2>
                        <p><b>Build Number:</b> ${env.BUILD_NUMBER}</p>
                        <p><b>Job Name:</b> ${env.JOB_NAME}</p>
                        <p><b>User Chosen File Name: </b>${env.Choose_File}</p>
                        <p><b>Total duration:</b> ${currentBuild.durationString}</p>
                        <p><b>Total duration:</b> ${DURATION}</p>
                        <p><b>Status:</b> <strong style="color:green;">SUCCESS</strong></p>
                    </div>
                    """
                )
        }
    }
    failure {
        script{
                emailext(
                    subject: "❌ Jenkins Job failure",
                    to: "${env.MAILTO}",
                    mimeType: 'text/html',
                    body: """
                    <div style="border:2px solid #FF0000; padding:20px; border-radius:10px; background-color:#f9f9f9; font-family:Arial;">
                        <h2 style="color:#FF0000;">Jenkins Test Failure!</h2>
                        <p><b>Build Number:</b> ${env.BUILD_NUMBER}</p>
                        <p><b>Job Name:</b> ${env.JOB_NAME}</p>
                        <p><b>Total duration:</b> ${currentBuild.durationString}</p>
                        <p><b>Status:</b> <strong style="color:red;">FAILURE</strong></p>
                    </div>
                    """
                    )
                }
            }
        }
    }
