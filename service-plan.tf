resource "azurerm_service_plan" "servicePlan" {
  name = "${local.prefix}-asp-plan-func"

  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location

  os_type = "Windows"
  sku_name = "Y1"

  tags = local.default_tags
}
