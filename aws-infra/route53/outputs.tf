output "hosted_zone_id" {
  description = "ID of the created hosted zone"
  value       = aws_route53_zone.hosted_zone.zone_id
}

output "hosted_zone_name_servers" {
  description = "Name servers for the hosted zone"
  value       = aws_route53_zone.hosted_zone.name_servers
}