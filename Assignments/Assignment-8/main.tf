##############################################
# main.tf
##############################################

##############################################
# 1) VPC and Subnets
##############################################
resource "aws_vpc" "webapp_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "webapp-vpc"
  }
}

# Public subnets
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.webapp_vpc.id
  cidr_block             = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.webapp_vpc.id
  cidr_block             = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "public3" {
  vpc_id                  = aws_vpc.webapp_vpc.id
  cidr_block             = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-3"
  }
}

# Private subnets
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.webapp_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.webapp_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet-2"
  }
}

##############################################
# 2) Internet Gateway and Route Tables
##############################################
resource "aws_internet_gateway" "webapp_igw" {
  vpc_id = aws_vpc.webapp_vpc.id
  tags = {
    Name = "webapp-igw"
  }
}

# Public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.webapp_vpc.id
  tags = {
    Name = "public-route-table"
  }
}

# Route for internet access in public route table
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.webapp_igw.id
}

# Associate public subnets with public route table
resource "aws_route_table_association" "public_rt_assoc1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_assoc2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_assoc3" {
  subnet_id      = aws_subnet.public3.id
  route_table_id = aws_route_table.public_rt.id
}

# Private route table (no internet route is added here)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.webapp_vpc.id
  tags = {
    Name = "private-route-table"
  }
}

# Associate private subnets with private route table
resource "aws_route_table_association" "private_rt_assoc1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_assoc2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_rt.id
}

##############################################
# 3) Security Groups
##############################################

# ALB Security Group
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security group for Application Load Balancer"
  vpc_id      = aws_vpc.webapp_vpc.id

  ingress {
    description      = "Allow HTTP from anywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}

# EC2 Security Group (webapp server)
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-webapp-sg"
  description = "SG for EC2 instances running the web app"
  vpc_id      = aws_vpc.webapp_vpc.id

  # Inbound rule: allow port 8080 only from the ALB security group
  ingress {
    description     = "Allow HTTP on port 8080 from ALB"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-webapp-sg"
  }
}

# RDS Security Group
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.webapp_vpc.id

  # Allow inbound from EC2 SG on the PostgreSQL port 5432
  ingress {
    description     = "Allow Postgres from EC2 SG"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}

##############################################
# 4) RDS: Subnet Group, Parameter Group, and DB Instance
##############################################
resource "aws_db_subnet_group" "webapp_db_subnet_group" {
  name       = "webapp-db-subnet-group"
  subnet_ids = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]
  tags = {
    Name = "webapp-db-subnet-group"
  }
}

resource "aws_db_parameter_group" "webapp_db_parameter_group" {
  name        = "webapp-pg16"
  family      = "postgres16"
  description = "Custom parameter group for Postgres 16"

  parameter {
    name  = "rds.force_ssl"
    value = "0"
  }
}

resource "aws_db_instance" "webapp_rds" {
  identifier             = "webapp-postgres-db"
  engine                 = "postgres"
  engine_version         = "16"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.webapp_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = aws_db_parameter_group.webapp_db_parameter_group.name
  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = {
    Name = "webapp-rds"
  }
}

##############################################
# 5) Launch Template (User Data)
##############################################

# We remove the data "aws_ami" block and hard-code the AMI ID:
# (Be sure this AMI is valid in your region.)
locals {
  user_data = <<-EOT
    #!/bin/bash
    set -xe

    # Create environment file
    sudo mkdir -p /usr/bin/csye6225
    cat <<EOF | sudo tee /usr/bin/csye6225/.env
    DB_HOST=${aws_db_instance.webapp_rds.address}
    DB_PORT=5432
    DB_USERNAME=${var.db_username}
    DB_PASSWORD=${var.db_password}
    DB_NAME=${var.db_name}
    EOF

    # Secure environment file
    sudo chmod 600 /usr/bin/csye6225/.env
    sudo chown csye6225:csye6225 /usr/bin/csye6225/.env

    # Start the webapp service (already installed in the AMI)
    sudo systemctl enable webapp.service
    sudo systemctl start webapp.service
  EOT
}

resource "aws_launch_template" "webapp_lt" {
  name_prefix   = "webapp-lt-"
  # Hard-coded AMI ID:
  image_id      = "ami-03a6c16a66bbe0a7a"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  # Convert the local.user_data to base64
  user_data = base64encode(local.user_data)

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "webapp-instance"
    }
  }

  tags = {
    Name = "webapp-launch-template"
  }
}

##############################################
# 6) Application Load Balancer
##############################################
resource "aws_lb" "webapp_alb" {
  name               = "webapp-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets = [
    aws_subnet.public1.id,
    aws_subnet.public2.id,
    aws_subnet.public3.id
  ]
  internal = false

  tags = {
    Name = "webapp-alb"
  }
}

resource "aws_lb_listener" "webapp_http_listener" {
  load_balancer_arn = aws_lb.webapp_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webapp_tg.arn
  }
}

resource "aws_lb_target_group" "webapp_tg" {
  name        = "webapp-target-group"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = aws_vpc.webapp_vpc.id
  target_type = "instance"

  health_check {
    protocol = "HTTP"
    path     = "/healthz"
    port     = "8080"
    matcher  = "200"
  }

  tags = {
    Name = "webapp-target-group"
  }
}

##############################################
# 7) Auto Scaling Group
##############################################
resource "aws_autoscaling_group" "webapp_asg" {
  name                       = "webapp-asg"
  max_size                   = 3
  min_size                   = 1
  desired_capacity           = 1
  health_check_type          = "ELB"
  health_check_grace_period  = 300

  vpc_zone_identifier = [
    aws_subnet.public1.id,
    aws_subnet.public2.id,
    aws_subnet.public3.id
  ]

  launch_template {
    id      = aws_launch_template.webapp_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.webapp_tg.arn]

  # Use tag blocks instead of 'tags = [...]'
  tag {
    key                 = "Name"
    value               = "webapp-asg"
    propagate_at_launch = true
  }
}

##############################################
# 8) CloudWatch Alarms and Scaling Policies
##############################################
# Scale Up Policy
resource "aws_autoscaling_policy" "scale_up_policy" {
  name                   = "webapp-scale-up-policy"
  autoscaling_group_name = aws_autoscaling_group.webapp_asg.name
  policy_type            = "SimpleScaling"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 300
}

resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name                = "webapp-scale-up-cpu"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 60
  statistic                 = "Average"
  threshold                 = 70
  alarm_description         = "Alarm if CPU exceeds 70%"
  alarm_actions             = [aws_autoscaling_policy.scale_up_policy.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.webapp_asg.name
  }
}

# Scale Down Policy
resource "aws_autoscaling_policy" "scale_down_policy" {
  name                   = "webapp-scale-down-policy"
  autoscaling_group_name = aws_autoscaling_group.webapp_asg.name
  policy_type            = "SimpleScaling"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 300
}

resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
  alarm_name          = "webapp-scale-down-cpu"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 30
  alarm_description   = "Alarm if CPU is below 30%"
  alarm_actions       = [aws_autoscaling_policy.scale_down_policy.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.webapp_asg.name
  }
}