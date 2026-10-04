locals {
  name = "${var.project_name}-${var.environment}"

  tags = merge(var.common_tags, {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "terraform"
  })
}

resource "aws_cloudwatch_metric_alarm" "asg_cpu_high" {
  alarm_name          = "${local.name}-asg-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Average ASG CPU utilization above 80% for 10 minutes"
  alarm_actions       = var.alarm_actions

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  tags = local.tags
}

resource "aws_cloudwatch_metric_alarm" "db_cpu_high" {
  alarm_name          = "${local.name}-db-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Average RDS CPU utilization above 80% for 10 minutes"
  alarm_actions       = var.alarm_actions

  dimensions = {
    DBInstanceIdentifier = var.db_instance_id
  }

  tags = local.tags
}

resource "aws_cloudwatch_metric_alarm" "db_storage_low" {
  alarm_name          = "${local.name}-db-storage-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 2147483648
  alarm_description   = "RDS free storage space below 2 GB"
  alarm_actions       = var.alarm_actions

  dimensions = {
    DBInstanceIdentifier = var.db_instance_id
  }

  tags = local.tags
}
