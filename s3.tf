resource "random_string" "default_bucket_name_suffix" {
  length = 16
  special = false
  upper = false
}

resource "random_string" "secondary_bucket_name_suffix" {
  length = 16
  special = false
  upper = false
}

# uses default provider configuration
resource "aws_s3_bucket" "default" {
  bucket = "terraformissi-${random_string.default_bucket_name_suffix.result}" # replace with your own unique name
  tags = {
    Name = "default_provider"
  }
}

# alias provider specified, it will use its configuration
resource "aws_s3_bucket" "secondary" {
  bucket   = "terraformissi-${random_string.secondary_bucket_name_suffix.result}" # replace with your own unique name
  provider = aws.secondary
  tags = {
    Name = "alias_provider"
  }
}