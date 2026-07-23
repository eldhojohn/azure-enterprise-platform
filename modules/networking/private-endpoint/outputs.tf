output "id" {
  value = azurerm_private_endpoint.this.id
}

output "network_interface_id" {
  value = azurerm_private_endpoint.this.network_interface[0].id
}

output "private_ip_address" {
  value = azurerm_private_endpoint.this.private_service_connection[0].private_ip_address
}