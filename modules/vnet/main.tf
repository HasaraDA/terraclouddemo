resource "azurerm_virtual_network" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

# create subnets from map variable
resource "azurerm_subnet" "subnets" {
  for_each            = var.subnets
  name                = each.key
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes

  # optional delegations (for postgres flexible server or AKS)
  dynamic "delegation" {
    for_each = lookup(each.value, "delegations", [])
    content {
      name = delegation.value.name
      service_delegation {
        name = delegation.value.service
        actions = lookup(delegation.value, "actions", ["Microsoft.Network/virtualNetworks/subnets/action"])
      }
    }
  }
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "subnets" {
  value = { for k, s in azurerm_subnet.subnets : k => s.id }
}
