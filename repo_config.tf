variable "publicly_visible" {
  description = "Determines whether repository is publicly visible"
  type        = bool
  sensitive   = false
}

locals {
   visibility = var.publicly_visible ? "public" : "private"
}

resource "github_repository" "repo" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = local.visibility
  auto_init   = true
}

