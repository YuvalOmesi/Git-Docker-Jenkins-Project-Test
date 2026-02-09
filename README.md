# Git-Docker-Jenkins-Project-Test

Hello Dima. 

This is my Jenkins-Docker-Git project. 

As you suggested, extra steps are allowed and welcome, so I built the pipeline like this:

The pipeline includes five stages.

1) General Info - Shows basic information about the job and the selected options.

2) Check if MyContainer Exists - Checks whether a Docker container named MyContainer already exists.

3) Run Dockerfile - Builds and runs the Docker image using the Dockerfile.

4) Docker Check - Runs docker ps -a as an extra check to verify the container status.

5) Post Actions (Success / Failure) - An email is sent with details about the job and the selected file.
    
Additional points:
* Before the job starts, the user is asked to choose a file type (C / Java / Python).
* The user can also enter an email address to receive the results.
* Total Duration - show the job runtime up until the post stage.

         