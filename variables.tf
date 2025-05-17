# variables.tf

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true # Marks this variable as sensitive, preventing it from appearing in logs and console output
}

variable "repository_name" {
  description = "Name of the GitHub repository to create"
  type        = string
  default     = "terraform-managed-repo"
}

variable "repository_description" {
  description = "Description of the GitHub repository"
  type        = string
  default     = "Repository managed by Terraform"
}

variable "primary_region" {
  description = "Name of the default AWS deployment region"
  type        = string
  default     = "us-east-1"
}

variable "secondary_region" {
  description = "Name of the secondary AWS deplyment region"
  type        = string
  default     = "us-west-2"
}