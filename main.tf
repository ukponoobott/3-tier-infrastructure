# Create resource group
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "this" {
  name                = var.virtual_network_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "this" {
  for_each = var.subnets

  name                 = "${each.key}-subnet"
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = azurerm_resource_group.this.name
  address_prefixes     = ["${each.value}"]
}

# Create compute resources

module "web" {
  source                = "./modules/virtual-machine"
  for_each              = toset(var.web_instances)
  resource_group_name   = azurerm_resource_group.this.name
  location              = azurerm_resource_group.this.location
  workload              = each.key
  subnet_id             = azurerm_subnet.this["web"].id
  enabled_public_access = false
  admin_username        = var.administrator_login
  admin_password        = var.administrator_login_password
  sku                   = var.vm_sku
}

module "api" {
  source                = "./modules/virtual-machine"
  for_each              = toset(var.api_instances)
  resource_group_name   = azurerm_resource_group.this.name
  location              = azurerm_resource_group.this.location
  workload              = each.key
  subnet_id             = azurerm_subnet.this["api"].id
  enabled_public_access = false
  admin_username        = "adminuser"
  admin_password        = "123456@Abc"
  sku                   = "Standard_B1s"
}

module "network_security_group" {
  source              = "./modules/network-security-group"
  nsg_name            = ""
  resource_group_name = azurerm_resource_group.this.name
  security_rules      = var.security_rules
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each                  = var.subnets
  subnet_id                 = azurerm_subnet.this["${each.key}"].id
  network_security_group_id = module.network_security_group.nsg.id
}

resource "azurerm_mssql_server" "this" {
  name                         = var.db_server_name
  resource_group_name          = azurerm_resource_group.this.name
  location                     = azurerm_resource_group.this.location
  version                      = var.database_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "this" {
  for_each  = toset(var.databases)
  name      = each.value
  server_id = azurerm_mssql_server.this.id
}

resource "azurerm_mssql_virtual_network_rule" "sqlvnetrule" {
  name      = "sql-vnet-rule"
  server_id = azurerm_mssql_server.this.id
  subnet_id = azurerm_subnet.this["db"].id
}

resource "azurerm_public_ip" "public" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "public" {
  name                = "demo-lb"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.public.id
  }
}

resource "azurerm_lb_probe" "public" {
  loadbalancer_id = azurerm_lb.public.id
  name            = "http-running-probe"
  port            = 80
}

resource "azurerm_lb_rule" "public" {
  loadbalancer_id                = azurerm_lb.public.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
}

resource "azurerm_lb_backend_address_pool" "web" {
  loadbalancer_id = azurerm_lb.public.id
  name            = "webbackend"
}

resource "azurerm_network_interface_backend_address_pool_association" "web" {
  for_each                = toset(var.web_instances)
  network_interface_id    = module.web[each.key].nic.id
  ip_configuration_name   = "ip-config-${each.key}-${var.location}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.web.id
}

resource "azurerm_lb" "private" {
  name                = "demo-lb"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  frontend_ip_configuration {
    name      = "PrivateIPAddress"
    subnet_id = azurerm_subnet.this["web"].id
  }
}

resource "azurerm_lb_rule" "private" {
  loadbalancer_id                = azurerm_lb.private.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PrivateIPAddress"
}

resource "azurerm_lb_probe" "private" {
  loadbalancer_id = azurerm_lb.private.id
  name            = "http-running-probe"
  port            = 80
}

resource "azurerm_lb_backend_address_pool" "api" {
  loadbalancer_id = azurerm_lb.private.id
  name            = "apibackend"
}

resource "azurerm_network_interface_backend_address_pool_association" "api" {
  for_each                = toset(var.api_instances)
  network_interface_id    = module.api[each.key].nic.id
  ip_configuration_name   = "ip-config-${each.key}-${var.location}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.api.id
}
