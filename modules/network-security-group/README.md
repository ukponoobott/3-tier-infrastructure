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
| [azurerm_network_security_group.app-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.db-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.web-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_subnet_network_security_group_association.app-nsg-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.db-nsg-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.web-nsg-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_subnet_id"></a> [app\_subnet\_id](#input\_app\_subnet\_id) | This specifies the address space of the app subnet | `string` | n/a | yes |
| <a name="input_db_subnet_id"></a> [db\_subnet\_id](#input\_db\_subnet\_id) | This specifies the address space of the db subnet | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | This specifies the location of the virtual network | `string` | `"eastus"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | This specifies the resource group of the virtual network | `string` | n/a | yes |
| <a name="input_web_subnet_id"></a> [web\_subnet\_id](#input\_web\_subnet\_id) | This specifies the address space of the web subnet | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->