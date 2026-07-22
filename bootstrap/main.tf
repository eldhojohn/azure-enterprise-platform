resource "azurerm_resource_group" "terraform_state" {
  name     = local.names.backend_rg
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_storage_account" "terraform_state" {
  name                = local.names.backend_storage
  resource_group_name = azurerm_resource_group.terraform_state.name
  location            = azurerm_resource_group.terraform_state.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  tags = local.common_tags
}

resource "azurerm_storage_container" "terraform_state" {
  name                  = local.names.backend_blob
  storage_account_id    = azurerm_storage_account.terraform_state.id
  container_access_type = "private"
}