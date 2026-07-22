output "subscription_name" {
  description = "Current Azure subscription name."
  value       = data.azurerm_subscription.current.display_name
}

output "subscription_id" {
  description = "Current Azure subscription ID."
  value       = data.azurerm_subscription.current.subscription_id
}

output "log_analytics_workspace_id" {
  description = "Log Analytics workspace ID read from Governance state."
  value       = data.terraform_remote_state.governance.outputs.log_analytics_workspace_id
}

output "log_analytics_workspace_name" {
  description = "Log Analytics workspace name read from Governance state."
  value       = data.terraform_remote_state.governance.outputs.log_analytics_workspace_name
}

output "subscription_diagnostic_setting_id" {
  description = "ID of the subscription Activity Log diagnostic setting."
  value       = azurerm_monitor_diagnostic_setting.subscription_activity_logs.id
}