output "hub_vnet_id" {
  value = module.hub_vnet.id
}

output "hub_vnet_name" {
  value = module.hub_vnet.name
}

output "hub_vnet_address_space" {
  value = module.hub_vnet.address_space
}

output "hub_subnet_ids" {
  description = "Hub subnet IDs"

  value = {
    for key, subnet in module.hub_subnets :
    key => subnet.id
  }
}

output "hub_subnet_names" {
  description = "Hub subnet names"

  value = {
    for key, subnet in module.hub_subnets :
    key => subnet.name
  }
}
output "bastion_host_id" {
  description = "Resource ID of the hub Azure Bastion host."
  value       = module.hub_bastion.id
}

output "bastion_host_name" {
  description = "Name of the hub Azure Bastion host."
  value       = module.hub_bastion.name
}

output "bastion_public_ip_address" {
  description = "Public IP address assigned to Azure Bastion."
  value       = module.hub_bastion.public_ip_address
}

output "vpn_gateway_id" {
  description = "Resource ID of the hub VPN Gateway."
  value       = try(module.hub_vpn_gateway[0].id, null)
}

output "vpn_gateway_name" {
  description = "Name of the hub VPN Gateway."
  value       = try(module.hub_vpn_gateway[0].name, null)
}

output "vpn_gateway_public_ip_address" {
  description = "Public IP address assigned to the hub VPN Gateway."
  value       = try(module.hub_vpn_gateway[0].public_ip_address, null)
}

output "private_dns_zone_ids" {
  description = "Resource IDs of platform Private DNS zones."
  value = {
    for key, zone in module.private_dns_zones :
    key => zone.id
  }
}

output "shared_services_subnet_id" {
  description = "Resource ID of the shared services subnet."
  value       = module.hub_subnets["shared_services"].id
}

output "key_vault_private_dns_zone_id" {
  description = "Resource ID of the Key Vault private DNS zone."
  value       = module.private_dns_zones["key_vault"].id
}

