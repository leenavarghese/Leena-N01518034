# Variables for Windows Module

# Locals
locals {
  lab06_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01354572@humber.ca"
    Environment  = "Lab"
  }
}

variable "resource_group" {
  description = "This is the resource group where all the resources will be deployed"
}

variable "location" {
  description = "This is the location where all the resources will be deployed"
}

# Variable for windows availability set
variable "windows_avs" {
  
}

# Variables for Virtual Machine Resources
variable "windows_name" {
  description = "This variable defines all the properties of the Virtual Machine "
}

variable "win_admin_uname" {
  description = "This is the username for windows VM"
  default = "Leena-N01518034"
}

variable "win_admin_paswd" {
  description = "This is the password for windows VM"
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

variable "subnet2_id" {
  
}
