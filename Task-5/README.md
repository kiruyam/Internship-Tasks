# Task 5 – Jenkins Pipeline with Docker and Docker Hub

## Objective

The objective of this task was to configure a Jenkins Declarative Pipeline that pulls application code from a GitHub repository, builds a Docker image, and pushes the Docker image to Docker Hub.

## Technologies Used

- AWS EC2
- Ubuntu
- Jenkins
- Java 21
- Git
- Docker
- Docker Hub
- GitHub
- Nginx

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
Jenkins Pipeline
   ↓
Build Docker Image
   ↓
Docker Hub
