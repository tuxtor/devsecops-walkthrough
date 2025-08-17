output "alb_dns_name" {
  value = var.infra_bootstrap ? "" : data.aws_lb.ingress-nginx[0].dns_name
}

output "alb_zone_id" {
  value = var.infra_bootstrap ? "" : data.aws_lb.ingress-nginx[0].zone_id
}