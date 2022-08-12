
resource "azurerm_eventgrid_topic" "alertEventGrid" {
  name = "alert-event-grid-topic"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.default_tags
}

resource "azurerm_eventgrid_event_subscription" "alertEventSub" {
  name = "AlertEventSubsribtion"
  scope = azurerm_eventgrid_topic.alertEventGrid.id
  azure_function_endpoint {
    function_id = "${azurerm_windows_function_app.calculationFunc.id}/functions/Function1"
  }
}