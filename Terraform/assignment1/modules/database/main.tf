# Creating PostGreSQL Server
resource "azurerm_postgresql_server" "postgres_server" {
  name                         = "${var.name}-server"
  resource_group_name          = var.rg_name
  location                     = var.location
  tags                         = var.resource_tags
  sku_name                     = var.server_sku_name
  version                      = var.server_properties.version
  ssl_enforcement_enabled      = var.server_properties.ssl_enforcement_enabled
  administrator_login          = var.admin_logon_details.username
  administrator_login_password = var.admin_logon_details.password

}

# Creating the PostGreSQL database
resource "azurerm_postgresql_database" "postgres_database" {
  name                = "${var.name}-db"
  resource_group_name = var.rg_name
  server_name         = azurerm_postgresql_server.postgres_server.name
  charset             = var.db_properties.charset
  collation           = var.db_properties.collation
}