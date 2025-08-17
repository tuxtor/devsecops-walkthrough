output "alb_dns_name" {
  value = data.aws_lb.ingress-nginx.dns_name
}

output "alb_zone_id" {
  value = data.aws_lb.ingress-nginx.zone_id
}