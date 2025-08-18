// This hosted zone can be fixed, I'm removing in lieu of my own domain management.

# resource "aws_route53_zone" "hosted_zone" {
#   name = var.subdomain
#   tags = var.tags
# }

data "aws_route53_zone" "hosted_zone" {
  name = var.subdomain
}

resource "aws_route53_record" "acm_validation" {
  for_each = {
    for dvo in aws_acm_certificate.acm_certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.hosted_zone.zone_id
}

resource "aws_route53_record" "alb_alias_route53_record" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.subdomain
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
  count = var.infra_bootstrap ? 0 : 1
}