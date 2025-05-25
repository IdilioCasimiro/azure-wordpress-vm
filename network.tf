#Define the VNET for the sandbox
resource "azurerm_virtual_network" "sandbox-vnet" {
  location            = var.location
  resource_group_name = azurerm_resource_group.Terraform-Sandbox.name
  name                = "sandbox-vnet"
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "VMs"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.sandbox-nsg.id
  }

  subnet {
    name           = "BDs"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.sandbox-nsg.id
  }

  tags = var.tags
}

#Define the VM public ip
resource "azurerm_public_ip" "sandbox-lx-vm01-pip" {
  location            = var.location
  name                = "sandbox-lx-vm01-pip"
  resource_group_name = azurerm_resource_group.Terraform-Sandbox.name
  allocation_method   = "Static"
  domain_name_label   = "terraform-sandbox-vm01"
  tags                = var.tags
}

#Define the NIC wich will be associated to VM and PIP
resource "azurerm_network_interface" "sanbox-lx-vm01-nic" {
  location            = var.location
  name                = "sanbox-lx-vm01-nic"
  resource_group_name = azurerm_resource_group.Terraform-Sandbox.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_virtual_network.sandbox-vnet.subnet.*.id[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.sandbox-lx-vm01-pip.id
  }

  tags = var.tags
}
