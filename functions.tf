resource "azurerm_windows_function_app" "calculationFunc" {
  name = "${local.prefix}-calculation-func"

  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  https_only = true
  

  service_plan_id = azurerm_service_plan.servicePlan.id
  
  storage_account_name = azurerm_storage_account.alertStorage.name
  storage_account_access_key = azurerm_storage_account.alertStorage.primary_access_key

  site_config {
    application_stack {
      dotnet_version = "6"
    }
   }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "https://${azurerm_storage_account.alertStorage.name}.blob.core.windows.net/function-releases/${azurerm_storage_blob.function_blob.name}"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = "${azurerm_application_insights.appInsights.instrumentation_key}"
  }
}