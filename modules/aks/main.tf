resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.node_vm_size
    type       = "VirtualMachineScaleSets"
    max_pods   = var.max_pods
    os_disk_size_gb = var.node_os_disk_size_gb
  }

  network_profile {
    network_plugin    = var.network_plugin
    network_policy    = var.network_policy
    dns_service_ip    = var.dns_service_ip
    service_cidr      = var.service_cidr
    #docker_bridge_cidr = var.docker_bridge_cidr
  }

  #addon_profile {
  #  oms_agent {
  #    enabled                    = var.enable_monitoring
  #    log_analytics_workspace_id = var.log_analytics_workspace_id
  #  }
  #}

  #role_based_access_control {
  #  enabled = true
  #}

  depends_on = []
}

# Allow AKS Managed Identity (kubelet identity) to pull from ACR
resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}
