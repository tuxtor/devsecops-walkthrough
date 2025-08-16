terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.9.0"
    }
  }
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket = var.aws_state_bucket
    key    = "terraform.tfstate"
    region = var.aws_region
  }
}
