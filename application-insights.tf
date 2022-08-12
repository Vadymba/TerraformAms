resource "azurerm_application_insights" "appInsights" {
  name = "${local.prefix}"
  
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  application_type = "web"

  tags = local.default_tags
}