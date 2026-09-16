# Task 3 – Docker Compose with Development and Production Environments

## Objective

The objective of this task was to understand and implement Docker Compose for running an Nginx static website with separate development and production environments.

Watchtower was also configured for automatic container updates.

## Technologies Used

- AWS EC2
- Ubuntu
- Docker
- Docker Compose
- Nginx
- Watchtower
- AWS Security Groups

## Workflow

Dockerfile → Docker Image → Docker Compose → Environment File → Container → Nginx Website

## Implementation

### 1. Docker Compose Setup

Docker was already installed on the EC2 instance.

Docker Compose was installed using:

```bash
sudo apt update
sudo apt install docker-compose-v2 -y
