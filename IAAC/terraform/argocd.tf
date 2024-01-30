resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = var.namespace_argocd
  }

  lifecycle {
    prevent_destroy = true
  }
}
resource "null_resource" "apply_argocd_manifest" {
  provisioner "local-exec" {
    command = format("kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -n %s", var.namespace_argocd) 
  }
}