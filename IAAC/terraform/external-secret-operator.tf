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

resource "helm_release" "reloader" {
  name       = "reloader"
  repository = "https://stakater.github.io/stakater-charts"
  chart      = "reloader"
  version    = "1.0.1"  # Replace with the desired version

}

# #trivy
# resource "helm_release" "trivy-operator" {
#   name       = "trivy-operator"
#   namespace  = "trivy-system"
#   create_namespace = true

#   repository = "https://aquasecurity.github.io/helm-charts/"
#   chart      = "trivy-operator"

#   set {
#     name  = "trivy.ignoreUnfixed"
#     value = "true"
#   }
# }