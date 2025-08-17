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