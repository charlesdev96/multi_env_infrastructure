variable "region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "project_name" {
  description = "Name of the project, used as a prefix for resource names and tags"
  type        = string
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "Availability zones to use"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "single_nat_gateway" {
  description = "Use one shared NAT gateway instead of one per AZ"
  type        = bool
  default     = false
}

variable "ami_id" {
  description = "AMI ID for compute instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for compute instances"
  type        = string
}

variable "asg_min_size" {
  description = "Minimum size of the autoscaling group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum size of the autoscaling group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired capacity of the autoscaling group"
  type        = number
}

variable "allowed_ssh_cidr_blocks" {
  description = "CIDR blocks allowed to SSH into compute instances"
  type        = list(string)
  default     = []
}

variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage for the database in GB"
  type        = number
}

variable "db_name" {
  description = "Name of the initial database"
  type        = string
}

variable "db_username" {
  description = "Master username for the database"
  type        = string
}

variable "db_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "db_multi_az" {
  description = "Whether to deploy the database across multiple AZs"
  type        = bool
  default     = false
}

variable "db_deletion_protection" {
  description = "Whether to enable RDS deletion protection"
  type        = bool
  default     = false
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}
