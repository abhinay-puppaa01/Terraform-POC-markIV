output "ec2_id" {
  description = "The ID of the instance"
  value       = ec2_test.id
}

output "ec2_test_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = ec2_test.public_ip
}

output "ec2_test_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = ec2_test.tags_all
}
