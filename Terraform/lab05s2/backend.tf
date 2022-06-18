terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate8034RG"
    storage_account_name = "tfstate8034sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}