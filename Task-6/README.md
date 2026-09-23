# Task 6 – GitHub and Jenkins Webhook Integration

## Objective

The objective of this task was to connect a GitHub repository with Jenkins using a webhook and automatically trigger the Jenkins pipeline whenever code was pushed to the main branch.

## Workflow

AWS EC2 → Install Java → Install Docker → Install Jenkins → GitHub Repository → SSH Configuration → Jenkins Pipeline → GitHub Webhook → Push Code → Automatically Trigger Jenkins → Run Pipeline

## Technologies Used

- AWS EC2
- Ubuntu
- Java 21
- Docker
- Jenkins
- Git
- GitHub
- GitHub Webhooks
- MobaXterm

## Implementation

### 1. Create and Prepare EC2

Created a new Ubuntu EC2 instance and connected to it using SSH through MobaXterm.

### 2. Install Java

Installed Java 21:

    sudo apt update
    sudo apt install openjdk-21-jdk -y

Verified the installation:

    java -version
    javac -version

### 3. Install Docker

Installed Docker:

    sudo apt install docker.io -y

Started and enabled the Docker service:

    sudo systemctl start docker
    sudo systemctl enable docker

### 4. Install Jenkins

Installed Jenkins LTS and started the Jenkins service.

Jenkins was accessed through port 8080.

### 5. Create and Configure GitHub Repository

Created the GitHub repository for the webhook task and added a simple `index.html` file for testing the pipeline.

The final internship repository uses the Task-6 files inside the combined `Internship-Tasks` repository.

### 6. Configure GitHub SSH Authentication

Generated an SSH key on the EC2 instance:

    ssh-keygen -t ed25519

Added the public key to GitHub and tested the connection:

    ssh -T git@github.com

The SSH connection was successfully authenticated.

### 7. Create Jenkins Pipeline

Created a Jenkins Pipeline job for the Task 6 project.

The pipeline contains the following stages:

- Checkout – Retrieves the code from GitHub.
- Build – Runs the build stage.
- Test – Verifies that `Task-6/index.html` exists.
- Success – Confirms that the pipeline completed successfully.

The pipeline output showed:

    Finished: SUCCESS

### 8. Configure Jenkins Webhook Trigger

Enabled the Jenkins build trigger:

    GitHub hook trigger for GITScm polling

This allows Jenkins to receive notifications when changes are pushed to GitHub.

### 9. Configure GitHub Webhook

Created a webhook in the GitHub repository.

The webhook was configured to:

- Use the Jenkins `/github-webhook/` endpoint.
- Send JSON payloads.
- Trigger on push events.
- Remain active.

### 10. Test Webhook

Made a change to the Task 6 `index.html` file and committed the change to the `main` branch.

GitHub recorded the webhook delivery successfully.

The push event automatically triggered the Jenkins job.

### 11. Verify Jenkins Pipeline

Jenkins automatically started the pipeline after the GitHub push.

The pipeline completed:

    Checkout
    Build
    Test
    Success

The final console output showed:

    Pipeline completed successfully!
    Finished: SUCCESS

The Jenkins job page also showed the successful build.

## Screenshots

The Task 6 screenshots provide evidence of:

- Java installation
- Git installation
- Docker installation
- Jenkins running
- Jenkins Docker access
- Jenkins dashboard
- Webhook trigger configuration
- Webhook creation
- Successful GitHub push delivery
- Jenkins console output
- Successful Jenkins build

## Result

Successfully configured GitHub and Jenkins webhook integration. A push to the `main` branch successfully communicated with Jenkins and automatically triggered the Jenkins pipeline, which completed successfully.

## What I Learned

- How GitHub and Jenkins can be connected using webhooks.
- How a GitHub push can trigger a Jenkins job.
- How to install and configure Jenkins on AWS EC2.
- How to create and run a Jenkins Pipeline.
- The purpose of different stages in a Jenkins pipeline.
- How SSH authentication can be configured between EC2 and GitHub.
- How GitHub webhooks send notifications to Jenkins.
- How to configure and test a GitHub webhook.
- How to verify successful webhook deliveries.
- The basic workflow of GitHub → Webhook → Jenkins → Pipeline.
