output "nic_linux_id" {
    description = "ID på linux maskinen for å sende til VM-main.tf"
    value = azurerm_network_interface.nic-linux.id
  
}