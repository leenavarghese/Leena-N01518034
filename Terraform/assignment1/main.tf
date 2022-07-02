module "rgroup" {
  source        = "./modules/rgroup"
  rg_name       = "8034-assignment1-RG"
  location      = "eastasia"
  resource_tags = local.resource_tags
}

module "network" {
  source             = "./modules/network"
  rg_name            = module.rgroup.rg_name_out
  location           = module.rgroup.location_out
  vnet_name          = "vnet_8034"
  vnet_address_space = ["10.0.0.0/16"]
  subnet_name        = "subnet-8034"
  subnet_addr_space  = ["10.0.1.0/24"]
  resource_tags      = local.resource_tags
}

module "common" {
  source                       = "./modules/common"
  rg_name                      = module.rgroup.rg_name_out
  location                     = module.rgroup.location_out 
  resource_tags                = local.resource_tags
  log_analytics_workspace_name = "log-analytics-workspace-8034"
  storage_acc_properties       = {
    name                       = "storageaccount8034"
    account_tier               = "Standard"
    account_replication_type   = "LRS"
  }
  recovery_svc_vault           = {
    name                       = "recovery-service-vault-8034"
    sku                        = "Standard"
    storage_mode_type          = "LocallyRedundant"
  }
}

module "vmlinux" {
  source                            = "./modules/vmlinux"
  rg_name                           = module.rgroup.rg_name_out
  location                          = module.rgroup.location_out 
  resource_tags                     = local.resource_tags
  linux_avs_name                    = "linux-AVS-8034"
  vm_count                          = 2
  linux_name                        = "linux-8034"
  linux_vm_size                     = "Standard_B1s"
  subnet_id                         = module.network.subnet_id_out
  boot_diagnostics_storage_endpoint = module.common.storage_account_blob_endpoint_out
}

module "vmwindows" {
  source                            = "./modules/vmwindows"
  rg_name                           = module.rgroup.rg_name_out
  location                          = module.rgroup.location_out 
  resource_tags                     = local.resource_tags
  windows_avs_name                  = "windows-AVS-8034"
  win_name                          = "window8034"
  win_vm_size                       = "Standard_B1ms"
  boot_diagnostics_storage_endpoint = module.common.storage_account_blob_endpoint_out
  subnet_id                         = module.network.subnet_id_out
}

module "datadisk" {
  source              = "./modules/datadisk"
  rg_name = module.rgroup.rg_name_out
  location            = module.rgroup.location_out
  resource_tags       = local.resource_tags
  data_disk_count     = 3
  data_disk_name      = "data_disk8034"
  data_disk_properties = {
    storage_account_type = "Standard_LRS"
    create_option        = "Empty"
    disk_size_gb         = "10"
  }
  linux_vm_ids  = module.vmlinux.linux_vm_ids_out
  windows_vm_id = module.vmwindows.win_vm_id_out
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  rg_name = module.rgroup.rg_name_out
  location            = module.rgroup.location_out
  resource_tags       = local.resource_tags
  lb_name  = "load-balancer8034"
  linux_vm_nics       = module.vmlinux.vm_nics_out
}

module "database" {
  source              = "./modules/database"
  rg_name = module.rgroup.rg_name_out
  location            = module.rgroup.location_out
  resource_tags       = local.resource_tags
  name                = "postgres-8034"
  server_sku_name     = "B_Gen5_1"
}