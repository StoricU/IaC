terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}


resource "azurerm_resource_group" "rgwe006" {
  count    = length(var.rgname)
  name     = var.rgname[count.index]
  location = var.location
  tags     = local.tags
}

resource "azurerm_storage_account" "sa-demo06" {
  count                    = length(var.saname)
  name                     = var.saname[count.index]
  resource_group_name      = azurerm_resource_group.rgwe006[1].name
  location                 = azurerm_resource_group.rgwe006[1].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.tags
}

resource "azurerm_network_security_group" "nsg006" {
  count               = length(var.nsgname)
  name                = var.nsgname[count.index]
  resource_group_name = azurerm_resource_group.rgwe006[0].name
  location            = azurerm_resource_group.rgwe006[0].location

}

resource "azurerm_virtual_network" "prod" {
  count               = length(var.vnetname)
  name                = var.vnetname[count.index]
  resource_group_name = azurerm_resource_group.rgwe006[0].name
  location            = azurerm_resource_group.rgwe006[0].location
  address_space       = [var.addspace[0]]
  tags                = local.tags

  subnet {
    name           = "productions"
    address_prefix = "10.2.1.0/24"
    security_group = azurerm_network_security_group.nsg006[count.index].id
  }
  subnet {
    name           = "development"
    address_prefix = "10.2.2.0/24"
    security_group = azurerm_network_security_group.nsg006[count.index].id
  }
}






