terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.9.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 3.0.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.38.0"
    }
  }
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket = var.aws_state_bucket
    key    = "terraform.tfstate"
    region = var.aws_region
  }
}
