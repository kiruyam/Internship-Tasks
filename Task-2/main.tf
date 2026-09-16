provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "ec2_sg" {
  name = "terraform-ec2-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami           = "YOUR_UBUNTU_AMI_ID"
  instance_type = "t2.micro"
  key_name      = "testserver"

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              systemctl enable docker
              systemctl start docker
              usermod -aG docker ubuntu
              docker run -d -p 80:80 nginx
              EOF

  tags = {
    Name = "Terraform-Docker-EC2"
  }
}
