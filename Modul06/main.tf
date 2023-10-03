terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-backend-jm"
    storage_account_name = "sabetfsjmz8c513"
    container_name       = "tfstate"
    key                  = "modul06.terraform.tfstate"

  }
}

provider "azurerm" {
  features {
    }

  }

resource "azurerm_resource_group" "rg_modul06" {
  name     = var.rg_modul06_name
  location = var.rg_modul06_location
}
