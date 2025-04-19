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

variable "region" {
  description = "AWS region to deploy in"
  type        = string
  default     = "us-east-1"
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
/*
resource "aws_instance" "free_tier" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"          # Free‑tier eligible

  # Optional: allow SSH (you’ll need to create this key pair first in AWS)
  # key_name = var.ssh_key_name

  tags = {
    Name = "FreeTierInstance"
  }
}
*/

# Optional: pass in your SSH key name via a variable
# variable "ssh_key_name" {
#   description = "Name of an existing AWS key pair to attach for SSH access"
#   type        = string
#   default     = ""
# }