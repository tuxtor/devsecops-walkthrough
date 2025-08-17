resource "aws_ecr_repository" "ecr_repository" {
  name         = var.repository_name
  force_delete = true
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

//Policy to evict all but the last 10 images in the repository
resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy" {
  repository = aws_ecr_repository.ecr_repository.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 5 images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 5
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}

