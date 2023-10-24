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
    key                  = "modul08.terraform.tfstate"

  }
}

provider "azurerm" {
  features {
    }

  }