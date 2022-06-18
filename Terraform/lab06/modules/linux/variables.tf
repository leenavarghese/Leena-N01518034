# Variables for Linux Module

#Locals
locals {
  lab06_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01354572@humber.ca"
    Environment  = "Lab"
  }
}

# Variables for Availability Set
variable "linux_avs" { 
    description = "This is for Linux Availability Set"
}

variable "location" {
    description = "This is the location where all the infrastructure will be deployed"
}

variable "resource_group" {
    description = "This is the resource group where all resources will be deployed"  
}

# Variable for Count
variable "nb_count" {
  description = "This is the count metadata which will be used while creating resources"
}

# Variable for Virtual Machine Resouces
variable "linux_name" {
  # default = "lab02s3-db1-u-vm1"
}

variable "size" {
  # default = "Standard_B1s"
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

# Variable related to network in VM
variable "subnet_id" {

}

