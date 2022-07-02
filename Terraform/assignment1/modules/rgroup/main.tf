# Create the Resource Group 
resource "azurerm_resource_group" "resource_grp" {
  name     = var.rg_name
  location = var.location
  tags     = var.resource_tags
}