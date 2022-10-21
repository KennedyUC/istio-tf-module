variable "istio_chart_repo" {
    type        = string
    default     = "https://istio-release.storage.googleapis.com/charts"
    description = "helm chart repo for installing istio"
}

variable "helm_create_namespace" {
    type        = string
    default     = false
    description = "enable helm to create namespace"
}

variable "istio_namespace" {
    type        = string
    default     = "istio-system"
    description = "namespace to deploy istio resources"
}