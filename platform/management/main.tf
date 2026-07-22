data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

data "terraform_remote_state" "governance" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate-prod-aue-001"
    storage_account_name = "sttfprodaue001"
    container_name       = "tfstate"
    key                  = "platform/governance.tfstate"
    use_azuread_auth     = true
  }
}

resource "azurerm_monitor_diagnostic_setting" "subscription_activity_logs" {
  name                       = "diag-subscription-${var.environment}-${var.region_code}-001"
  target_resource_id         = data.azurerm_subscription.current.id
  log_analytics_workspace_id = data.terraform_remote_state.governance.outputs.log_analytics_workspace_id

  enabled_log {
    category = "Administrative"
  }

  enabled_log {
    category = "Security"
  }

  enabled_log {
    category = "ServiceHealth"
  }

  enabled_log {
    category = "Alert"
  }

  enabled_log {
    category = "Recommendation"
  }

  enabled_log {
    category = "Policy"
  }

  enabled_log {
    category = "Autoscale"
  }

  enabled_log {
    category = "ResourceHealth"
  }
}