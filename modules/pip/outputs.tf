output "web-pip" {
  value = azurerm_public_ip.web.id
  description = "Id of the public IP associated with the jump box VM"
}