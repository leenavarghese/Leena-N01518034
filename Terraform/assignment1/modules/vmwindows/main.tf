# Creating Availability Set for Windows VM
resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs_name
  resource_group_name          = var.rg_name
  location                     = var.location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = var.resource_tags     
}

# Creating Windows VM
resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                            = "${var.win_name}-vm"
  resource_group_name             = var.rg_name
  location                        = var.location
  size                            = var.win_vm_size
  availability_set_id             = azurerm_availability_set.windows_avs.id
  admin_username                  = var.win_admin_uname
  admin_password                  = var.win_admin_paswd
  network_interface_ids           = [azurerm_network_interface.network_interface.id]
  tags                            = var.resource_tags  
  boot_diagnostics {
    storage_account_uri           = var.boot_diagnostics_storage_endpoint
  } 
  os_disk {
    name                          = "${var.win_name}-osdisk"
    caching                       = var.win_os_disk.caching
    storage_account_type          = var.win_os_disk.account_type
    disk_size_gb                  = var.win_os_disk.disk_size  
  }
  source_image_reference {
    publisher                     = var.win_os_info.publisher
    offer                         = var.win_os_info.offer
    sku                           = var.win_os_info.sku
    version                       = var.win_os_info.version
  }
}

# Creating a Network Interface for the VM
resource "azurerm_network_interface" "network_interface" {
  name                            = "${var.win_name}-nic"
  location                        = var.location
  resource_group_name             = var.rg_name
  tags                            = var.resource_tags    
  ip_configuration {
    name                          = "${var.win_name}-ip"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Creating public ip address for the VM
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.win_name}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.resource_tags      
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.win_name}"
}

# Resource block to install Antimalware Extension on the created VM
resource "azurerm_virtual_machine_extension" "antimalware_ext" {
  name                 =  var.extension_properties.name
  virtual_machine_id   = azurerm_windows_virtual_machine.windows_vm.id
  publisher            = var.extension_properties.publisher
  type                 = var.extension_properties.type
  type_handler_version = var.extension_properties.type_handler_version
  depends_on           = [
    azurerm_windows_virtual_machine.windows_vm
  ]
}