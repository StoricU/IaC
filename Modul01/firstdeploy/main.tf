terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "firstdeploy-rg" {
  name     = "rg-firstdeply-ne"
  location = "North Europe"
}

resource "azurerm_storage_account" "firstdeploy-sa" {
  name                     = "jmatisip01"
  resource_group_name      = azurerm_resource_group.firstdeploy-rg.name
  location                 = azurerm_resource_group.firstdeploy-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "firstdeploy"
  }
}