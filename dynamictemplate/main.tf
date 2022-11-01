resource"aws_instance""ec2_test"{
   ami                    =var.ami
  instance_type           =var.instance_type
  availability_zone       =var.availability_zone
  subnet_id               =var.subnet_id
  vpc_security_group_ids  =var.vpc_security_group_ids
  tags                    =merge({ "Name"=var.instance_name},var.tags)
}
