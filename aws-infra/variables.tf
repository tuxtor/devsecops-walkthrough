# Globally overridable variables for AWS infrastructure

variable "aws_region" {
  type        = string
  description = "AWS region to use for resources."
  default     = "us-east-1"
}

variable "aws_state_bucket" {
  type        = string
  description = "Name of the S3 bucket to save tofu status."
}

variable "aws_cluster_name" {
  type        = string
  description = "Name of the EKS cluster."
  default     = "vorozco-eks"
}

variable "aws_hosted_zone_subdomain" {
  type        = string
  description = "Subdomain for the Route 53 hosted zone."
  default     = "awsk8s.vorozco.com"
}

variable "infra_bootstrap" {
  type        = bool
  description = "Flag to indicate if the infrastructure bootstrap should be performed."
  default     = false
}