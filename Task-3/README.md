# Task 3 – Docker Compose with Nginx and Watchtower

## Objective

The objective of this task was to understand and implement Docker Compose for running an Nginx static website with separate development and production environments. Watchtower was also configured for automatic container updates.

## Workflow

Dockerfile → Docker Image → Docker Compose → Environment File → Container → Nginx Website → Watchtower

## Technologies Used

- AWS EC2
- Ubuntu
- Docker
- Docker Compose
- Nginx
- Watchtower
- AWS Security Groups

## Implementation

### 1. Verify Docker and Docker Compose

Docker was already installed on the EC2 instance and was verified using:

    docker --version

Docker Compose was initially not available, so Docker Compose V2 was installed:

    sudo apt update
    sudo apt install docker-compose-v2 -y

Verified the installation:

    docker compose version

### 2. Create Project Directory

Created a separate project directory:

    mkdir docker-compose-task3
    cd docker-compose-task3

Created the website directory:

    mkdir site

### 3. Create Static Website

Created `site/index.html` with a simple Nginx webpage.

The page was checked using:

    cat site/index.html

The website displayed:

    Hello from Docker Compose!
    Nginx static website is running successfully.

### 4. Create Dockerfile

Created a Dockerfile using the Nginx Alpine image.

The Dockerfile copied the website files into the Nginx web directory.

### 5. Configure Development Environment

Created `.env.dev` with:

    APP_ENV=development
    NGINX_PORT=8080

This configuration allowed the development environment to expose Nginx on port 8080.

### 6. Configure Production Environment

Created `.env.prod` with:

    APP_ENV=production
    NGINX_PORT=8081

This allowed the same application to run with a separate production configuration on port 8081.

### 7. Create Docker Compose Configuration

Created `docker-compose.yml` with an Nginx service.

The service was configured to:

- Build the image from the Dockerfile.
- Pass the `APP_ENV` environment variable.
- Map the configured host port to port 80 in the container.
- Restart automatically.

The main port configuration was:

    "${NGINX_PORT}:80"

### 8. Start the Development Environment

The Compose application was started using the development environment file:

    docker compose --env-file .env.dev up -d

The running containers were checked using:

    docker ps

### 9. Configure Production Environment

Checked the production Compose configuration:

    docker compose --env-file .env.prod config

The output confirmed:

    APP_ENV: production
    published: "8081"

This confirmed that the production environment was configured to use port 8081.

### 10. Add Watchtower

Watchtower was added to the Docker Compose configuration to monitor containers for updated images.

The initial image used was:

    containrrr/watchtower

After starting the service, the Watchtower container continuously restarted.

### 11. Troubleshoot Watchtower

Checked the Watchtower logs:

    docker logs docker-compose-task3-watchtower-1

The logs showed a Docker API compatibility error:

    client version 1.25 is too old
    Minimum supported API version is 1.44

The issue was caused by the Docker API version supported by the initial Watchtower image.

### 12. Fix Watchtower Compatibility

Stopped the Compose services:

    docker compose --env-file .env.prod down

Changed the Watchtower image from:

    containrrr/watchtower

to:

    nickfedor/watchtower

Pulled the updated image:

    docker compose --env-file .env.prod pull

The compatible Watchtower image was downloaded successfully.

### 13. Start and Verify Services

Started the services again:

    docker compose --env-file .env.prod up -d

Checked the containers:

    docker ps

Both the Nginx and Watchtower containers were running successfully.

### 14. Verify Watchtower

Checked the Watchtower logs:

    docker logs docker-compose-task3-watchtower-1

The logs showed:

    Watchtower 1.21.2 using Docker API v1.52

This confirmed that Watchtower was successfully communicating with the Docker daemon.

### 15. Final Verification

Tested the production application:

    curl http://localhost:8081

The expected HTML response was returned:

    Hello from Docker Compose!
    Nginx static website is running successfully.

This confirmed that the complete Docker Compose setup was working successfully.

## Screenshots

The Task 3 screenshots provide evidence of Docker Compose installation, environment configuration, Compose services, Watchtower troubleshooting, and final verification.

## Result

Successfully configured a Docker Compose application with Nginx, separate development and production environment files, and Watchtower. The Watchtower API compatibility issue was identified and fixed using a compatible image.

## What I Learned

- How Docker Compose manages multiple containers.
- How `.env` files can be used for different environments.
- How Docker port mapping works with Compose.
- How to configure an Nginx static website using Compose.
- How to troubleshoot Docker API compatibility issues.
- How Watchtower can be used to monitor containers for updated images.
