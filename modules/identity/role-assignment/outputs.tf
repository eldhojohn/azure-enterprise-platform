output "id" {
  description = "Resource ID of the role assignment."
  value       = azurerm_role_assignment.this.id
}

output "principal_id" {
  description = "Principal ID receiving the role assignment."
  value       = azurerm_role_assignment.this.principal_id
}

output "role_definition_name" {
  description = "Name of the assigned role."
  value       = azurerm_role_assignment.this.role_definition_name
}

output "scope" {
  description = "Scope of the role assignment."
  value       = azurerm_role_assignment.this.scope
}