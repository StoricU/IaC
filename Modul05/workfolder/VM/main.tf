resource "azurerm_linux_virtual_machine" "linux-demo" {
  name                            = "VM-${var.base_name}"
  resource_group_name             = var.rgname
  location                        = var.location
  size                            = "Standard_F2"
  admin_username                  = "adminuser"
  admin_password                  = "P@ssw0rd1234!"
  disable_password_authentication = false
  tags                            = var.tags
  network_interface_ids = [
    var.nic_linux_id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
