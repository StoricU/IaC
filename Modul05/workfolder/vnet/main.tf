resource "azurerm_virtual_network" "vnet-demo" {
  name                = "vnet-${var.base_name}"
  location            = var.location
  resource_group_name = var.rgname
  address_space       = ["10.2.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  tags                = var.tags
}

resource "azurerm_subnet" "sn-module" {
  name                 = "subnet1"
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vnet-demo.name
  address_prefixes     = ["10.2.1.0/24"]
  


}

resource "azurerm_network_security_group" "nsg-demo-jm" {
  name                = "nsg-sn01-${var.base_name}"
  location            = var.location
  resource_group_name = var.rgname
  tags                = var.tags

  security_rule {
    name                       = "Allow-Public-IP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "85.89.28.144"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.sn-module.id
  network_security_group_id = azurerm_network_security_group.nsg-demo-jm.id
  
}

resource "azurerm_public_ip" "pip-linux" {
  name                = "pIP-Linux"
  resource_group_name = var.rgname
  location            = var.location
  allocation_method   = "Static"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic-linux" {
  name                = "nic-Linux"
  location            = var.location
  resource_group_name = var.rgname
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sn-module.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip-linux.id
  }
}
