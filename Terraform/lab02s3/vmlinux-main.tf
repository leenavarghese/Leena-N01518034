# Resource block for network interface
resource "azurerm_network_interface" "ntwrk_interface" {
  name                = "${var.linux_name}-nic"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig1"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Resource block for public ip address
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.linux_name}-pip"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  allocation_method   = "Dynamic"
  domain_name_label   = var.linux_name
}

# Resource block to create linux VM
resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                            = var.linux_name
  resource_group_name             = azurerm_resource_group.rg1.name
  location                        = azurerm_resource_group.rg1.location
  size                            = var.size
  admin_username                  = var.admin_uname
  admin_password                  = var.admin_paswd
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.ntwrk_interface.id,
  ]

  os_disk {
    name                 = "${var.linux_name}-os-disk"
    caching              = var.os_disk_attr.os_disk_caching
    storage_account_type = var.os_disk_attr.os_storage_account_type
    disk_size_gb         = var.os_disk_attr.os_disk_size
  }

  source_image_reference {
    publisher = var.ubuntu_linux_os_info.linux_publisher
    offer     = var.ubuntu_linux_os_info.linux_offer
    sku       = var.ubuntu_linux_os_info.linux_sku
    version   = var.ubuntu_linux_os_info.linux_version
  }
}