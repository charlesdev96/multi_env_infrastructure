variable "project_name" {
  description = "Name of the project, used as a prefix for resource names and tags"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "vpc_id" {
  description = "VPC ID the database will be launched into"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the DB subnet group (must span at least 2 AZs)"
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_ids) >= 2
    error_message = "At least 2 private subnets, in different AZs, are required for an RDS subnet group."
  }
}

variable "allowed_security_group_ids" {
  description = "Security group IDs allowed to connect to the database (e.g. the compute module's security group)"
  type        = list(string)

  validation {
    condition     = length(var.allowed_security_group_ids) > 0
    error_message = "At least one security group must be allowed to reach the database."
  }
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"

  validation {
    condition     = contains(["postgres", "mysql"], var.engine)
    error_message = "engine must be either postgres or mysql."
  }
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class, e.g. db.t3.micro"
  type        = string

  validation {
    condition     = can(regex("^db\\.", var.instance_class))
    error_message = "instance_class must start with 'db.', e.g. db.t3.micro."
  }
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number

  validation {
    condition     = var.allocated_storage >= 20
    error_message = "allocated_storage must be at least 20 GB."
  }
}

variable "db_name" {
  description = "Name of the initial database to create"
  type        = string
}

variable "username" {
  description = "Master username for the database"
  type        = string
}

variable "password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "multi_az" {
  description = "Whether to deploy the database across multiple availability zones"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Number of days to retain automated backups"
  type        = number
  default     = 7
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot when the instance is destroyed"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Common tags applied to all resources in this module"
  type        = map(string)
  default     = {}
}
