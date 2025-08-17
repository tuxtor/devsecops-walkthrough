resource "aws_acm_certificate" "acm_certificate" {
  domain_name       = var.subdomain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}