# Task 2 – AWS EC2 Deployment Using Terraform

## Objective

The objective of this task was to learn the basics of Terraform and use Infrastructure as Code (IaC) to create an AWS EC2 instance, configure its Security Group, install Docker automatically, and run an Nginx container.

## Workflow

AWS CLI → Terraform Configuration → Security Group → EC2 Instance → user_data → Docker → Nginx Container → Verification

## Technologies Used

- AWS EC2
- Ubuntu
- Terraform
- AWS CLI
- Docker
- Nginx
- AWS Security Groups
- WSL Ubuntu

## Implementation

### 1. Check AWS and Terraform Environment

Verified that AWS CLI and Terraform were available in the WSL Ubuntu environment:

    aws --version
    terraform --version
    aws sts get-caller-identity

The AWS identity verification confirmed that the AWS environment was configured correctly.

### 2. Create Terraform Project

Created a separate Terraform project directory:

    mkdir ~/terraform-ec2
    cd ~/terraform-ec2

Created the Terraform configuration file:

    touch main.tf

### 3. Configure Security Group

Configured a Security Group in Terraform to allow the required inbound traffic.

The Security Group allowed:

- SSH traffic on port 22
- HTTP traffic on port 80

Outbound traffic was also allowed.

### 4. Configure EC2 Instance

Configured Terraform to create an Ubuntu EC2 instance with:

- Instance type: t2.micro
- Region: ap-south-1
- Key pair: testserver
- Name: Terraform-Docker-EC2

The EC2 instance was associated with the Terraform-created Security Group.

### 5. Install Docker Using user_data

Used Terraform `user_data` to automatically install Docker when the EC2 instance started.

The installation included:

    apt-get update -y
    apt-get install -y docker.io
    systemctl enable docker
    systemctl start docker

This allowed Docker to be configured automatically without manually installing it after connecting to the instance.

### 6. Initialize Terraform

Initialized the Terraform project:

    terraform init

Terraform downloaded the required provider and prepared the working directory.

### 7. Validate the Configuration

Checked the Terraform configuration for syntax and configuration errors:

    terraform validate

The configuration was successfully validated.

### 8. Review and Apply the Infrastructure

Created a Terraform execution plan:

    terraform plan

After reviewing the planned resources, applied the configuration:

    terraform apply

The Terraform configuration created the required AWS resources.

### 9. Verify EC2 and Docker

Connected to the created EC2 instance using SSH and verified the Docker installation.

Docker was checked using:

    docker --version

The Nginx container was then verified using:

    sudo docker ps

### 10. Verify Nginx

The Nginx container was configured to run on port 80.

After allowing HTTP traffic through the Security Group, the EC2 public IP was opened in a browser.

The Nginx page confirmed that the Terraform-created infrastructure and Docker deployment were working.

## Screenshots

The Task 2 screenshots provide evidence of the Terraform configuration, AWS resources, execution, Docker setup, and deployment verification.

## Result

Successfully used Terraform to create an AWS EC2 infrastructure with a Security Group, automatically installed Docker using `user_data`, and verified the Nginx deployment.

## What I Learned

- Basics of Infrastructure as Code using Terraform.
- How Terraform can create AWS resources.
- How to configure AWS Security Groups using Terraform.
- How `terraform init`, `validate`, `plan`, and `apply` are used.
- How Terraform `user_data` can automate software installation.
- How Docker can be installed automatically on an EC2 instance.
- How Terraform can be used together with AWS and Docker for deployment.
