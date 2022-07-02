## Variables for Loadbalancer Module

variable "rg_name" {
  description = "This variable will store the name of the Resource Group (passed from the root module, comes from rgroup module) "
}

variable "location" {
  description = "This variable will store the location where the Resource Group will be created (passed from the root module, comes from rgroup module) "
}

variable "resource_tags" {
  description = "This variable will store the value of tags which will be assigned to the all the resources in this module (passed from the root module)"
}

variable "lb_name" {
  description = "This variable will store the name of the Load Balancer (passed from the root module)"
}

variable "linux_vm_nics" {
  description = "This variable will store the linux nics (passed from the root module, comes from the vmlinux module)"
}

