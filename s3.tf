terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-unique-bucket-name"  # must be globally unique
  acl    = "private"

  tags = {
    Name        = "ExampleBucket"
    Environment = "Dev"
  }
}