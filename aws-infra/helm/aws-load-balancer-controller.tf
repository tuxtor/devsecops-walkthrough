resource "kubernetes_service_account" "aws-load-balancer-controller" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = var.alb_service_account_iam_arn
    }
  }
}

resource "helm_release" "aws-load-balancer-controller" {
  name          = "aws-load-balancer-controller"
  repository    = "https://aws.github.io/eks-charts"
  chart         = "aws-load-balancer-controller"
  namespace     = "kube-system"
  timeout       = 900
  wait_for_jobs = true
  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "region"
    value = var.region
  }

  set {
    name  = "vpcId"
    value = var.vpc_id
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  depends_on = [kubernetes_service_account.aws-load-balancer-controller]

}