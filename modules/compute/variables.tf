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
  description = "VPC ID the instances will be launched into"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC, used to scope internal HTTP access"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs the autoscaling group may launch instances into"
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) > 0
    error_message = "At least one subnet ID must be provided."
  }
}

variable "ami_id" {
  description = "AMI ID for the launch template"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type, e.g. t3.micro"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]+\\.[a-z0-9]+$", var.instance_type))
    error_message = "instance_type must look like a valid EC2 instance type, e.g. t3.micro."
  }
}

variable "min_size" {
  description = "Minimum number of instances in the autoscaling group"
  type        = number
  default     = 1

  validation {
    condition     = var.min_size >= 0
    error_message = "min_size must be zero or greater."
  }
}

variable "max_size" {
  description = "Maximum number of instances in the autoscaling group"
  type        = number

  validation {
    condition     = var.max_size >= 1
    error_message = "max_size must be at least 1."
  }
}

variable "desired_capacity" {
  description = "Desired number of instances in the autoscaling group"
  type        = number
}

variable "key_name" {
  description = "Name of an existing EC2 key pair for SSH access (optional)"
  type        = string
  default     = null
}

variable "allowed_ssh_cidr_blocks" {
  description = "CIDR blocks allowed to SSH into instances; leave empty to disable SSH ingress entirely"
  type        = list(string)
  default     = []
}

variable "common_tags" {
  description = "Common tags applied to all resources in this module"
  type        = map(string)
  default     = {}
}
