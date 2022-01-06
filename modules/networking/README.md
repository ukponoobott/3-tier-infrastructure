<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.app-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.db-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.web-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.dev-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_subnet_cidr"></a> [app\_subnet\_cidr](#input\_app\_subnet\_cidr) | This specifies the address space of the app subnet | `list` | n/a | yes |
| <a name="input_db_subnet_cidr"></a> [db\_subnet\_cidr](#input\_db\_subnet\_cidr) | This specifies the address space of the db subnet | `list` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | This specifies the location of the virtual network | `string` | `"eastus"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | This specifies the resource group of the virtual network | `string` | n/a | yes |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | This specifies the address space of the virtual network | `list` | n/a | yes |
| <a name="input_web_subnet_cidr"></a> [web\_subnet\_cidr](#input\_web\_subnet\_cidr) | This specifies the address space of the web subnet | `list` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_subnet_id"></a> [app\_subnet\_id](#output\_app\_subnet\_id) | Id of appsubnet in the network |
| <a name="output_db_subnet_id"></a> [db\_subnet\_id](#output\_db\_subnet\_id) | Id of dbsubnet in the network |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Name of the Virtual network |
| <a name="output_web_subnet_id"></a> [web\_subnet\_id](#output\_web\_subnet\_id) | Id of websubnet in the network |
<!-- END_TF_DOCS -->