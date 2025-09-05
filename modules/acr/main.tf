resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false
  #georeplications     = []
  tags                = var.tags
}

## The resource "azurerm_container_registry_network_rule_set" is not supported. Remove it.

output "login_server" {
  value = azurerm_container_registry.this.login_server
}
output "acr_id" {
  value = azurerm_container_registry.this.id
}
