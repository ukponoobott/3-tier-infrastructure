<!-- BEGIN_TF_DOCS -->

# 3-Tier Archirtechture 

[Code available here](https://github.com/Ukponobott/azure-3-tier-architecture)

This defines a simple 3-tier infrastructure deployment in Azure where the environments are isolated are operate based on the security rules specified in the network security group.

The infratructure operates in a virtual network which has 3 subnets each for a tier. 

![3-tier-acrchitecture](/images/3-tier.png)


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.88.1 |

## Modules
To make provisioning simpler and reusable, modules are used which are listed below;

- Compute
- Networking
- Network security group
- Database

![Modules](/images/modules.png)


| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute"></a> [compute](#module\_compute) | ./modules/compute | n/a |
| <a name="module_database"></a> [database](#module\_database) | ./modules/database | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ./modules/networking | n/a |
| <a name="module_securitygroup"></a> [securitygroup](#module\_securitygroup) | ./modules/network-security-group | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.dev](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_host_name"></a> [app\_host\_name](#input\_app\_host\_name) | This specifies the host name of the app-vm | `string` | n/a | yes |
| <a name="input_app_os_password"></a> [app\_os\_password](#input\_app\_os\_password) | This specifies the password of the app-vm | `string` | n/a | yes |
| <a name="input_app_subnet_cidr"></a> [app\_subnet\_cidr](#input\_app\_subnet\_cidr) | This specifies the address apace of the app subnet | `string` | n/a | yes |
| <a name="input_app_subnet_id"></a> [app\_subnet\_id](#input\_app\_subnet\_id) | This specifies the address space of the app subnet | `string` | n/a | yes |
| <a name="input_app_username"></a> [app\_username](#input\_app\_username) | This specifies the username of the app-vm | `string` | n/a | yes |
| <a name="input_db_subnet_cidr"></a> [db\_subnet\_cidr](#input\_db\_subnet\_cidr) | This specifies the address apace of the app subnet | `string` | n/a | yes |
| <a name="input_db_subnet_id"></a> [db\_subnet\_id](#input\_db\_subnet\_id) | This specifies the address space of the db subnet | `string` | n/a | yes |
| <a name="input_dev_database"></a> [dev\_database](#input\_dev\_database) | This specifies the database name | `string` | n/a | yes |
| <a name="input_dev_database_admin"></a> [dev\_database\_admin](#input\_dev\_database\_admin) | This specifies the database administrator login | `string` | n/a | yes |
| <a name="input_dev_database_password"></a> [dev\_database\_password](#input\_dev\_database\_password) | This specifies the administrator login password | `string` | n/a | yes |
| <a name="input_dev_database_version"></a> [dev\_database\_version](#input\_dev\_database\_version) | This specifies the version of the database | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | This specifies the location of the virtual machine | `string` | `"eastus"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | This specifies the resource group of the virtual machine | `string` | n/a | yes |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | This specifies the address apace of the web subnet | `string` | n/a | yes |
| <a name="input_web_host_name"></a> [web\_host\_name](#input\_web\_host\_name) | This specifies the host name of the web-vm | `string` | n/a | yes |
| <a name="input_web_os_password"></a> [web\_os\_password](#input\_web\_os\_password) | This specifies the passoword of the web-vm | `string` | n/a | yes |
| <a name="input_web_subnet_cidr"></a> [web\_subnet\_cidr](#input\_web\_subnet\_cidr) | This specifies the host name of the web-vm | `string` | n/a | yes |
| <a name="input_web_username"></a> [web\_username](#input\_web\_username) | This specifies the username of the web-vm | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->