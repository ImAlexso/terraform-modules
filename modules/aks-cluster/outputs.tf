output "aks_name" {
  value = azurerm_kubernetes_cluster.this.name
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.this.id
}

output "kubelet_identity_object_id" {
  value = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}

output "kubelet_identity_client_id" {
  value = azurerm_kubernetes_cluster.this.kubelet_identity[0].client_id
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive = true
}
