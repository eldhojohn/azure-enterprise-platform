data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "platform" {
  name     = "rg-platform-${var.environment}-${var.region_code}-001"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_management_lock" "platform_resource_group" {
  name       = "lock-platform-${var.environment}-${var.region_code}-001"
  scope      = azurerm_resource_group.platform.id
  lock_level = "CanNotDelete"
  notes      = "Protects the shared platform resource group from accidental deletion."
}

resource "azurerm_log_analytics_workspace" "platform" {
  name                = "law-platform-${var.environment}-${var.region_code}-001"
  location            = var.location
  resource_group_name = azurerm_resource_group.platform.name

  sku               = "PerGB2018"
  retention_in_days = 30

  tags = local.common_tags
}