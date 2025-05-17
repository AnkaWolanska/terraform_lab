output "repository_url" {
  value       = github_repository.repo.html_url
  description = "URL of the created repository"
}


output "bucket_arns" {
  value = {
    "${var.regions[0]}" = module.default_bucket.bucket_arn,
    "${var.regions[1]}" = module.secondary_bucket.bucket_arn,
  }
}

output "bucket_regions" {
  value = {
    "${module.default_bucket.bucket_id}"   = var.regions[0],
    "${module.secondary_bucket.bucket_id}" = var.regions[1],
  }
}