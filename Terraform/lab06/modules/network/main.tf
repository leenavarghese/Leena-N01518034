# Create a Virtual Network within the resource group
resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet
    resource_group_name = var.resource_group
    location            = var.location
    address_space       = var.vnet_addr_space
}

# Create subnet1
resource "azurerm_subnet" "subnet1" {
    name                 = var.subnet_1
    resource_group_name  = var.resource_group
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes       = var.sub1_addr_space
}

# Create subnet2
resource "azurerm_subnet" "subnet2" {
    name                 = var.subnet_2
    resource_group_name  = var.resource_group
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes       = var.sub2_addr_space
}

# Create Network Security Group1
resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg_1
  resource_group_name = var.resource_group
  location            = var.location

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

# Create Network Security Group 2
resource "azurerm_network_security_group" "nsg2" {
  name                = var.nsg_2
  resource_group_name = var.resource_group
  location            = var.location

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

# Create NSG association for subnet1
resource "azurerm_subnet_network_security_group_association" "nsg1_association" {
  network_security_group_id = azurerm_network_security_group.nsg1.id
  subnet_id                 = azurerm_subnet.subnet1.id
}

# Create NSG association for subnet2
resource "azurerm_subnet_network_security_group_association" "nsg2_association" {
  network_security_group_id = azurerm_network_security_group.nsg2.id
  subnet_id                 = azurerm_subnet.subnet2.id
}