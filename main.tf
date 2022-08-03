 locals {
  project = "my-project"
  prefix = "ec2-${var.name}"
}

 resource "aws_instance" "ec2_poc" {
     ami = var.ami
     instance_type = var.instance_type
     subnet_id = var.subnet_id
     vpc_security_group_ids = var.vpc_security_group_ids
    tags = {
        Name  = var.name
        Owner = var.user
    }
}