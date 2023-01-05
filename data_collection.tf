resource "azurerm_monitor_data_collection_rule" "this" {
  name                = "monitor-rule"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location

  destinations {
    azure_monitor_metrics {
      name = "azure-monitoring-metrics"
    }
  }

  data_flow {
    streams      = ["Microsoft-InsightsMetrics"]
    destinations = ["azure-monitoring-metrics"]
  }

  tags = merge(
    {
      Description = "Data collection rule for vm monitoring data"
    },
    var.tags
  )
}

resource "azurerm_monitor_data_collection_rule_association" "vm_azmonitor_agent" {
  name                    = "${data.azurerm_virtual_machine.vm.name}-rule"
  target_resource_id      = data.azurerm_virtual_machine.vm.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.this.id
}