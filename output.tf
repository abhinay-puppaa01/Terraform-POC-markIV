output "root_says" {
  value = "hello i am the groot"
}
output "instance_id" {
  value = try(aws_instance.ec2_poc.id,"")
}
output "instance_public_ip" {
  value = try(aws_instance.ec2_poc.public_ip,"")
}
output "instance_arn" {
  value = try(aws_instance.ec2_poc.arn,"")
}
output "instance_private_ip" {
  value = try(aws_instance.ec2_poc.private_ip,"")
}
output "instance_tags" {
  value = try(aws_instance.ec2_poc.tags,{})
}