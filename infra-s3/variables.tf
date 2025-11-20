variable "bucket_name" {
  description = "Navnet på S3-bucketen som lagrer analysefiler"
  type        = string
  default     = "eksamen-devops-kandidatnrrr-75-s3"
}


variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "days_to_glacier" {
  description = "Days before files move to Glacier"
  type        = number
  default     = 30
}

variable "days_to_delete" {
  description = "Days before files are deleted"
  type        = number
  default     = 90
}
