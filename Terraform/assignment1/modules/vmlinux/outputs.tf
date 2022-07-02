#  The module should return the hostnames, domain names, private IP addresses, and public
# IP addresses of the VMs to the root module

output "linux_vm_hostnames_out" {
    value = azurerm_linux_virtual_machine.linux_vm[*].computer_name  
}

output "linux_vm_domainnames_out" {
  value = azurerm_public_ip.public_ip[*].fqdn
}

output "linux_vm_private_ips_out" {
  value = azurerm_linux_virtual_machine.linux_vm[*].private_ip_address
}

output "linux_vm_public_ips_out" {
  value = azurerm_linux_virtual_machine.linux_vm[*].public_ip_address
}

# To be used in Data Disk Module
output "linux_vm_ids_out" {
  value = azurerm_linux_virtual_machine.linux_vm[*].id
}

# To be used in Load Balancer Module
output "vm_nics_out" {
  value = azurerm_network_interface.network_interface[*]
}
