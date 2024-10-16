provider "aws" {
  region = local.region
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "1759-development-devops-tf-state"
    dynamodb_table = "1759-development-devops-tf-state-lock"
    key            = "vpc/terraform.tf"
    region         = "us-east-1"
  }
}

locals {
  region       = "us-east-1"
  cluster_name = "1759-development-devops"
  cidr_block   = "10.10.0.0/16"
  nat_number   = "1"
  availability_zones = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]

  tags = {
    "id"             = "1759"
    "owner"          = "Ikoyi"
    "environment"    = "development"
    "project"        = "devops"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "vpc" {
  source             = "../../modules/vpc"
  cidr_block         = local.cidr_block
  region             = local.region
  availability_zones = local.availability_zones
  cluster_name       = local.cluster_name
  nat_number         = local.nat_number
  tags               = local.tags
}
