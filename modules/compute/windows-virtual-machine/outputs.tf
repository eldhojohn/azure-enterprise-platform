output "virtual_machine_id" {
  description = "ID of the Windows virtual machine."
  value       = azurerm_windows_virtual_machine.this.id
}

output "virtual_machine_name" {
  description = "Name of the Windows virtual machine."
  value       = azurerm_windows_virtual_machine.this.name
}

output "network_interface_id" {
  description = "ID of the network interface."
  value       = azurerm_network_interface.this.id
}

output "private_ip_address" {
  description = "Private IP address assigned to the VM."
  value       = azurerm_network_interface.this.private_ip_address
}

output "principal_id" {
  description = "System-assigned managed identity Principal ID."
  value = try(
    azurerm_windows_virtual_machine.this.identity[0].principal_id,
    null
  )
}