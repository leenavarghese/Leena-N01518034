## Variables for Common Module

variable "rg_name" {
  description = "This variable will store the name of the Resource Group (passed from the root module, comes from rgroup module) "
}

variable "location" {
  description = "This variable will store the location where the Resource Group will be created (passed from the root module, comes from rgroup module) "
}

variable "resource_tags" {
  description = "This variable will store the value of tags which will be assigned to the Resource Group (passed from the root module)"
}

variable "log_analytics_workspace_name" {
  description = "This variable will store the name of the Log Analytics Workspace (passed from the root module)"
}

variable "recovery_svc_vault" {
  type        = map(string)
  description = "This variable will store the properties related to the Recovery Service Vault (passed from the root module)"
}

variable "storage_acc_properties" {
  type = map(string)
  description = "This variable stores the properties required by the Storage Account resource"
}