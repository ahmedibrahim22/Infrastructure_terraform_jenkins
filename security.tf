resource "aws_security_group" "first" {
  name        = "access_1"
  description = "Allow TLS inbound traffic2"
  vpc_id      = module.iti.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_all_ssh"
  }
}

resource "aws_security_group" "second" {
  name        = "access_2"
  description = "Allow TLS inbound traffic2"
  vpc_id      = module.iti.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

    ingress {
    description = "TLS from VPC"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_inside_vpc"
  }
}

resource "aws_db_security_group" "rds" {
  name = "rds_sg"

  ingress {
    cidr = "10.0.0.0/16"
  }
}