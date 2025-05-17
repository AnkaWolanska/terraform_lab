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

variable "regions" {
  description = "Name of the AWS deployment regions"
  type        = list(string)
  default     = ["us-east-1", "eu-west-1"]
}

