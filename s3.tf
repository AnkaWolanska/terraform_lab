 resource "random_string" "bucket_name_suffix" {
  count = length(var.regions)
  length = 16
  special = false
  upper = false
}

# create us-east-1 bucket using the default provider
module "default_bucket" {
  source            = "./modules/s3_bucket"
  bucket_name_prefix = var.bucket_name_prefix
  region            = var.regions[0]
  random_suffix     = random_string.bucket_name_suffix[0].result
}
# create us-west-2 bucket using the eu_west_1 provider
module "secondary_bucket" {
  source            = "./modules/s3_bucket"
  # notice how we pass provider alias to the module.
  providers = {
    aws = aws.secondary
  }
  bucket_name_prefix = var.bucket_name_prefix
  region            = var.regions[1]
  random_suffix     = random_string.bucket_name_suffix[1].result
  lifecycle_days = 30 # we can modify the days value if we want
}
