resource "aws_ecr_repository" "foo" {
  name                 = "bar"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

terraform {
  required_version = ">=1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    region = "us-east-1"
    bucket = "issiterraform"
    key    = "terraform_lab/terraform.tfstate"
  }
}

provider "github" {
  token = var.github_token
}

provider "aws" {
  region = var.regions[0]
}

provider "aws" {
  alias  = "secondary"
  region = var.regions[1]
}