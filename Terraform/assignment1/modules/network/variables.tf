## Variables for Network Module 

variable "vnet_name" {
  description = "This variable will store the name of the Virtual Network (passed from the root module)"  
}

variable "rg_name" {
  description = "This variable will store the name of the Resource Group (passed from the root module, comes from rgroup module) " 
}

variable "location" {
  description = "This variable will store the location where the Resource Group will be created (passed from the root module, comes from rgroup module) "  
}

variable "vnet_address_space" {
  description = "This variable will store the address space of the Virtual Network (passed from the root module)"   
}

variable "resource_tags" {
  description = "This variable will store the value of tags which will be assigned to the Resource Group (passed from the root module)"
}

variable "subnet_name" {
  description = "This variable will store the name of the Subnet (passed from the root module)"  
}

variable "subnet_addr_space" {
  description = "This variable will store the address space of the Subnet (passed from the root module)"  
}