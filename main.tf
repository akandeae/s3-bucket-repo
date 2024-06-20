
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "bukation-bucket"  # Replace with your unique bucket name

  # Enable versioning
  versioning {
    enabled = true
  }
}

# Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

