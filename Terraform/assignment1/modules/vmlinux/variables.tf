## Variables for Linux Module

variable "rg_name" {
  description = "This variable will store the name of the Resource Group (passed from root module, comes from rgroup module) "  
}

variable "location" {
  description = "This variable will store the location where the Resource Group will be created (passed from root module, comes from rgroup module) " 
}

variable "resource_tags" {
  description = "This variable will store the value of tags which will be assigned to the all the resources in this module (passed from root module)"
}

variable "linux_avs_name" {
  description = "This variable will store the name of Linux Availability Set (passed from root module)"
}

variable "linux_admin_uname" {
  default     = "Leena-N01518034"
  description = "This variable will store the user name of Linux VM (passed from root module)" 
}

variable "linux_admin_paswd" {
  default     = "Leena-N01518034"
  description = "This variable will store the password of Linux VM (passed from root module)" 
}

variable "vm_count" {
  description = "This variable will store the count of the VMs that will be created (passed from root module)"
}

variable "linux_name" {
  description = "This variable will store the name of the VMs that will be created (passed from root module)"  
}

variable "subnet_id" {
  description = "This variable will store the ID of the subnet which is required in the Network Interfaces (passed from root module, comes from network module)"
}

variable "boot_diagnostics_storage_endpoint" {
  description = "This variable will store the blob endpoint for boot diagnostics (passed from root module, created in common module)"  
}

variable "linux_vm_size" {
  description = "This variable will store the vm size (passed from root module, created in common module)"     
}

variable "linux_os_info" {
  type        = map(string)
  default     = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "8.2.2020062400"
  }

  description = "This variable defines the attributes of the OS which we will installed on the created Virtual Machines"
}

variable "linux_os_disk" {
  type           = map(string)
  default        = {
    account_type = "Standard_LRS"
    disk_size    = "32"
    caching      = "ReadWrite"
  }
  description    = "This variable defines all the attribute of the OS disk"
}

variable "extension_properties" {
  type                   = map(string)
  default                = {
    name                 = "Network_Watcher_8034"
    publisher            = "Microsoft.Azure.NetworkWatcher"
    type                 = "NetworkWatcherAgentLinux"
    type_handler_version = "1.4"
  }
  description            = "This variable stores all the properties required for the Network Watcher Extension."
}
