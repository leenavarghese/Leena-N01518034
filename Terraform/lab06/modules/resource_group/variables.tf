## Variables for Resource Goup Module

variable "network_rg" {
  description = "This resource group is for Network Resource"
}

variable "linux_rg" {
  description = "This resource group is for Linux Resource"
}

variable "windows_rg" {
  description = "This resource group is for Windows Resource"
}

variable "location" {
  description = "This is for the location where all the resources will be provisioned"
}