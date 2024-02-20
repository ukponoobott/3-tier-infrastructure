resource_group_name  = "demo-rg"
location             = "eastus2"
virtual_network_name = "demo-vnet"
address_space        = ["10.0.0.0/16"]
subnets = {
  "web" = "10.0.1.0/24"
  "api" = "10.0.2.0/24"
  "db"  = "10.0.3.0/24"
}
security_rules = {

}
vm_sku                       = "Standard_B1s"
web_instances                = ["web-1"]
api_instances                = ["api-1"]
db_server_name               = "demo-db-server"
databases                    = ["students"]
database_version             = "12.0"
administrator_login          = "adminuser"
administrator_login_password = "123456@Abc"