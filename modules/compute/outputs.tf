output "autoscaling_group_id" {
  description = "ID of the autoscaling group"
  value       = aws_autoscaling_group.main.id
}

output "autoscaling_group_name" {
  description = "Name of the autoscaling group"
  value       = aws_autoscaling_group.main.name
}

output "launch_template_id" {
  description = "ID of the launch template"
  value       = aws_launch_template.main.id
}

output "security_group_id" {
  description = "ID of the compute instance security group"
  value       = aws_security_group.instance.id
}
