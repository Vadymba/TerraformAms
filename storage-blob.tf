
# Create a zip file of our compiled function code
data "archive_file" "function_release" {
  type        = "zip"
  source_dir  = "${var.source_dir_to_calculation_func}"
  output_path = "${var.output_path_calculation_func}"
}

resource "azurerm_storage_blob" "function_blob" {
  name                   = "${filesha256(data.archive_file.function_release.output_path)}.zip"
  source                 = data.archive_file.function_release.output_path
  storage_account_name   = azurerm_storage_account.alertStorage.name
  storage_container_name = azurerm_storage_container.function_releases.name
  type                   = "Block"
}