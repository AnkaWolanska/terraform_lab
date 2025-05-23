variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
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
  default     = ["us-east-1", "us-west-2"]
}

variable "bucket_name_prefix" {
  type    = string
  default = "terraformissi"
}

