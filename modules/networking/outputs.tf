output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "Map of availability zone to public subnet ID"
  value       = { for az, subnet in aws_subnet.public : az => subnet.id }
}

output "private_subnet_ids" {
  description = "Map of availability zone to private subnet ID"
  value       = { for az, subnet in aws_subnet.private : az => subnet.id }
}

output "public_subnet_ids_list" {
  description = "List of public subnet IDs, for resources that need a flat list"
  value       = [for s in aws_subnet.public : s.id]
}

output "private_subnet_ids_list" {
  description = "List of private subnet IDs, for resources that need a flat list"
  value       = [for s in aws_subnet.private : s.id]
}

output "nat_gateway_ids" {
  description = "Map of availability zone to NAT gateway ID"
  value       = { for az, nat in aws_nat_gateway.main : az => nat.id }
}

output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = aws_internet_gateway.main.id
}
