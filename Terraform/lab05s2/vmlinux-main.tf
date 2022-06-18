# Resource block for Linux Availability Set
resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = azurerm_resource_group.rg1.name
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
  tags                         = local.lab03_tags
}

# Resource block for network interface
resource "azurerm_network_interface" "ntwrk_interface" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic-${format("%1d", count.index + 1)}"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  tags                = local.lab03_tags

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig1-${format("%1d", count.index + 1)}"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.public_ip[*].id, count.index + 1)
  }
}

# Resource block for public ip address
resource "azurerm_public_ip" "public_ip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.linux_name}-${format("%1d", count.index + 1)}"
  depends_on = [
    azurerm_resource_group.rg1
  ]
  tags = local.lab03_tags
}

# Resource block to create linux VM
resource "azurerm_linux_virtual_machine" "linux_vm" {
  count                           = var.nb_count
  name                            = "${var.linux_name}-${format("%1d", count.index + 1)}"
  resource_group_name             = azurerm_resource_group.rg1.name
  location                        = azurerm_resource_group.rg1.location
  size                            = var.size
  admin_username                  = var.admin_uname
  admin_password                  = var.admin_paswd
  disable_password_authentication = false
  tags                            = local.lab03_tags
  depends_on = [
    azurerm_resource_group.rg1
  ]

  network_interface_ids = [
    element(azurerm_network_interface.ntwrk_interface[*].id, count.index + 1),
  ]

  os_disk {
    name                 = "${var.linux_name}-osdisk-${format("%1d", count.index + 1)}"
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