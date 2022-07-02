# Creating a Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.rg_name
  location            = var.location
  tags                = var.resource_tags     
}

#Creating a Recovery Service Vault
resource "azurerm_recovery_services_vault" "recovery_svc_vault" {
  name                = var.recovery_svc_vault.name
  resource_group_name = var.rg_name
  location            = var.location
  tags                = var.resource_tags 
  sku                 = var.recovery_svc_vault.sku
  storage_mode_type   = var.recovery_svc_vault.storage_mode_type
}

# Creating a Storage Account
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_acc_properties.name
  resource_group_name      = var.rg_name
  location                 = var.location
  tags                     = var.resource_tags
  account_tier             = var.storage_acc_properties.account_tier
  account_replication_type = var.storage_acc_properties.account_replication_type
}