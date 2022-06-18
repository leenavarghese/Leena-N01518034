# Resource block for Windows Availability Set
resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = azurerm_resource_group.rg1.name
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
  tags                         = local.lab03_tags
}

# Resource block for network interface
resource "azurerm_network_interface" "win_ntwrk_interface" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  tags                = local.lab03_tags

  ip_configuration {
    name                          = "${each.key}-ip"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.win_public_ip[each.key].id
  }
}

# Resource block for public ip address
resource "azurerm_public_ip" "win_public_ip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${each.key}"
  depends_on          = [
     azurerm_resource_group.rg1
  ]
  tags                = local.lab03_tags
}

# Resource block to create Windows VM
resource "azurerm_windows_virtual_machine" "windows_vm" {
  for_each                        = var.windows_name 
  name                            = each.key
  resource_group_name             = azurerm_resource_group.rg1.name
  location                        = azurerm_resource_group.rg1.location
  size                            = each.value
  admin_username                  = var.win_admin_uname
  admin_password                  = var.win_admin_paswd
  tags                            = local.lab03_tags
  depends_on                      = [
    azurerm_resource_group.rg1   
  ]

  network_interface_ids = [
    azurerm_network_interface.win_ntwrk_interface[each.key].id
  ]

  os_disk {
    name                 = "${each.key}-osdisk"
    caching              = var.win_os_disk_attr.os_disk_caching
    storage_account_type = var.win_os_disk_attr.os_storage_account_type
    disk_size_gb         = var.win_os_disk_attr.os_disk_size
  }

  source_image_reference {
    publisher = var.win_os_info.win_publisher
    offer     = var.win_os_info.win_offer
    sku       = var.win_os_info.win_sku
    version   = var.win_os_info.win_version
  }

  winrm_listener {
    protocol  = "Http"
  }
}