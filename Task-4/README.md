# Task 4 – Automated Docker Deployment Using Ansible

## Objective

The objective of this task was to use Ansible for configuration management and automate the deployment of Docker on an AWS EC2 server.

The Ansible playbook was used to:

- Install Docker on the EC2 server.
- Pull the Nginx Docker image.
- Run the Nginx container automatically.
- Expose the application on port 80.

## Technologies Used

- AWS EC2
- Ubuntu
- WSL Ubuntu
- Ansible
- Docker
- Nginx
- MobaXterm
- SSH

## Architecture

```text
WSL Ubuntu (Ansible Controller)
          ↓ SSH
AWS EC2 Ubuntu Server
          ↓
        Docker
          ↓
   Nginx Container
          ↓
       Port 80
          ↓
     Web Browser
