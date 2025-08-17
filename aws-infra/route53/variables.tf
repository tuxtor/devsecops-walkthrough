variable "subdomain" {
  description = "Subdomain for the hosted zone"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name for the Application Load Balancer"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the hosted zone"
  type        = map(string)
  default     = {}
}

