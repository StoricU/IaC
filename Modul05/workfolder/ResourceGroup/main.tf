resource "azurerm_resource_group" "ModuleDemo" {
  name     = "rg-${var.base_name}"
  location = var.location
  tags     = var.tags
}
