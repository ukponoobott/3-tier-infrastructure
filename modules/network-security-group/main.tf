resource "azurerm_network_security_group" "this" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                       = "${each.value.access}-${each.value.direction}-${each.value.port}"
      priority                   = each.value.priority
      direction                  = each.value.direction
      access                     = each.value.access
      protocol                   = "Tcp"
      source_address_prefix      = each.value.source_address_prefix
      source_port_range          = each.value.source_port_range
      destination_address_prefix = each.value.destination_address_prefix
      destination_port_range     = each.value.destination_port_range
    }
  }

}