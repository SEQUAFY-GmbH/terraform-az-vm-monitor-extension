############################################################
# Diagnostics extension
# Requires storage account (storage_account.tf)
############################################################
resource "azurerm_virtual_machine_extension" "diagnostics" {
  name                       = "${data.azurerm_virtual_machine.vm.name}-diagnosticsextension"
  publisher                  = "Microsoft.Azure.Diagnostics"
  type                       = "IaaSDiagnostics"
  type_handler_version       = "1.16"
  auto_upgrade_minor_version = "true"
  virtual_machine_id         = data.azurerm_virtual_machine.vm.id

  settings = templatefile(format("%s/templates/vm_diag_settings.json", path.module), {
    vm_resource_id       = data.azurerm_virtual_machine.vm.id
    storage_account_name = azurerm_storage_account.this.name
  })

  protected_settings = jsonencode({
    "storageAccountName" : "${azurerm_storage_account.this.name}",
    "storageAccountKey" : "${azurerm_storage_account.this.primary_access_key}"
  })

  tags = merge(
    {
      Description = "Diagnostics extension for virtual machine"
    },
    var.tags
  )
}

############################################################
# Azure Monitor Agent
# Requires data collection rule (data_collection.tf)
############################################################
resource "azurerm_virtual_machine_extension" "azure_monitor_agent" {
  name                       = "${data.azurerm_virtual_machine.vm.name}-azmonitorextension"
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorWindowsAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = "true"
  automatic_upgrade_enabled  = "true"
  virtual_machine_id         = data.azurerm_virtual_machine.vm.id

  tags = merge(
    {
      Description = "Azure monitoring extension for virtual machine"
    },
    var.tags
  )
}