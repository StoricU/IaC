terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
    }
  }
}

resource "random_string" "random_string" {
  length  = 6
  special = false
  upper   = false
}


resource "azurerm_storage_account" "sa-demo06" {
  name                     = "${lower(var.base_name)}${random_string.random_string.result}"
  resource_group_name      = var.rgname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}
