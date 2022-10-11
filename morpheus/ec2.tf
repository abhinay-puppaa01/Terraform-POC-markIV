

    variable "access_key" {
      description = "The username of the user account used to access the Morpheus platform"
      type        = string
    }

    variable "secret_key" {
      description = "AWS secret key"
      type        = string
    }
    variable "payload" {
      default = [{}]
    }


    variable "name" {
      description = "Name to be used on EC2 instance created"
      type        = string
      default     = ""
    }
    variable "tags" {
      description = "A mapping of tags to assign to the resource"
      type        = map(string)
      default     = {}
    }


    provider "aws" {
      region     = "us-east-1"
      access_key = var.access_key
      secret_key = var.secret_key
    }




    locals {
      serverconfig = [
        for srv in var.payload : [{
          instance_name           = srv.host_name
          instance_type           = srv.instance_type
          subnet_id               = srv.subnet_id
          ami                     = srv.ami
          tenancy                 = srv.tenancy
          host_resource_group_arn = srv.host_resource_group_arn
          iam_instance_profile    = srv.iam_instance_profile
          blockdisks              = srv.ebs_block_devices
          vpc_security_group_ids  = srv.vpc_security_group_ids
          tags                    = tomap(srv.tags)
          availability_zone       = srv.availability_zone
          key_name                = srv.key_name
        }]
      ]
    }
    // We need to Flatten it before using it
    locals {
      instances = flatten(local.serverconfig)
    }


    resource "aws_instance" "ec2_test" {
       for_each = { for server in local.instances : server.instance_name => server }

      ami                     = each.value.ami
      instance_type           = each.value.instance_type
      availability_zone       = each.value.availability_zone
      subnet_id               = each.value.subnet_id
      vpc_security_group_ids  = each.value.vpc_security_group_ids
      iam_instance_profile    = each.value.iam_instance_profile
      host_resource_group_arn = each.value.host_resource_group_arn
      tenancy                 = each.value.tenancy
      key_name                = each.value.key_name
      tags                    = merge({ "Name" = each.value.instance_name },each.value.tags)
      
      dynamic "ebs_block_device" {
        for_each = each.value.blockdisks
        content {
          volume_type = ebs_block_device.value.volume_type
          volume_size = ebs_block_device.value.volume_size
          tags        = ebs_block_device.value.tags
          iops        = ebs_block_device.value.iops
          device_name = ebs_block_device.value.device_name
        }
      }
    }

    resource "tls_private_key" "rsa" {
      algorithm = "RSA"
      rsa_bits  = 4096
    }
resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

    resource "local_file" "TF_key" {
      for_each = { for server in local.instances : server.instance_name => server }
      content = tls_private_key.rsa.private_key_pem
      filename = "${aws_instance.ec2_test[each.value.instance_name].tags.Name}.private_key"
    }

    output "id" {
      description = "The ID of the instance"
      value       = { 
        for k, v in aws_instance.ec2_test : k => v.id
        }
    }
    output "private_ip" {
      description = "The private IP address assigned to the instance."
      value       = { 
        for k, v in aws_instance.ec2_test : k => v.private_ip
        }
      }

  
