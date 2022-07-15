resource "kubernetes_manifest" "kubemonkey_configmap" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "config.toml" = <<-EOT
      [kubemonkey]
      run_hour = ${var.run_hour}
      start_hour = ${var.start_hour}
      end_hour = ${var.end_hour}
      blacklisted_namespaces = ${var.blacklisted_namespaces}
      EOT
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "name"      = "kube-monkey-config-map"
      "namespace" = "${var.namespace}"
    }
  }
}
