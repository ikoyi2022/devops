variable "region" {
  type = string
}

variable "availability_zones" {
  type = list(any)
}

variable "cidr_block" {
  type        = string
  description = "VPC cidr block. Example: 10.10.0.0/16"
}

variable "tags" {
  type        = map(string)
  description = "Common tags to be applied to resources"
  default = {
  "id"             = "1759"
  "owner"          = "Ikoyi"
  "environment"    = "development"
  "project"        = "devops"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
  }
}

variable "cluster_name" {
  type    = string
  default = "1759-development-devops"
}

variable "nat_number" {
  type    = string
  default = "1"
}
