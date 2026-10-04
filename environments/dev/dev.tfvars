region       = "us-east-1"
project_name = "acme"
environment  = "dev"

vpc_cidr             = "10.0.0.0/16"
azs                  = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
single_nat_gateway   = true

ami_id                  = "ami-0abcdef1234567890"
instance_type           = "t3.micro"
asg_min_size            = 1
asg_max_size            = 2
asg_desired_capacity    = 1
allowed_ssh_cidr_blocks = ["203.0.113.7/32"]

db_engine              = "postgres"
db_engine_version      = "15.4"
db_instance_class      = "db.t3.micro"
db_allocated_storage   = 20
db_name                = "acmedb"
db_username            = "acmeadmin"
db_password            = "changeme-use-a-secrets-manager"
db_multi_az            = false
db_deletion_protection = false

common_tags = {
  Owner = "platform-team"
}
