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
  bucket = "terraformissi-${random_string.default_bucket_name_suffix.result}"

  tags = {
    Name = "default_provider"
  }
}

# alias provider specified, it will use its configuration
resource "aws_s3_bucket" "secondary" {
  bucket   = "terraformissi-${random_string.secondary_bucket_name_suffix.result}"
  provider = aws.secondary
  tags = {
    Name = "alias_provider"
  }
}

resource "aws_s3_bucket_versioning" "default_bucket_versioning" {
  bucket = aws_s3_bucket.default.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "secondary_bucket_versioning" {
  bucket = aws_s3_bucket.secondary.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "default_bucket_lifecycle_config" {
  bucket = aws_s3_bucket.default.id

  rule {
    id     = "transition-to-glacier"
    status = "Enabled"

    filter {
      prefix = "logs/"
    }

    transition {
      days          = 90
      storage_class = "GLACIER_IR"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "secondary_bucket_lifecycle_config" {
  bucket = aws_s3_bucket.secondary.id

  rule {
    id     = "transition-to-glacier"
    status = "Enabled"

    filter {
      prefix = "logs/"
    }

    transition {
      days          = 90
      storage_class = "GLACIER_IR"
    }
  }
}

