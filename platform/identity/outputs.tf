output "identity_resource_group_name" {
  description = "Name of the Identity resource group."
  value       = azurerm_resource_group.identity.name
}

output "platform_identity_id" {
  description = "Resource ID of the platform managed identity."
  value       = module.platform_identity.id
}

output "platform_identity_client_id" {
  description = "Client ID of the platform managed identity."
  value       = module.platform_identity.client_id
}

output "platform_identity_principal_id" {
  description = "Principal ID of the platform managed identity."
  value       = module.platform_identity.principal_id
}

output "platform_key_vault_id" {
  description = "Resource ID of the platform Key Vault."
  value       = module.platform_key_vault.id
}

output "platform_key_vault_name" {
  description = "Name of the platform Key Vault."
  value       = module.platform_key_vault.name
}

output "platform_key_vault_uri" {
  description = "URI of the platform Key Vault."
  value       = module.platform_key_vault.vault_uri
}

output "platform_key_vault_private_endpoint_id" {
  value = module.platform_key_vault_private_endpoint.id
}

output "platform_key_vault_private_endpoint_ip" {
  value = module.platform_key_vault_private_endpoint.private_ip_address
}