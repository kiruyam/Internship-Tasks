# Task 5 – Jenkins Pipeline with Docker and Docker Hub

## Objective

The objective of this task was to configure a Jenkins Declarative Pipeline that retrieves application code from GitHub, builds a Docker image, and pushes the image to Docker Hub.

## Workflow

AWS EC2 → Install Java → Install Git → Install Docker → Install Jenkins → GitHub Repository → Jenkins Pipeline → Docker Access → Docker Hub Credentials → Build Image → Push Image

## Technologies Used

- AWS EC2
- Ubuntu
- Java 21
- Git
- Jenkins
- Docker
- GitHub
- Docker Hub
- MobaXterm

## Implementation

### 1. Create and Prepare EC2

Created a new Ubuntu EC2 instance and connected to it using SSH through MobaXterm.

Updated the package lists:

    sudo apt update

### 2. Install Java

Installed Java 21 required for Jenkins:

    sudo apt install -y fontconfig openjdk-21-jre

Verified the installation:

    java -version

### 3. Install Git

Installed Git:

    sudo apt install -y git

Verified the installation:

    git --version

### 4. Install Docker

Installed Docker:

    sudo apt install -y docker.io

Started and enabled Docker:

    sudo systemctl enable --now docker

Verified the installation:

    docker --version

### 5. Install Jenkins

Installed Jenkins LTS and started the Jenkins service:

    sudo systemctl enable jenkins
    sudo systemctl start jenkins

Verified the service:

    sudo systemctl status jenkins

Jenkins was accessed through port 8080.

The Jenkins version used was 2.568.3.

### 6. Configure Jenkins Docker Access

Added the Jenkins user to the Docker group:

    sudo usermod -aG docker jenkins

Restarted Jenkins:

    sudo systemctl restart jenkins

Verified Docker access for Jenkins:

    sudo -u jenkins docker ps

Also verified the Jenkins groups:

    groups jenkins

The output confirmed that Jenkins belonged to the Docker group.

### 7. Configure Jenkins Pipeline

Created the Jenkins Pipeline job and configured it to use the GitHub repository.

The pipeline used:

- Definition: Pipeline script from SCM
- SCM: Git
- Branch: */main
- Script Path: Task-5/Jenkinsfile

The pipeline stages were:

- Clone Repository
- Build Docker Image
- Push to Docker Hub
- Post Actions

### 8. Configure Docker Hub Credentials

Created Docker Hub credentials in Jenkins using:

- Kind: Username with password
- Username: mayuriii12
- ID: dockerhub-credentials

A Docker Hub Personal Access Token was used as the password and stored securely in Jenkins.

### 9. Configure Docker Hub Image

The Jenkins pipeline was configured to use the Docker Hub repository:

    mayuriii12/jenkins-docker-task

The pipeline creates:

    mayuriii12/jenkins-docker-task:BUILD_NUMBER
    mayuriii12/jenkins-docker-task:latest

### 10. Build Docker Image

The Jenkins pipeline pulled the code from GitHub and built the Docker image.

The Dockerfile used the Nginx Alpine image and copied `index.html` into the Nginx web directory.

The image was built using the Jenkins build number and also tagged as `latest`.

### 11. Push Image to Docker Hub

Jenkins securely retrieved the stored credentials and logged in to Docker Hub.

The authentication output showed:

    Login Succeeded

The pipeline then pushed both the build-number image and the `latest` image to Docker Hub.

Finally, Jenkins logged out of Docker Hub.

### 12. Test Jenkins Pipeline

The pipeline completed the following stages successfully:

- Clone Repository
- Build Docker Image
- Push to Docker Hub

The console output showed:

    Pipeline completed successfully!
    Finished: SUCCESS

The Docker image was visible in the Docker Hub repository.

## Screenshots

The Task 5 screenshots provide evidence of Java, Git, Docker, Jenkins, Jenkins Docker access, the Jenkins dashboard, successful pipeline execution, console output, and the Docker Hub image.

## Result

Successfully configured and tested a Jenkins Declarative Pipeline that retrieves code from GitHub, builds a Docker image, authenticates with Docker Hub using Jenkins credentials, and pushes the image to the Docker Hub repository:

    mayuriii12/jenkins-docker-task

The Jenkins pipeline completed successfully with:

    Finished: SUCCESS

## What I Learned

- How Jenkins integrates with GitHub repositories.
- How to create a Declarative Jenkins Pipeline.
- How Jenkins can retrieve source code from GitHub.
- How Jenkins can execute Docker commands.
- How to give Jenkins access to Docker.
- How to build and tag Docker images through Jenkins.
- How to configure Docker Hub credentials securely.
- How to use a Personal Access Token for Docker Hub authentication.
- How Jenkins can push Docker images to Docker Hub.
- The basic CI/CD workflow of GitHub → Jenkins → Docker → Docker Hub.
