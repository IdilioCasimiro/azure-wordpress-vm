#Define a Resource Group

resource "azurerm_resource_group" "Terraform-Sandbox" {
  name     = "Terraform-Sandbox"
  location = var.location
  tags     = var.tags
}

#VM setup
resource "azurerm_linux_virtual_machine" "terraform-sandbox-lx-vm01" {
  name                = "terraform-sandbox-lx-vm01"
  resource_group_name = azurerm_resource_group.Terraform-Sandbox.name
  location            = var.location
  size                = "Standard_B1ms"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.sanbox-lx-vm01-nic.id,
  ]

  #Grab an existing ssh public key and use it for ssh authentication
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = 30
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  #Use custom data to install wordpress
  custom_data = fileexists("scripts/wordpress-setup.sh") ? filebase64("scripts/wordpress-setup.sh") : null

  tags = var.tags
}
