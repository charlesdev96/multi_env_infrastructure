output "vpc_id" {
  description = "ID of this environment's VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.networking.public_subnet_ids_list
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.networking.private_subnet_ids_list
}

output "asg_name" {
  description = "Name of the compute autoscaling group"
  value       = module.compute.autoscaling_group_name
}

output "compute_security_group_id" {
  description = "Security group ID attached to compute instances"
  value       = module.compute.security_group_id
}

output "db_endpoint" {
  description = "RDS connection endpoint"
  value       = module.database.db_instance_endpoint
}
