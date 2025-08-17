resource "helm_release" "metrics-server" {
  name              = "metrics-server"
  repository        = "https://kubernetes-sigs.github.io/metrics-server/"
  chart             = "metrics-server"
  create_namespace  = true
  namespace         = "metrics-server"
}