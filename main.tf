provider "aws" {
  region = "us-east-1" # Change the region if needed
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "bukation-bucket" # Replace with your unique bucket name

  # Enable versioning
  versioning {
    enabled = true
  }
}

