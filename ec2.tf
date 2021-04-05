resource "aws_instance" "bastion" {
    ami = var.ami
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.first.id]
    subnet_id = module.iti.public1_id
    key_name = aws_key_pair.deploy_key.key_name
    provisioner "local-exec" {
        command = "echo the public IP address is ${self.public_ip}"
    }
    tags = {
        Name = "EC2-bastion"
    }
}

resource "aws_instance" "private" {
    ami = var.ami
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.second.id]
    subnet_id = module.iti.private1_id
    key_name = aws_key_pair.deploy_key.key_name
    provisioner "local-exec" {
        command = "echo the public IP address is ${self.public_ip}"
    }
    tags = {
        Name = "EC2-private"
    }
}