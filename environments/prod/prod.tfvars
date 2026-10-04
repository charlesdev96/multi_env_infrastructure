region       = "us-east-1"
project_name = "acme"
environment  = "prod"

vpc_cidr             = "10.2.0.0/16"
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs  = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
private_subnet_cidrs = ["10.2.11.0/24", "10.2.12.0/24", "10.2.13.0/24"]
single_nat_gateway   = false

ami_id                  = "ami-0abcdef1234567890"
instance_type           = "m5.large"
asg_min_size            = 3
asg_max_size            = 6
asg_desired_capacity    = 3
allowed_ssh_cidr_blocks = []

db_engine               = "postgres"
db_engine_version       = "15.4"
db_instance_class       = "db.m5.large"
db_allocated_storage    = 200
db_name                 = "acmedb"
db_username             = "acmeadmin"
db_password             = "changeme-use-a-secrets-manager"
db_multi_az             = true
db_deletion_protection  = true

common_tags = {
  Owner = "platform-team"
}
