resource "null_resource" "manage-ns" {
  provisioner "local-exec" {
    command = "sudo chmod +x create-ns.sh"
  }
  provisioner "local-exec" {
    command = "sudo ./create-ns.sh"
  }
}

resource "helm_release" "istio_base" {
  depends_on       = [null_resource.manage_ns]
  name             = "istio-base"
  repository       = var.istio_chart_repo
  chart            = "base"
  namespace        = var.istio_namespace
  create_namespace = var.helm_create_namespace
  values           = []
  atomic           = true
}

resource "helm_release" "istio_d" {
  depends_on       = [helm_release.istio_base]
  name             = "istio-d"
  repository       = var.istio_chart_repo
  chart            = "istiod"
  namespace        = var.istio_namespace
  create_namespace = var.helm_create_namespace
  values           = []
  atomic           = false
}