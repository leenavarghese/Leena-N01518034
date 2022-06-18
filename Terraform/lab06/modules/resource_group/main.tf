# Create a Resorce Group for Networking
resource "azurerm_resource_group" "network_RG" {
  name     = var.network_rg
  location = var.location
}

# Create a Resorce Group for Linux
resource "azurerm_resource_group" "linux_RG" {
  name     = var.linux_rg
  location = var.location
}
# Create a Resorce Group for Windows
resource "azurerm_resource_group" "windows_RG" {
  name     = var.windows_rg
  location = var.location
}