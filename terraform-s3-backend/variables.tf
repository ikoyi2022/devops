variable "aws_region_main" {
  type        = string
  default     = "us-east-1"
  description = "Main AWS region for deploying resources."
}

variable "aws_region_backup" {
  type        = string
  default     = "us-east-2"
  description = "Backup AWS region for replication."
}

variable "env_type" {
  type        = string
  default     = "development"
  description = "Environment type (e.g., development, production)."
}

variable "project_name" {
  type        = string
  default     = "devops"
  description = "Name of the project."
}

variable "common_tags" {
  type = map(any)
  default = {
    "AssetID"       = "1759",
    "AssetName"     = "ALPHA",
    "AssetAreaName" = "Terraform",
    "ControlledBy"  = "Terraform"
  }
  description = "Common tags to apply to resources."
}
