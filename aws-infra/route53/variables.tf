variable "subdomain" {
  description = "Subdomain for the hosted zone"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name for the Application Load Balancer"
  type        = string
}

variable "alb_zone_id" {
  description = "Zone ID for the Application Load Balancer"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the hosted zone"
  type        = map(string)
  default     = {}
}

variable "infra_bootstrap" {
  type        = bool
  description = "Flag to indicate if the infrastructure bootstrap should be performed."
  default     = false
}

