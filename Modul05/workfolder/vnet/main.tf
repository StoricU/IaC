resource "azurerm_virtual_network" "vnet-demo" {
  name                = "vnet-${var.base_name}"
  location            = var.location
  resource_group_name = var.rgname
  address_space       = ["10.2.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "sn-module" {
  name                 = "subnet1"
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vnet-demo.name
  address_prefixes       = ["10.2.1.0/24"]


}

resource "azurerm_network_security_group" "nsg-demo-jm" {
  name                = "nsg-sn01-${var.base_name}"
  location            = var.location
  resource_group_name = var.rgname

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
