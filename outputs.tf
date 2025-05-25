output "sandbox-lx-vm01-private-ip" {
  description = "Private IP"
  value       = azurerm_linux_virtual_machine.terraform-sandbox-lx-vm01.private_ip_address
}

output "sandbox-lx-vm01-public-ip" {
  description = "Public IP"
  value       = azurerm_linux_virtual_machine.terraform-sandbox-lx-vm01.public_ip_address
}

output "sandbox-lx-vm01-dns" {
  description = "FQDN"
  value = azurerm_public_ip.sandbox-lx-vm01-pip.fqdn
}