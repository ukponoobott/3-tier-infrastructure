resource "azurerm_network_interface" "this" {
  name                = "nic-${var.workload}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ip-config-${var.workload}-${var.location}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.enabled_public_access ? var.public_ip_address_id : null
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  name                            = "vm-${var.workload}-${var.location}"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.sku
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.this.id, ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}