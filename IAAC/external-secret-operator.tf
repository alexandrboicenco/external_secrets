resource "helm_release" "this" {
  name       = "external-secrets"
  repository = "https://charts.external-secrets.io"
  chart      = "external-secrets"
  version    = "0.9.5" # This is chart version, app version is defined by imageTag in template
  namespace  = kubernetes_namespace_v1.this.metadata[0].name
}

resource "kubernetes_namespace_v1" "this" {
  metadata {
    name = var.namespace
  }

  lifecycle {
    prevent_destroy = true
  }
}