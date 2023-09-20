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

variable "location" {
  type        = string
  description = "Lokasjon for ressursene"
  default     = "West Europe"
}

variable "rgname" {
  type        = string
  description = "Navn på resource group"
  default     = "rg-jma-terraform"
}

variable "saname" {
  type        = string
  description = "Storage account name"
}

variable "vnet" {
  type        = string
  description = "Navn på Vnet"
  default     = "vnet-jma-01-we"
}

variable "nsg" {
  type        = string
  description = "(optional) describe your variable"
  default     = "nsg-vnet006-we"
}


resource "azurerm_resource_group" "rgwe006-01" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "sa006" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.rgwe006.name
  location                 = azurerm_resource_group.rgwe006.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
  }
}

resource "azurerm_network_security_group" "nsg006-01" {
  name                = var.nsg01
  location            = azurerm_resource_group.rgwe006.location
  resource_group_name = azurerm_resource_group.rgwe006.name
}

resource "azurerm_virtual_network" "vnet006-03" {
  name                = var.vnet01
  location            = azurerm_resource_group.rgwe006.location
  resource_group_name = azurerm_resource_group.rgwe006.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "sn-006-01-01-we"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.nsg006.id

  }

  subnet {
    name           = "sn-006-01-02-we"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
  }
}
/*
resource "azurerm_virtual_network" "vnet006-02" {
  name                = "vnet-006-02-we"
  location            = azurerm_resource_group.rgwe006.location
  resource_group_name = azurerm_resource_group.rgwe006.name
  address_space       = ["10.10.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "sn-006-02-01-we"
    address_prefix = "10.10.1.0/24"
  }

  subnet {
    name           = "sn-006-02-02-we"
    address_prefix = "10.10.2.0/24"
  }

  tags = {
  }
}*/

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
  name     = "rg-vnet006-we"
  location = "West Europe"
}

resource "azurerm_network_security_group" "nsg006" {
  name                = "nsg-vnet006-we"
  location            = azurerm_resource_group.rgwe006.location
  resource_group_name = azurerm_resource_group.rgwe006.name
}

resource "azurerm_virtual_network" "vnet006-01" {
  name                = "vnet-006-01--we"
  location            = azurerm_resource_group.rgwe006.location
  resource_group_name = azurerm_resource_group.rgwe006.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "sn-006-01-01-we"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.nsg006.id

  }

  subnet {
    name           = "sn-006-01-02-we"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
  }
}
resource "azurerm_virtual_network" "vnet006-02" {
  name                = "vnet-006-02-we"
  location            = azurerm_resource_group.rgwe006.location
  resource_group_name = azurerm_resource_group.rgwe006.name
  address_space       = ["10.10.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "sn-006-02-01-we"
    address_prefix = "10.10.1.0/24"
  }

  subnet {
    name           = "sn-006-02-02-we"
    address_prefix = "10.10.2.0/24"
  }

  tags = {
  }
}