region       = "us-east-1"
project_name = "acme"
environment  = "staging"

vpc_cidr             = "10.1.0.0/16"
azs                  = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.11.0/24", "10.1.12.0/24"]
single_nat_gateway   = false

ami_id                  = "ami-0abcdef1234567890"
instance_type           = "t3.small"
asg_min_size            = 2
asg_max_size            = 4
asg_desired_capacity    = 2
allowed_ssh_cidr_blocks = ["203.0.113.7/32"]

db_engine               = "postgres"
db_engine_version       = "15.4"
db_instance_class       = "db.t3.small"
db_allocated_storage    = 50
db_name                 = "acmedb"
db_username             = "acmeadmin"
db_password             = "changeme-use-a-secrets-manager"
db_multi_az             = false
db_deletion_protection  = false

common_tags = {
  Owner = "platform-team"
}
