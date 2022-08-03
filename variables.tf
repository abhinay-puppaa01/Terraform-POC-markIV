variable "ami" {
    type = string
    default = "ami-0cff7528ff583bf9a"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "name"{
    type = string
    default = "ec2-instance-default"
}
variable "user" {
    type = string
    default = "test-user"
}

variable "vpc" {
    type = string
    default = "vpc-2fbe8954"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = "subnet-0b14d66c"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}