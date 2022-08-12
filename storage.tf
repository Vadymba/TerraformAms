resource "azurerm_storage_account" "alertStorage" {
  name                     = replace("${local.prefix}", "-", "")

  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.default_tags
}

resource "azurerm_storage_container" "function_releases" {
  name                 = "function-releases"
  storage_account_name = azurerm_storage_account.alertStorage.name
  container_access_type = "container"
}