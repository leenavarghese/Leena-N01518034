# VARIABLES FOR VIRTUAL MACHINE RESOURCES

variable "linux_name" {
  default = "lab02s3-db1-u-vm1"
}

variable "size" {
  default = "Standard_B1s"
}

variable "admin_uname" {
  default = "Leena-N01518034"
}

variable "admin_paswd" {
  default = "Leena-N01518034"
}

variable "os_disk_attr" {
  type = map(string)
  default = {
    os_storage_account_type = "Premium_LRS"
    os_disk_size            = "32"
    os_disk_caching         = "ReadWrite"
  }
}

variable "ubuntu_linux_os_info" {
  type = map(string)
  default = {
    linux_publisher = "Canonical"
    linux_offer     = "UbuntuServer"
    linux_sku       = "19.04"
    linux_version   = "latest"
  }
}