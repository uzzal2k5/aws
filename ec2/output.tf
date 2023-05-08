output "instances" {
  value       = aws_instance.ec2_thkee_dev
  description = "All Machine details"
}
output "private_ip"{
  value= aws_instance.ec2_thkee_dev.private_ip
}
