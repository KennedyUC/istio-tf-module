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
  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "base"
  namespace        = "istio-system"
  create_namespace = false
  values           = []
  atomic           = true
}

resource "helm_release" "istio_d" {
  depends_on       = [helm_release.istio_base]
  name             = "istio-d"
  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "istiod"
  namespace        = "istio-system"
  create_namespace = false
  values           = []
  atomic           = false
}