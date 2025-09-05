resource "random_password" "admin" {
  length  = 16
  special = true
}

resource "azurerm_postgresql_flexible_server" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = var.admin_login
  administrator_password = var.admin_password != "" ? var.admin_password : random_password.admin.result

  sku_name   = var.sku_name
  storage_mb = var.storage_mb
  version    = var.postgres_version

  backup_retention_days = var.backup_retention_days

  # Attach the server to the delegated subnet if provided (VNet integration)
  delegated_subnet_id = var.delegated_subnet_id

  tags = var.tags
}

resource "azurerm_postgresql_flexible_server_configuration" "timezone" {
  server_id = azurerm_postgresql_flexible_server.this.id
  name      = "timezone"
  value     = var.timezone
  depends_on = [azurerm_postgresql_flexible_server.this]
}

output "fqdn" {
  value = azurerm_postgresql_flexible_server.this.fqdn
}

output "admin_username" {
  value = azurerm_postgresql_flexible_server.this.administrator_login
}

output "admin_password" {
  value = var.admin_password != "" ? var.admin_password : random_password.admin.result
  sensitive = true
}
