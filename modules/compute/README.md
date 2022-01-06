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
| [azurerm_network_interface.app-nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface.web-nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_virtual_machine.app-vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |
| [azurerm_virtual_machine.web-vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_host_name"></a> [app\_host\_name](#input\_app\_host\_name) | This specifies the host name of the app-vm | `string` | n/a | yes |
| <a name="input_app_os_password"></a> [app\_os\_password](#input\_app\_os\_password) | This specifies the password of the app-vm | `string` | n/a | yes |
| <a name="input_app_subnet_id"></a> [app\_subnet\_id](#input\_app\_subnet\_id) | This specifies the address apace of the app subnet | `string` | n/a | yes |
| <a name="input_app_username"></a> [app\_username](#input\_app\_username) | This specifies the username of the app-vm | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | This specifies the location of the virtual machine | `string` | `"eastus"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | This specifies the resource group of the virtual machine | `string` | n/a | yes |
| <a name="input_web_host_name"></a> [web\_host\_name](#input\_web\_host\_name) | This specifies the host name of the web-vm | `string` | n/a | yes |
| <a name="input_web_os_password"></a> [web\_os\_password](#input\_web\_os\_password) | This specifies the passoword of the web-vm | `string` | n/a | yes |
| <a name="input_web_subnet_id"></a> [web\_subnet\_id](#input\_web\_subnet\_id) | This specifies the address apace of the web subnet | `string` | n/a | yes |
| <a name="input_web_username"></a> [web\_username](#input\_web\_username) | This specifies the username of the web-vm | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->