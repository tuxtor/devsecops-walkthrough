variable "cluster_endpoint" { type = string }
variable "cluster_certificate" { type = string }
variable "cluster_name" { type = string }
variable "region" {
  type = string
  description = "AWS region where the EKS cluster is deployed."
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the EKS cluster is deployed."
}

variable "alb_service_account_iam_arn" {
  type        = string
  description = "ARN of the IAM role for the AWS Load Balancer Controller service account."
}

variable "acm_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate for the cluster."
}