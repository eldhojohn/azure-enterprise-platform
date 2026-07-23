output "id" {
  description = "Resource ID of the Azure Bastion host."
  value       = azurerm_bastion_host.this.id
}

output "name" {
  description = "Name of the Azure Bastion host."
  value       = azurerm_bastion_host.this.name
}

output "public_ip_id" {
  description = "Resource ID of the Bastion public IP."
  value       = azurerm_public_ip.this.id
}

output "public_ip_address" {
  description = "Public IP address assigned to Azure Bastion."
  value       = azurerm_public_ip.this.ip_address
}