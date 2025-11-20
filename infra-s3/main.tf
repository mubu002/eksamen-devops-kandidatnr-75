terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket = "pgr301-terraform-state"
    key    = "infra-s3/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "analysis_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.analysis_bucket.id

  rule {
    id     = "midlertidig-data"
    status = "Enabled"

    filter {
      prefix = "midlertidig/"
    }

    transition {
      days          = var.days_to_glacier
      storage_class = "GLACIER"
    }

    expiration {
      days = var.days_to_delete
    }
  }
}
