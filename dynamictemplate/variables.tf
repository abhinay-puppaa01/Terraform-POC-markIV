variable "region" {
  description = "AWS Region"
  type        = string
default = "<%= customOptions.region%>"
}
variable "access_key" {
  description = "The username of the user account used to access the Morpheus platform"
  type        = string
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "ami" {
  description = "Ami"
  type        = string
default = "ami-017cdd6dc706848b2"
}
variable "instance_type" {
  description = "Instance Type"
  type        = string
default = "<%= customOptions.instance_type%>"
}
variable "instance_name" {
  description = "Instance Name"
  type        = string
default = "<%= customOptions.instance_name%>"
}



variable "availability_zone" {
  description = "availability_zone"
  type        = string
default = "us-east-1a"
}

variable "subnet_id" {
  description = "subnet_id"
  type        = string
default = "<%= customOptions.subnet_id%>"
}
variable "vpc_security_group_ids" {
  description = "vpc_security_group_ids"
  type        = string
default = "<%= customOptions.vpc_security_group_ids%>"
}
variable "tags" {
  description = "tags"
  type        = string
default = "<%= customOptions.aws_tags%>"
}
