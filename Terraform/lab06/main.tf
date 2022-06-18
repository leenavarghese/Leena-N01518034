# Definition for the resource Group Module 
module "resource_group" {
  source     = "./modules/resource_group"
  network_rg = "Network_RG"
  linux_rg   = "Linux_RG"
  windows_rg = "Windows_RG"
  location   = "eastasia"
}

# Definition for the Network Module
module "network"{
  source          = "./modules/network"
  resource_group  = module.resource_group.network_rg
  location        = "eastasia"
  vnet_addr_space = ["10.0.0.0/16"]
  vnet            = "network-vnet"
  subnet_1        = "network-subnet1"
  sub1_addr_space = ["10.0.1.0/24"]
  subnet_2        = "network-subnet2"
  sub2_addr_space = ["10.0.2.0/24"]
  nsg_1           = "network-nsg1"
  nsg_2           = "network-nsg2"
}

# Definition for the Linux VM Module
module "linux" {
  source          = "./modules/linux"
  resource_group  = module.resource_group.linux_rg
  location        = "eastasia"
  linux_avs       = "Linux_AVS"
  nb_count        = 2
  linux_name      = "n01518034-db1-u"
  size            = "Standard_B1s"
  subnet_id       = module.network.subnet_id 
}

# Definition for the Windows Module
module "windows"{
  source            = "./modules/windows"
  resource_group    = module.resource_group.windows_rg
  location          = "eastasia"
  windows_avs       = "Windows_AVS"
  windows_name      = {
    n01518034-w-vm1 = "Standard_B1s"
    n01518034-w-vm2 = "Standard_B1ms"
  }
  subnet2_id        = module.network.subnet2_id
}