output "name" { value = azurerm_kubernetes_cluster.this.name }
output "kubelet_identity_object_id" { value = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id }
output "kube_admin_config_raw" {
  value = azurerm_kubernetes_cluster.this.kube_admin_config_raw
  sensitive = true
}
output "fqdn" { value = azurerm_kubernetes_cluster.this.fqdn }
