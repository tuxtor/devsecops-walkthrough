resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "helm_release" "ingress-nginx" {
  name              = "ingress-nginx"
  repository        = "https://kubernetes.github.io/ingress-nginx"
  chart             = "ingress-nginx"
  create_namespace  = false
  namespace         = "ingress-nginx"
  timeout    = 900
  values = [
    file("${path.module}/ingress-nginx-values.yaml")
  ]

  depends_on = [ kubernetes_namespace.ingress-nginx, helm_release.aws-load-balancer-controller ]
}

data "kubernetes_service" "ingress-nginx" {
  metadata {
    name = "ingress-nginx-controller"
    namespace = helm_release.ingress-nginx.metadata[0].namespace
  }
  depends_on = [ helm_release.ingress-nginx ]
}

resource "kubernetes_manifest" "ingress-nginx-alb" {
  manifest = yamldecode(
    replace(
      file("${path.module}/ingress-nginx-alb.yml"),"alb_certificate_arns", var.acm_certificate_arn
    )
  )
  depends_on = [ data.kubernetes_service.ingress-nginx ]
}