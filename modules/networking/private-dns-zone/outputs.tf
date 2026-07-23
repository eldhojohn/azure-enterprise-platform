output "id" {
  description = "Resource ID of the Private DNS zone."
  value       = azurerm_private_dns_zone.this.id
}

output "name" {
  description = "Name of the Private DNS zone."
  value       = azurerm_private_dns_zone.this.name
}

output "virtual_network_link_ids" {
  description = "Resource IDs of the virtual network links."
  value = {
    for key, link in azurerm_private_dns_zone_virtual_network_link.this :
    key => link.id
  }
}