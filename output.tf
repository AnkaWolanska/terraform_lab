output "repository_url" {
  value       = github_repository.repo.html_url
  description = "URL of the created repository"
}

output "bucket_arns" {
   value = {
      "${var.regions[0]}" = aws_s3_bucket.default.arn,
      "${var.regions[1]}" = aws_s3_bucket.secondary.arn,
   }
}

output "bucket_regions" {
   value = {
      "${aws_s3_bucket.default.id}"     = var.regions[0],
      "${aws_s3_bucket.secondary.id}"     = var.regions[1],
   }
}

output "bucket_replication_status" {
  description = "The replication status of the S3 bucket"
  value = {
      "${aws_s3_bucket.default.id}"     = aws_s3_bucket.default.replication_configuration,
      "${aws_s3_bucket.secondary.id}"     = aws_s3_bucket.secondary.replication_configuration,
   }
}