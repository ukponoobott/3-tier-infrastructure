resource "azurerm_public_ip" "web" {
  name                = "web-pip"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Dynamic"
}