# uses default provider configuration
resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraformissi-987654" # replace with your own unique name
  tags = {
    Name = "terraformissi"
  }
}

# alias provider specified, it will use its configuration
resource "aws_s3_bucket" "my_bucket_us_west_2" {
  bucket   = "issiterraform-234567" # replace with your own unique name
  provider = aws.us_west_2
  tags = {
    Name = "issiterraform"
  }
}