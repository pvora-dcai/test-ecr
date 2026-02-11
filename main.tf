terraform {
  required_version = ">= 1.6.6"

  backend "s3" {
    bucket = "test-terraform-github"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

# Example resource: S3 bucket (for testing)
resource "aws_s3_bucket" "test_bucket" {
  bucket = "pvora-dcai-test-bucket-${random_id.bucket_id.hex}"
  acl    = "private"

  tags = {
    Name        = "Test Bucket"
    Environment = "Dev"
  }
}

# Generate a random ID so the bucket name is unique
resource "random_id" "bucket_id" {
  byte_length = 4
}
