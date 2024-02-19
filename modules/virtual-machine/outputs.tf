output "nic" {
  value = azurerm_network_interface.this
}

output "virtual_machine" {
  value = azurerm_linux_virtual_machine.this
}