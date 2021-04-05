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

  tags = {
    Name = "allow_all_inside_vpc"
  }
}