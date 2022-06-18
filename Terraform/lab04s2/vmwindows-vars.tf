# Variables for Windows VM resources

variable "windows_name" {
  type =  map(string)
  default = {
    n01518034-w-vm1 = "Standard_B1s"
    n01518034-w-vm2 = "Standard_B1ms"
  }
  description = "This property defines all the properties of the VM"
}

variable "win_admin_uname" {
  default = "Leena-N01518034"
}

variable "win_admin_paswd" {
  default = "Leena-N01518034"
}

variable "win_os_disk_attr" {
  type = map(string)
  default = {
    os_storage_account_type = "StandardSSD_LRS"
    os_disk_size            = "128"
    os_disk_caching         = "ReadWrite"
  }
}

variable "win_os_info" {
  type = map(string)
  default = {
    win_publisher = "MicrosoftWindowsServer"
    win_offer     = "WindowsServer"
    win_sku       = "2016-Datacenter"
    win_version   = "latest"
  }
  description = "This variable defines the attributes of the OS we use in our VM"
}

# Variable for Availability Set
variable "windows_avs" {
  default  = "windows_avs"
}