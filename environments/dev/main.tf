terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "networking" {
  source = "../../modules/networking"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  single_nat_gateway   = var.single_nat_gateway
  common_tags          = var.common_tags
}

module "compute" {
  source = "../../modules/compute"

  project_name            = var.project_name
  environment             = var.environment
  vpc_id                  = module.networking.vpc_id
  vpc_cidr                = var.vpc_cidr
  subnet_ids              = module.networking.private_subnet_ids_list
  ami_id                  = var.ami_id
  instance_type           = var.instance_type
  min_size                = var.asg_min_size
  max_size                = var.asg_max_size
  desired_capacity        = var.asg_desired_capacity
  allowed_ssh_cidr_blocks = var.allowed_ssh_cidr_blocks
  common_tags             = var.common_tags
}

module "database" {
  source = "../../modules/database"

  project_name               = var.project_name
  environment                = var.environment
  vpc_id                     = module.networking.vpc_id
  private_subnet_ids         = module.networking.private_subnet_ids_list
  allowed_security_group_ids = [module.compute.security_group_id]
  engine                     = var.db_engine
  engine_version             = var.db_engine_version
  instance_class             = var.db_instance_class
  allocated_storage          = var.db_allocated_storage
  db_name                    = var.db_name
  username                   = var.db_username
  password                   = var.db_password
  multi_az                   = var.db_multi_az
  deletion_protection        = var.db_deletion_protection
  common_tags                = var.common_tags
}

module "monitoring" {
  source = "../../modules/monitoring"

  project_name   = var.project_name
  environment    = var.environment
  asg_name       = module.compute.autoscaling_group_name
  db_instance_id = module.database.db_instance_id
  common_tags    = var.common_tags
}
