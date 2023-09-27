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

module "ResourceGroup" {
  source    = "./ResourceGroup"
  base_name = "moduledemo"
  location  = "westeurope"
  tags = local.tags

}

module "StorageAccount" {
  source    = "./StorageAccount"
  base_name = "ModuleDemo"
  rgname    = module.ResourceGroup.rg_name_output
  location  = "westeurope"
  tags = local.tags
}

module "vnet" {
  source    = "./vnet"
  base_name = "vnetdemo"
  rgname    = module.ResourceGroup.rg_name_output
  location  = "westeurope"
  tags = local.tags

}

module "VM" {
  source    = "./VM"
  base_name = "linuxDemo"
  rgname    = module.ResourceGroup.rg_name_output
  location  = "westeurope"
  nic_linux_id = module.vnet.nic_linux_id
  tags = local.tags
}
