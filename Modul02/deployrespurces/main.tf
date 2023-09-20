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
  name     = var.rgname
  location = "West Europe"
}

resource "azurerm_storage_account" "sa-demo06" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.rgwe006.name
  location                 = azurerm_resource_group.rgwe006.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
  }
}

resource "azurerm_network_security_group" "nsg006" {
  name                = var.nsg
  location            = azurerm_resource_group.rgwe006.location
  resource_group_name = azurerm_resource_group.rgwe006.name
}

resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet
  location            = azurerm_resource_group.rgwe006.location
  resource_group_name = azurerm_resource_group.rgwe006.name
  address_space       = ["10.10.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = var.snname01
    address_prefix = var.snapfix01
  }

  subnet {
    name           = var.snname02
    address_prefix = var.snapfix02
    security_group = azurerm_network_security_group.nsg006.id
  }

  tags = {
  }
}