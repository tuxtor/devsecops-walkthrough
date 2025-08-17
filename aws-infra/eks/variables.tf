variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "minimal-eks"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EKS nodes"
  type        = list(string)
}

variable "eks_version" {
  description = "EKS cluster version"
  type        = string
  default     = "1.33"
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}