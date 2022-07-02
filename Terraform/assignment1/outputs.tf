# rgroup module outputs
output "rg_name" {
  value       = module.rgroup.rg_name_out
  description = "This output variable will output the  name of the Resource Group created"
}

output "location" {
  value       = module.rgroup.location_out
  description = "This output variable will output the Location in which all the resources will be deployed"
}

# network module outputs
output "vnet_name" {
  value       = module.network.vnet_name_out
  description = "This output variable will output the name of the Virtual Network"
}

output "subnet_name" {
  value = module.network.subnet_name_out
  description = "This output variable will output the naame of the Subnet created"
}

# common module outputs
output "log_analytics_workspace_name" {
  value = module.common.log_analytics_workspace_out
}

output "recovery_svc_vault_name" {
  value = module.common.recovery_svc_vault_name_out
}

output "storage_account_name" {
  value = module.common.storage_account_name_out
}

output "storage_account_blob_endpoint" {
  value = module.common.storage_account_blob_endpoint_out
}

# Linux VM module outputs
output "linux_vm_hostnames" {
  value = module.vmlinux.linux_vm_hostnames_out
}

output "linux_vm_domainnames" {
  value = module.vmlinux.linux_vm_domainnames_out
}

output "linux_vm_private_ips" {
  value = module.vmlinux.linux_vm_private_ips_out
}

output "linux_vm_public_ips" {
  value = module.vmlinux.linux_vm_public_ips_out
}

# Windows VM module outputs
output "win_vm_hostname" {
  value = module.vmwindows.win_vm_hostname_out
}

output "win_vm_domainnames" {
  value = module.vmwindows.win_vm_domainnames_out
}

output "win_vm_private_ip" {
  value = module.vmwindows.win_vm_private_ip_out
}

output "win_rm_public_ip" {
  value = module.vmwindows.win_rm_public_ip_out
}

# loadbalancer module outputs
output "load_balancer_name" {
  value       = module.loadbalancer.load_balancer_name_out
  description = "This output variable will output the name of the Load Balancer"
}

# database module outputs
output "database_name" {
  value       = module.database.postgres_db_name_out
  description = "This output variable will output the name of the PostgreSQL Database"
}

output "load_balancer_FQDN" {
  value       = module.loadbalancer.load_balancer_FQDN_out
  description = "This output variable will output the FQDN of the Load Balancer"
}