# Outputs for Linux VM Module

output "vm_hostname" {
    value = azurerm_linux_virtual_machine.linux_vm[*].computer_name  
}

output "private_ip" {
    value = azurerm_linux_virtual_machine.linux_vm[*].private_ip_address
}

output "public_ip" {
    value = azurerm_linux_virtual_machine.linux_vm[*].public_ip_address
}

output "vm_dns_names" {
    value = azurerm_public_ip.public_ip[*].fqdn
}