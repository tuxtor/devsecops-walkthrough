variable "aws_region" {
  type        = string
  description = "AWS region to use for resources."
  default     = "us-east-1"
}

variable "aws_state_bucket" {
  type        = string
  description = "Name of the S3 bucket to save tofu status."
}