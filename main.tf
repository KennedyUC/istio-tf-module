resource "helm_release" "istio_base" {
  name             = "istio_base"
  repository       = var.istio_chart_repo
  chart            = "base"
  namespace        = var.istio_namespace
  create_namespace = var.helm_create_namespace
}

resource "helm_release" "istio_d" {
  depends_on       = [helm_release.istio_base]
  name             = "istio_d"
  repository       = var.istio_chart_repo
  chart            = "istiod"
  namespace        = var.istio_namespace
  create_namespace = var.helm_create_namespace
}

resource "helm_release" "istio-ingress" {
  depends_on = [helm_release.istio_d]
  name       = "istio-ingress"
  repository = var.istio_chart_repo
  chart      = "gateway"
  namespace  = var.istio_namespace
}