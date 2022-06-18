#  Outputs for Network Module

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_addr_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet_1_name" {
  value = azurerm_subnet.subnet1.name
}

output "subnet_1_addr_space" {
  value = azurerm_subnet.subnet1.address_prefixes
}

output "subnet_2_name" {
  value = azurerm_subnet.subnet2.name
}

output "subnet_2_addr_space" {
  value = azurerm_subnet.subnet2.address_prefixes
}

output "subnet1_association" {
  value = azurerm_subnet_network_security_group_association.nsg1_association.id
}

output "subnet_2_association" {
  value = azurerm_subnet_network_security_group_association.nsg2_association.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet1.id 
}

output "subnet2_id" {
  value = azurerm_subnet.subnet2.id 
}