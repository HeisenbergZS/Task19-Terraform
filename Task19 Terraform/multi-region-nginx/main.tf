provider "aws" {
  alias  = "region1"
  region = var.aws_region_1
}

provider "aws" {
  alias  = "region2"
  region = var.aws_region_2
}

# Security Group - Region 1
resource "aws_security_group" "open_all_region1" {
  provider = aws.region1
  name     = "allow-all-traffic-region1"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group - Region 2
resource "aws_security_group" "open_all_region2" {
  provider = aws.region2
  name     = "allow-all-traffic-region2"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance in Region 1
resource "aws_instance" "nginx_region1" {
  provider                  = aws.region1
  ami                       = var.ami_id_region1
  instance_type             = var.instance_type
  vpc_security_group_ids    = [aws_security_group.open_all_region1.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "nginx-region-1"
  }
}

# EC2 Instance in Region 2
resource "aws_instance" "nginx_region2" {
  provider                  = aws.region2
  ami                       = var.ami_id_region2
  instance_type             = var.instance_type
  vpc_security_group_ids    = [aws_security_group.open_all_region2.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "nginx-region-2"
  }
}
