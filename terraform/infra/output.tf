output "ec2_public_instaces" {
  value = aws_instance.my_instance[*].public_ip
  description = "public ip addresses of ec2 instances"
}
