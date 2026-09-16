# Task 2 – Deploy AWS EC2 Using Terraform and Install Docker Automatically

## Objective

The objective of this task was to learn the basics of Terraform and use Infrastructure as Code (IaC) to:

- Create an EC2 instance using Terraform.
- Create and configure a Security Group.
- Allow SSH traffic on port 22.
- Allow HTTP traffic on port 80.
- Automatically install Docker using Terraform `user_data`.
- Run an Nginx container using Docker.
- Verify the deployed infrastructure.

## Technologies Used

- AWS EC2
- Terraform
- AWS CLI
- WSL Ubuntu
- Docker
- Nginx
- SSH

## Implementation

### 1. Checked AWS and Terraform Environment

Verified that AWS CLI and Terraform were available in the WSL Ubuntu environment.

```bash
aws --version
terraform --version
aws sts get-caller-identity
