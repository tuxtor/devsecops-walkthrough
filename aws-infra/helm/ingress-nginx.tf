resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "helm_release" "ingress-nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  create_namespace = false
  namespace        = "ingress-nginx"
  timeout          = 900
  values = [
    file("${path.module}/ingress-nginx-values.yaml")
  ]
  wait_for_jobs = true
  depends_on = [kubernetes_namespace.ingress-nginx, helm_release.aws-load-balancer-controller]
}

resource "kubernetes_manifest" "ingress-nginx-alb" {
  manifest = yamldecode(
    replace(
      file("${path.module}/ingress-nginx-alb.yml"), "alb_certificate_arns", var.acm_certificate_arn
    )
  )
  depends_on = [helm_release.ingress-nginx, helm_release.aws-load-balancer-controller]
  count = var.infra_bootstrap ? 0 : 1
}

data "aws_lb" "ingress-nginx" {
  name       = var.alb_name
  depends_on = [kubernetes_manifest.ingress-nginx-alb]
  count = var.infra_bootstrap ? 0 : 1
}