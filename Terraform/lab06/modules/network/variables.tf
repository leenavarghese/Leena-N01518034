# Variables for network module

variable "vnet" {
  description = "This is the virtual network. "
}

variable "resource_group" {
  description = "This is the resource group where all the resources will be deployed"
}

variable "location" {
  description = "This is the location where all the infrastructure will be deployed"
}

variable "vnet_addr_space" {
  description = "This is the address range for the virtual network"
}

variable "subnet_1" {
  description = "This is the name of the first subnet "
}

variable "sub1_addr_space" {
  # type        = list(string)
  description = "This defines the address space of the first subnet"
}

variable "subnet_2" {
  description = "This is the name of the second subnet "
}

variable "sub2_addr_space" {
  # type        = list(string)
  description = "This defines the address space of the second subnet"
}

variable "nsg_1" {
  description = "This is the name for first network security group"
}

variable "nsg_2" {
  description = "This is the name for second network security group"
}

