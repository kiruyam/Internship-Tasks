# Task 6 – GitHub and Jenkins Webhook Integration

## Objective

The objective of this task was to connect a GitHub repository with Jenkins using a webhook and automatically trigger the Jenkins job whenever code is pushed to the `main` branch.

## Technologies Used

- AWS EC2
- Ubuntu
- Java 21
- Docker
- Jenkins
- GitHub
- Git
- SSH
- Jenkins Pipeline
- GitHub Webhooks

## Workflow

```text
AWS EC2
   ↓
Java
   ↓
Docker
   ↓
Jenkins
   ↓
GitHub Repository
   ↓
SSH Authentication
   ↓
Jenkins Pipeline
   ↓
GitHub Webhook
   ↓
Git Push
   ↓
Jenkins Pipeline Trigger
