resource "helm_release" "aws-load-balancer-controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  timeout    = 900
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

}