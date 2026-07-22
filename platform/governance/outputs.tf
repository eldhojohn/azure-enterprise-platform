output "subscription_id" {
  description = "Azure subscription governed by this configuration."
  value       = data.azurerm_subscription.current.subscription_id
}

output "subscription_display_name" {
  description = "Display name of the Azure subscription."
  value       = data.azurerm_subscription.current.display_name
}

output "tenant_id" {
  description = "Microsoft Entra tenant ID."
  value       = data.azurerm_client_config.current.tenant_id
}

output "current_principal_object_id" {
  description = "Object ID of the identity running Terraform."
  value       = data.azurerm_client_config.current.object_id
}

output "platform_resource_group_name" {
  description = "Platform Resource Group"
  value       = azurerm_resource_group.platform.name
}

output "platform_resource_group_id" {
  description = "Platform Resource Group ID"
  value       = azurerm_resource_group.platform.id
}

output "platform_resource_group_lock_id" {
  description = "ID of the deletion lock protecting the platform resource group."
  value       = azurerm_management_lock.platform_resource_group.id
}

output "log_analytics_workspace_name" {
  value       = azurerm_log_analytics_workspace.platform.name
  description = "Log Analytics Workspace name"
}

output "log_analytics_workspace_id" {
  value       = azurerm_log_analytics_workspace.platform.id
  description = "Log Analytics Workspace ID"
}