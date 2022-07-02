output "log_analytics_workspace_out" {
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.name
  description = "This output variable will output the name of Log Analytics Workspace to root module"
}

output "recovery_svc_vault_name_out" {
  value       = azurerm_recovery_services_vault.recovery_svc_vault.name
  description = "This output variable will output the name of Recovery Service Vault to root module"
}

output "storage_account_name_out" {
  value       = azurerm_storage_account.storage_account.name
  description = "This output variable will output the name of Storage Account to root module"
}

output "storage_account_blob_endpoint_out" {
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint 
  description = "This output variable will output the blob endpoint of Storage Account to root module (to be used in VMs in Linux module and VM Windows Module)"
  
}

