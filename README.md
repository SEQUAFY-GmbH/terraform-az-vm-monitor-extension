# Azure - Monitoring extension
Add monitoring extension for diagnostics and Azure monitor agent to a virtual machine. Name of the an existing virtual machine and resource group need to be provided.
## Notes
All further needed resources like [storage account] (https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.Storage%2FStorageAccounts) and [data collection rule] (https://portal.azure.com/#view/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/~/dataCollectionRules) will be created.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.3.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.37.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_data_collection_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/monitor_data_collection_rule) | resource |
| [azurerm_monitor_data_collection_rule_association.vm_azmonitor_agent](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/monitor_data_collection_rule_association) | resource |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/storage_account) | resource |
| [azurerm_virtual_machine_extension.azure_monitor_agent](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_machine_extension.diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/virtual_machine_extension) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/data-sources/resource_group) | data source |
| [azurerm_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/data-sources/virtual_machine) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group all resources will be deployed to | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Name of the storage account to be created | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Bunch of tags to be applied to all resources | `map(any)` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the virtual machine which will be imported | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->