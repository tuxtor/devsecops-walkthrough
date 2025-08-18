resource "helm_release" "kube-prometheus-stack" {
  name              = "kube-prometheus-stack"
  repository        = "https://prometheus-community.github.io/helm-charts"
  chart             = "kube-prometheus-stack"
  create_namespace  = true
  namespace         = "kube-prometheus-stack"
  wait_for_jobs     = true

  depends_on = [helm_release.aws-load-balancer-controller]
}

