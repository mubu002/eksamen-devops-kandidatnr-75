terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "pgr301-terraform-state-74"

  # For å unngå utilsiktet sletting av state
  force_destroy = false
}

output "backend_bucket_name" {
  value = aws_s3_bucket.terraform_state.id
}
