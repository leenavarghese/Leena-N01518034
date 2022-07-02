output "vnet_name_out" {
  value       = azurerm_virtual_network.vnet.name
  description = "This output variable will output the name of Virtual Network to root module"
}

output "subnet_name_out" {
  value = azurerm_subnet.subnet.name
  description = "This output variable will output the name of Subnet to root module"
}

output "subnet_id_out" {
  value = azurerm_subnet.subnet.id
  description = "This output variable will output the id of Subnet to root module (to be used in vmlinux module)"
}

