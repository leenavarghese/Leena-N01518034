resource azurerm_resource_group "rg1" {
    name     = var.rg_name
    location = var.location
}

resource azurerm_virtual_network "vnet" {
    name                = var.vnet_name
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
    address_space       = var.vnet_addr_space
}

resource azurerm_subnet "subnet1" {
    name                  = var.subnet1
    resource_group_name   = azurerm_resource_group.rg1.name
    virtual_network_name  = azurerm_virtual_network.vnet.name
    address_prefixes      = var.subnet1_addr
}

resource azurerm_network_security_group "nsg1" {
    name                = var.nsg1
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

resource "azurerm_subnet_network_security_group_association" "nsg1_association" {
  network_security_group_id = azurerm_network_security_group.nsg1.id
  subnet_id                 = azurerm_subnet.subnet1.id
}

resource azurerm_subnet "subnet2" {
    name                 = var.subnet2
    resource_group_name  = azurerm_resource_group.rg1.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = var.subnet2_addr
}

resource azurerm_network_security_group "nsg2" {
    name                = var.nsg2
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

resource "azurerm_subnet_network_security_group_association" "nsg2_association" {
  network_security_group_id = azurerm_network_security_group.nsg2.id
  subnet_id = azurerm_subnet.subnet2.id
}