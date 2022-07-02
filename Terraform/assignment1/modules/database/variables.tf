## Variables for Database Module

variable "rg_name" {
  description = "This variable will store the name of the Resource Group (passed from the root module, comes from rgroup module)"
}

variable "location" {
  description = "This variable will store the location where the Resource Group will be created (passed from the root module, comes from rgroup module)"
}

variable "resource_tags" {
  description = "This variable will store the value of tags which will be assigned to the all the resources in this module (passed from the root module)"
}

variable "name" {
  description = "This variable will store the name which will be used for server and database (passed from the root module)"
}

variable "server_sku_name" {
  description = "This variable will store the SKU of the PostgreSQL Server (passed from the root module)"
}

variable "server_properties" {
  type                      = map(string)
  description               = "This variable stores the value of the PostgreSQL Server"
  default                   = {
    version                 = 11
    ssl_enforcement_enabled = "true"
  }
}

variable "db_properties" {
  type        = map(string)
  default     = {
    charset   = "UTF8"
    collation = "English_United States.1252"
  }
  description = "This variable stores the value of the PostgreSQL Database"
}

variable "admin_logon_details" {
  default    = {
    username = "LeenaN01518034"
    password = "Leena-N01518034"
  }
}