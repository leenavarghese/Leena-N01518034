## This file contains the output values for the resources

# Output variables for Linux VM
output "vm_hostname" {
  value = azurerm_linux_virtual_machine.linux_vm[*].computer_name
}

output "vm_dnsname" {
  value = azurerm_public_ip.public_ip[*].domain_name_label
}

output "private_ip" {
  value = azurerm_linux_virtual_machine.linux_vm[*].private_ip_address
}

output "public_ip" {
  value = azurerm_linux_virtual_machine.linux_vm[*].public_ip_address
}

output "linux_availability_set" {
  value =  azurerm_availability_set.linux_avs.name
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

# Output variables for Win VM
output "win_vm_hostname" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].computer_name
}

output "win_vm_dnsname" {
  value = values(azurerm_public_ip.win_public_ip)[*].domain_name_label
}

output "win_private_ip" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].private_ip_address
}

output "win_public_ip" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].public_ip_address
}

output "win_network_interfaces" {
  value = values(azurerm_network_interface.win_ntwrk_interface)[*].name
}

output "windows_availability_set" {
  value =  azurerm_availability_set.windows_avs.name
}
