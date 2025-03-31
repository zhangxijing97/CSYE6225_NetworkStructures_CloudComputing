provider "aws" {
  region = "us-east-1"  # Change if needed
}

# IAM Role for EC2 Instance
resource "aws_iam_role" "ec2_role" {
  name = "xijing_ec2_role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

# Attach Amazon S3 ReadOnly Access Policy
resource "aws_iam_policy_attachment" "s3_readonly" {
  name       = "s3_readonly_attachment"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# Create Instance Profile for EC2
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "xijing_ec2_profile"
  role = aws_iam_role.ec2_role.name
}

# Fetch Latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

# Security Group for Web Server
resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Allow HTTP access"

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

# EC2 Instance Setup
resource "aws_instance" "web_server" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = var.instance_name
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y nginx
              echo "<h1>Hello, my name is ${var.username}</h1>" > 
/var/www/html/index.html
              sudo systemctl restart nginx
              EOF
}

