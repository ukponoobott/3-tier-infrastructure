provider "azurerm" {
  features {}
}

# Create resource group
resource "azurerm_resource_group" "dev" {
  name     =  "dev-rg"
  location = "eastus"
}

# Create networking resources
module "networking" {
    source = "./modules/networking"
    resource_group = azurerm_resource_group.dev.name
    location = azurerm_resource_group.dev.location
    vnet_cidr = ["10.0.0.0/16"]
    web_subnet_cidr = ["10.0.1.0/24"]
    app_subnet_cidr = ["10.0.2.0/24"]
    db_subnet_cidr = ["10.0.3.0/24"]

}

# Create network security groups
module "securitygroup" {
  source         = "./modules/network-security-group"
  location       = azurerm_resource_group.dev.location
  resource_group = azurerm_resource_group.dev.name
  web_subnet_id  = module.networking.web_subnet_id
  app_subnet_id  = module.networking.app_subnet_id
  db_subnet_id   = module.networking.db_subnet_id
}

# Create compute resources
module "compute" {
  source         = "./modules/compute"
  location = azurerm_resource_group.dev.location
  resource_group = azurerm_resource_group.dev.name
  web_subnet_id = module.networking.web_subnet_id
  app_subnet_id = module.networking.app_subnet_id
  web_host_name = "webserver"
  web_username = "ukponoobott"
  web_os_password = "Abcd@1234"
  app_host_name = "appserver"
  app_username = "ukponoobott"
  app_os_password = "Abcd@1234"
}

# Create db server and db
module "database" {
  source = "./modules/database"
  location = azurerm_resource_group.dev.location
  resource_group = azurerm_resource_group.dev.name
  dev_database = "sql-dev-database"
  dev_database_version = "12.0"
  dev_database_admin = "db-admin"
  dev_database_password = "Abcd@1234"
}
