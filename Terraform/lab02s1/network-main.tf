# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.6.0"
    }
  }
  required_version = "~> 1.1.9"
}

# Create a resource group
resource "azurerm_resource_group" "rg1" {
  name     = "network-rg"
  location = "eastasia"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "network-vnet"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["10.0.0.0/16"]
}

# Create a subnet1
resource "azurerm_subnet" "subnet1" {
  name                 = "network-subnet1"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a security group with an inbound allow TCP rule for port 22 called rule1 with priority 100
resource "azurerm_network_security_group" "nsg1" {
  name                = "network-nsg1"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    destination_port_range     = "22"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create a subnet association to attach the network security group network-nsg1 to network-subnet1
resource "azurerm_subnet_network_security_group_association" "nsg1_association" {
  network_security_group_id = azurerm_network_security_group.nsg1.id
  subnet_id                 = azurerm_subnet.subnet1.id
}

# Create a subnet2
resource azurerm_subnet "subnet2" {
    name                 = "network-subnet2"
    resource_group_name  = azurerm_resource_group.rg1.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = ["10.0.2.0/24"]
}

# Create a security group with two inbound allow TCP rules for port 3389 called rule1 with priority 100 and for port 5985 called rule2 
# with priority 200
resource azurerm_network_security_group "nsg2" {
    name = "network-nsg2"
    resource_group_name = azurerm_resource_group.rg1.name
    location            = azurerm_resource_group.rg1.location

    security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    destination_port_range     = "3389"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    destination_port_range     = "5985"
    source_port_range          = "*"  
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

# Create a subnet association to attach the network security group network-nsg2 to network-subnet2
resource "azurerm_subnet_network_security_group_association" "nsg2_association" {
  network_security_group_id = azurerm_network_security_group.nsg2.id
  subnet_id                 = azurerm_subnet.subnet2.id
}