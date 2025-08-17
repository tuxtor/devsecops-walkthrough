resource "aws_ecr_repository" "ecr_repository" {
  name = var.repository_name
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  tags = var.tags
}

output "repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.ecr_repository.repository_url
}

output "repository_arn" {
  description = "ARN of the ECR repository"
  value       = aws_ecr_repository.ecr_repository.arn
}

