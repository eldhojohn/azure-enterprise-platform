output "resource_group_id" {
  description = "Resource ID of the ROPES Dev resource group."
  value       = module.resource_group.id
}

output "resource_group_name" {
  description = "Name of the ROPES Dev resource group."
  value       = module.resource_group.name
}

output "spoke_vnet_id" {
  description = "Resource ID of the ROPES Dev spoke VNet."
  value       = module.spoke_vnet.id
}

output "spoke_vnet_name" {
  description = "Name of the ROPES Dev spoke VNet."
  value       = module.spoke_vnet.name
}

output "spoke_vnet_address_space" {
  description = "Address space assigned to the ROPES Dev spoke VNet."
  value       = module.spoke_vnet.address_space
}

output "subnet_ids" {
  description = "Map of ROPES Dev subnet IDs."

  value = {
    for key, subnet in module.spoke_subnets :
    key => subnet.id
  }
}

output "subnet_names" {
  description = "Map of ROPES Dev subnet names."

  value = {
    for key, subnet in module.spoke_subnets :
    key => subnet.name
  }
}

output "network_security_group_ids" {
  description = "Map of ROPES Dev NSG resource IDs."

  value = {
    for key, nsg in module.spoke_nsgs :
    key => nsg.id
  }
}

output "hub_to_spoke_peering_id" {
  description = "Resource ID of the hub-to-ROPES peering."
  value       = module.hub_to_spoke_peering.id
}

output "spoke_to_hub_peering_id" {
  description = "Resource ID of the ROPES-to-hub peering."
  value       = module.spoke_to_hub_peering.id
}