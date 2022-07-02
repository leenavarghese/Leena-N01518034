## Variables for Datadisk Module
locals {
  vm_ids      = concat(var.linux_vm_ids, [var.windows_vm_id])
  description = "This variable will store the ids of Linux and Windows VM"
}

variable "linux_vm_ids" {
  description = "This variable will store the id of Linux VMs that are created (passed from the root module, comes from vmlinux module)"
}

variable "windows_vm_id" {
  description = "This variable will store the id of Windows VM that are created (passed from the root module, comes from vmwindows module)"
}

variable "data_disk_count" {
  description = "This variable will store the count of the data disks that will be created (passed from the root module)"  
}

variable "data_disk_name" {
  description = "This variable will store the name of the data disk that will be created (passed from the root module)" 
}

variable "rg_name" {
  description = "This variable will store the name of the Resource Group (passed from the root module, comes from rgroup module) "
}

variable "location" {
  description = "This variable will store the location where the Resource Group will be created (passed from the root module, comes from rgroup module) "  
}

variable "resource_tags" {
  description = "This variable will store the value of tags which will be assigned to the all the resources in this module (passed from the root module)"  
}

variable "data_disk_properties" {
  type = map(string)
  description = "This variable defines the attributes of the data disk which we will attached to the  Virtual Machines (passed from the root module)"
}

variable "data_disk_attach_properties" {
  type = map(string)
  default = {
    lun     = "0"
    caching = "None"
  }
  description = "This variable stores some of the properties of the data disk attachment resource"
}