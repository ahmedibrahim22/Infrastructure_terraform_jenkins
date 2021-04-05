resource "aws_vpc" "iti" {
  cidr_block = var.cidr
  tags = {
    Name = "iti"
    Env = "dev"
    test = "test"
  }
}