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

### 2. Install Docker

Updated the Ubuntu package list:

```bash
sudo apt update
