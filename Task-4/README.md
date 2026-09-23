# Task 4 – Docker Deployment on AWS EC2 Using Ansible

## Objective

The objective of this task was to use Ansible for configuration management to automate the installation of Docker, pull the Nginx Docker image, and run the Nginx container on an AWS EC2 server.

## Workflow

WSL Ubuntu (Ansible Controller) → SSH → AWS EC2 Ubuntu Server → Docker → Nginx Container → Port 80 → Web Browser

## Technologies Used

- AWS EC2
- Ubuntu
- WSL Ubuntu
- Ansible
- Docker
- Nginx
- MobaXterm
- AWS Security Groups

## Implementation

### 1. Install and Verify Ansible

Ansible was installed on WSL Ubuntu and its installation was verified using:

    ansible --version

WSL Ubuntu was used as the Ansible controller.

### 2. Create Ansible Inventory

Created an inventory file to define the AWS EC2 server as the managed host.

The inventory contains the EC2 public IP, Ubuntu SSH user, and private key path.

Example structure:

    [servers]
    docker-server ansible_host=YOUR_EC2_PUBLIC_IP ansible_user=ubuntu ansible_ssh_private_key_file=/path/to/your/key.pem

### 3. Test Ansible Connectivity

Tested the connection between the Ansible controller and EC2 server using:

    ansible servers -m ping -i inventory

A successful `pong` response confirmed that Ansible could connect to the EC2 server through SSH.

### 4. Create Ansible Playbook

Created `docker-install.yml` to automate the Docker deployment.

The playbook was configured to:

- Update the package repository.
- Install Docker.
- Start the Docker service.
- Enable Docker to start automatically.
- Pull the Nginx Docker image.
- Run the Nginx container.
- Expose port 80.

### 5. Run the Playbook

Executed the Ansible playbook:

    ansible-playbook -i inventory docker-install.yml

The successful PLAY RECAP confirmed that the tasks completed without unreachable or failed hosts.

### 6. Verify Docker and Nginx

After the playbook completed, Docker was verified on the EC2 server.

Checked the Docker images:

    sudo docker images

Checked the running containers:

    sudo docker ps

The Nginx image was present and the Nginx container was running with port 80 mapped to the host.

### 7. Verify Application

Opened the EC2 public IP address in a web browser.

The Nginx Welcome page was displayed successfully, confirming that the application was reachable externally through port 80.

## Screenshots

The Task 4 screenshots provide evidence of:

- Ansible installation
- Ansible inventory
- Ansible ping/pong response
- Ansible playbook
- Successful playbook execution
- Docker image and container verification
- Nginx browser verification

## Result

The Ansible-based Docker deployment was successfully completed. Ansible connected to the AWS EC2 server, installed Docker, pulled the Nginx image, and automatically started the Nginx container. The application was successfully accessed through the EC2 public IP.

## What I Learned

- How Ansible is used for configuration management.
- How WSL can be used as an Ansible controller.
- How to create an Ansible inventory.
- How to test connectivity using the Ansible ping module.
- How Ansible playbooks automate server configuration.
- How to install and configure Docker using Ansible.
- How to deploy an Nginx container automatically.
- How configuration management reduces the need for manual server setup.
