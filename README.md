<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.20.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_api"></a> [api](#module\_api) | ./modules/virtual-machine | n/a |
| <a name="module_network_security_group"></a> [network\_security\_group](#module\_network\_security\_group) | ./modules/network-security-group | n/a |
| <a name="module_web"></a> [web](#module\_web) | ./modules/virtual-machine | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.private](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb) | resource |
| [azurerm_lb.public](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.api](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_backend_address_pool.web](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.private](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_probe.public](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.private](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb_rule) | resource |
| [azurerm_lb_rule.public](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/lb_rule) | resource |
| [azurerm_mssql_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/mssql_database) | resource |
| [azurerm_mssql_server.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/mssql_server) | resource |
| [azurerm_mssql_virtual_network_rule.sqlvnetrule](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/mssql_virtual_network_rule) | resource |
| [azurerm_network_interface_backend_address_pool_association.api](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_interface_backend_address_pool_association.web](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_public_ip.public](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | This specifies the address space of the virtual network | `list(string)` | n/a | yes |
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | This specifies the database administrator login | `string` | n/a | yes |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | This specifies the administrator login password | `string` | n/a | yes |
| <a name="input_api_instances"></a> [api\_instances](#input\_api\_instances) | n/a | `list(string)` | n/a | yes |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | This specifies the version of the database | `string` | n/a | yes |
| <a name="input_databases"></a> [databases](#input\_databases) | n/a | `list(string)` | n/a | yes |
| <a name="input_db_server_name"></a> [db\_server\_name](#input\_db\_server\_name) | n/a | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | This specifies the location of the virtual machine | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | This specifies the resource group of the virtual machine | `string` | n/a | yes |
| <a name="input_security_rules"></a> [security\_rules](#input\_security\_rules) | n/a | <pre>map(object({<br>    access                     = string<br>    priority                   = number<br>    direction                  = string<br>    access                     = string<br>    source_address_prefix      = optional(list(string), null)<br>    source_port_range          = string<br>    destination_address_prefix = optional(list(string), null)<br>    destination_port_range     = string<br>  }))</pre> | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | `map(string)` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | n/a | `any` | n/a | yes |
| <a name="input_vm_sku"></a> [vm\_sku](#input\_vm\_sku) | n/a | `any` | n/a | yes |
| <a name="input_web_instances"></a> [web\_instances](#input\_web\_instances) | n/a | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->