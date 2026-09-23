# Task 1 – Docker Deployment on AWS EC2 using Nginx

## Objective

The objective of this task was to deploy and run an Nginx web server inside a Docker container on an AWS EC2 instance and access it through the EC2 public IP.

## Workflow

AWS EC2 → SSH → Install Docker → Start Docker → Test Docker → Pull Nginx Image → Run Container → Configure Security Group → Access Nginx in Browser

## Technologies Used

- AWS EC2
- Ubuntu
- Docker
- Nginx
- MobaXterm
- AWS Security Groups

## Implementation

### 1. Connect to EC2

Connected to the Ubuntu EC2 instance using SSH through MobaXterm.

### 2. Check Docker Installation

Checked whether Docker was already installed using:

    docker --version

Docker was not installed, so I proceeded with the installation.

### 3. Install Docker

Updated the Ubuntu package list:

    sudo apt update

Installed Docker:

    sudo apt install docker.io -y

### 4. Start Docker

Started the Docker service:

    sudo systemctl start docker

Checked the Docker service status to make sure it was running correctly.

### 5. Test Docker

Ran the Docker test container:

    sudo docker run hello-world

The successful `hello-world` output confirmed that Docker was installed and working correctly.

### 6. Run Nginx Container

Pulled and ran the Nginx image:

    sudo docker run -d -p 80:80 nginx

Docker automatically downloaded the `nginx:latest` image from Docker Hub and created a container.

Port 80 of the EC2 instance was mapped to port 80 inside the Docker container.

### 7. Verify Container

Checked the running container:

    sudo docker ps

The Nginx container was running successfully and port 80 was mapped from the EC2 instance to the container.

### 8. Configure Security Group

Added an HTTP inbound rule on port 80 in the AWS EC2 Security Group.

This allowed web traffic to reach the Nginx container running on the EC2 instance.

### 9. Test in Browser

Opened the EC2 public IP address in a web browser.

The Nginx Welcome page was displayed successfully, confirming that the Nginx container was accessible from outside the EC2 instance.

## Screenshots

The following screenshots provide evidence of the deployment and verification:

- `01-embedded.png`
- `02-embedded.png`
- `03-embedded.png`
- `04-embedded.png`

## Result

Successfully deployed Nginx inside a Docker container on AWS EC2 and accessed the Nginx web page through the EC2 public IP.

## What I Learned

- How to deploy an application using Docker on AWS EC2.
- How to install and start Docker on Ubuntu.
- The difference between a Docker image and a Docker container.
- How Docker pulls images from Docker Hub.
- Docker port mapping using `-p 80:80`.
- Why port 80 needs to be allowed in the AWS Security Group.
- How to verify running containers using `docker ps`.
- How a containerized web application can be accessed through the EC2 public IP.
