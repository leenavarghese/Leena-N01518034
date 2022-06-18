# Outputs for Windows Module
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
