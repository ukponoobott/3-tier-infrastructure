resource "azurerm_virtual_network" "dev-vnet" {
  name                = "dev-vnet"
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = var.vnet_cidr
}

resource "azurerm_subnet" "web-subnet" {
  name                 = "web-subnet"
  virtual_network_name = azurerm_virtual_network.dev-vnet.name
  resource_group_name  = var.resource_group
  address_prefixes     = var.web_subnet_cidr
}

resource "azurerm_subnet" "app-subnet" {
  name                 = "app-subnet"
  virtual_network_name = azurerm_virtual_network.dev-vnet.name
  resource_group_name  = var.resource_group
  address_prefixes     = var.app_subnet_cidr
}

resource "azurerm_subnet" "db-subnet" {
  name                 = "db-subnet"
  virtual_network_name = azurerm_virtual_network.dev-vnet.name
  resource_group_name  = var.resource_group
  address_prefixes     = var.db_subnet_cidr
  service_endpoints = ["Microsoft.Sql"]
}
