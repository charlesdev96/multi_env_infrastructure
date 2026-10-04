variable "project_name" {
  description = "Name of the project, used as a prefix for resource names and tags"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
}

variable "asg_name" {
  description = "Name of the autoscaling group to monitor"
  type        = string
}

variable "db_instance_id" {
  description = "Identifier of the RDS instance to monitor"
  type        = string
}

variable "alarm_actions" {
  description = "List of ARNs to notify when an alarm triggers (e.g. an SNS topic ARN)"
  type        = list(string)
  default     = []
}

variable "common_tags" {
  description = "Common tags applied to all resources in this module"
  type        = map(string)
  default     = {}
}
