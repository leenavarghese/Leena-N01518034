# This file contains the output values for the resources

output "vm_hostname" {
  value = azurerm_linux_virtual_machine.linux_vm[*].computer_name
}

output "vm_dnsname" {
  value = azurerm_public_ip.public_ip.domain_name_label
}

output "private_ip" {
  value = azurerm_linux_virtual_machine.linux_vm[*].private_ip_address
}

output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_addr_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet_1_name" {
  value = azurerm_subnet.subnet1.name
}

output "subnet_2_name" {
  value = azurerm_subnet.subnet2.name
}

output "subnet_1_addr_space" {
  value = azurerm_subnet.subnet1.address_prefixes
}

output "subnet_2_addr_space" {
  value = azurerm_subnet.subnet2.address_prefixes  
}
