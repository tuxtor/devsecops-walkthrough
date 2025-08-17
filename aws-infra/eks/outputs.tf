output "name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_arn" {
  value = aws_eks_cluster.eks_cluster.arn
}

output "alb_service_account_iam_arn" {
  value = aws_iam_role.aws_lb_controller_service_account_role.arn
}