resource "random_string" "bucket_name_suffix" {
  count   = length(var.regions)
  length  = 16
  special = false
  upper   = false
}

module "default_bucket" {
  source             = "./modules/s3_bucket"
  bucket_name_prefix = var.bucket_name_prefix
  region             = var.regions[0]
  random_suffix      = random_string.bucket_name_suffix[0].result
}

module "secondary_bucket" {
  source = "./modules/s3_bucket"
  providers = {
    aws = aws.secondary
  }
  bucket_name_prefix = var.bucket_name_prefix
  region             = var.regions[1]
  random_suffix      = random_string.bucket_name_suffix[1].result
  lifecycle_days     = 30
}
