resource "aws_ecr_repository" "foo" {
  name                 = "bar"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

terraform {
  required_version = ">=1.5.0"
  # Note that previously we did not declare terraform version.
  # In this scenario terraform will not validate terraform version
  # but try to resolve with installed one.
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

  # configure remote backend
  backend "s3" {
   region = "us-east-1"
   bucket = "issiterraform"
   key    =  "terraform_lab/terraform.tfstate"
   # if we would like to support locking, we need to provide a dynamodb table
   # name, this might be helpful if we have multiple teams working on the same
   # infrastructure
   # this is a good practice to avoid race conditions. The terraform will look if
   # the lock is already taken and if it is, it will return an error untill the
   # lock is released.
   # dynamodb_table = "terraform-lock"
   # you can omit this one for now.
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