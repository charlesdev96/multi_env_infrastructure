output "state_bucket_name" {
  description = "Name of the S3 bucket created for Terraform state - use this in each environment's backend.tf"
  value       = aws_s3_bucket.terraform_state.id
}

output "lock_table_name" {
  description = "Name of the DynamoDB table created for state locking - use this in each environment's backend.tf"
  value       = aws_dynamodb_table.terraform_locks.name
}
