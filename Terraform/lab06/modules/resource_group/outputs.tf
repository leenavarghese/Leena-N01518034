## Outputs for the Resource Group module

output "network_rg" {
  value = azurerm_resource_group.network_RG.name
}

output "linux_rg" {
  value = azurerm_resource_group.linux_RG.name
}

output "windows_rg" {
  value = azurerm_resource_group.windows_RG.name
}
