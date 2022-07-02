# The module should return the hostname, domain names,
# private IP address, and public IP address of the VM to the root module

output "win_vm_hostname_out" {
  value = azurerm_windows_virtual_machine.windows_vm.computer_name
}

output "win_vm_domainnames_out" {
  value = azurerm_public_ip.public_ip.fqdn
}

output "win_vm_private_ip_out" {
  value = azurerm_windows_virtual_machine.windows_vm.private_ip_address
}

output "win_rm_public_ip_out" {
  value = azurerm_windows_virtual_machine.windows_vm.public_ip_address
}

output "win_vm_id_out" {
  value = azurerm_windows_virtual_machine.windows_vm.id
}


