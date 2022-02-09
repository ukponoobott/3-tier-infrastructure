resource "azurerm_network_interface" "web-nic" {
  name                = "web-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "web-server"
    subnet_id                     = var.web_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.web-pip
  }
}

resource "azurerm_windows_virtual_machine" "web-vm" {
  name                = "web-vm"
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.sku
  admin_username      = var.username
  admin_password      = var.password
  network_interface_ids = [azurerm_network_interface.web-nic.id,]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}


resource "azurerm_network_interface" "app-nic" {
  name                = "app-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "app-server"
    subnet_id                     = var.app_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "app-vm" {
  name                = "app-vm"
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.sku
  admin_username      = var.username
  admin_password      = var.password
  network_interface_ids = [azurerm_network_interface.app-nic.id,]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

