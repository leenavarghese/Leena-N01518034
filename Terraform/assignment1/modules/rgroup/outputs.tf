output "rg_name_out" {
  value = azurerm_resource_group.resource_grp.name
  description = "This output variable will output the name of Resource Group to root module"
}

output "location_out" {
  value       = azurerm_resource_group.resource_grp.location
  description = "This output variable will output the location of Resource Group to root module"
}