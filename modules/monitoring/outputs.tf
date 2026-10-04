output "asg_cpu_alarm_arn" {
  description = "ARN of the ASG CPU alarm"
  value       = aws_cloudwatch_metric_alarm.asg_cpu_high.arn
}

output "db_cpu_alarm_arn" {
  description = "ARN of the RDS CPU alarm"
  value       = aws_cloudwatch_metric_alarm.db_cpu_high.arn
}

output "db_storage_alarm_arn" {
  description = "ARN of the RDS free storage alarm"
  value       = aws_cloudwatch_metric_alarm.db_storage_low.arn
}
