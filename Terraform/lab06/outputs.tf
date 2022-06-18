## Output for Main Module

#Output for Resorce Group Module
output "network_rg" {
  value = module.resource_group.network_rg
}

output "linux_rg" {
  value = module.resource_group.linux_rg
}

output "windows_rg" {
  value = module.resource_group.windows_rg
}

#Output for Network Module

output "vnet_name" {
  value = module.network.vnet_name
}

output "vnet_addr_space" {
  value = module.network.vnet_addr_space
}

output "subnet_1_name" {
  value = module.network.subnet_1_name
}

output "subnet_1_addr_space" {
  value = module.network.subnet_1_addr_space
}

output "subnet_2_name" {
  value = module.network.subnet_2_name
}

output "subnet_2_addr_space" {
  value = module.network.subnet_2_addr_space
}

#Output for Linux VM Module
output "vm_hostname" {
  value = module.linux.vm_hostname  
}

output "linux_private_ip" {
  value = module.linux.private_ip  
}

output "linux_public_ip" {
  value = module.linux.public_ip
}

output "linux_vm_dns_names" {
  value = module.linux.vm_dns_names
}

#Output for Windows VM Module
output "win_vm_hostname" {
  value = module.windows.win_vm_hostname
}

output "win_vm_dnsname" {
  value = module.windows.win_vm_dnsname
}

output "win_private_ip" {
  value = module.windows.win_private_ip
}

output "win_public_ip" {
  value = module.windows.win_public_ip
}
