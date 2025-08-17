resource "aws_route53_zone" "hosted_zone" {
  name = var.subdomain
  tags = var.tags
}


