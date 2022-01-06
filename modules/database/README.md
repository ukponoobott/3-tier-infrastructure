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
| [azurerm_sql_database.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_database) | resource |
| [azurerm_sql_server.dev](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dev_database"></a> [dev\_database](#input\_dev\_database) | This specifies the database name | `string` | n/a | yes |
| <a name="input_dev_database_admin"></a> [dev\_database\_admin](#input\_dev\_database\_admin) | This specifies the database administrator login | `string` | n/a | yes |
| <a name="input_dev_database_password"></a> [dev\_database\_password](#input\_dev\_database\_password) | This specifies the administrator login password | `string` | n/a | yes |
| <a name="input_dev_database_version"></a> [dev\_database\_version](#input\_dev\_database\_version) | This specifies the version of the database | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | This specifies the location of the db | `string` | `"eastus"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | This specifies the resource group of the db | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sql_database_id"></a> [sql\_database\_id](#output\_sql\_database\_id) | Id of SQL Database instace |
<!-- END_TF_DOCS -->