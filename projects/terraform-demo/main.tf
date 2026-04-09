provider "aws" {
  region = "us-east-1"
}

# Use variables for flexibility
variable "instance_type" {
  default = "t3.medium"
}

variable "project" {
  default = "obi-demo"
}

# Key pair for SSH access
resource "aws_key_pair" "obi_key" {
  key_name   = "${var.project}-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Security group with least privilege
resource "aws_security_group" "obi_sg" {
  name        = "${var.project}-sg"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["YOUR_IP/32"] # restrict to your IP
  }

  ingress {
    description = "HTTP"
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

# EC2 instance with user_data for automation
resource "aws_instance" "obi_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
  instance_type = var.instance_type
  key_name      = aws_key_pair.obi_key.key_name
  vpc_security_group_ids = [aws_security_group.obi_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "<h1>Welcome to Obi's Advanced Demo</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "${var.project}-ec2"
    Environment = "demo"
    Owner       = "Obi"
  }
}

# Elastic IP for stable access
resource "aws_eip" "obi_eip" {
  instance = aws_instance.obi_ec2.id
}

# CloudWatch monitoring
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "${var.project}-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarm when CPU exceeds 70%"
  dimensions = {
    InstanceId = aws_instance.obi_ec2.id
  }
}
