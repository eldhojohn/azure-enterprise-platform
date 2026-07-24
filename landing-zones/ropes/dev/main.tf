#############################################
# Resource Group
#############################################

module "resource_group" {
  source = "../../../modules/resource-group"

  name     = local.resource_group_name
  location = var.location
  tags     = local.common_tags
}

#############################################
# ROPES Dev Spoke Virtual Network
#############################################

module "spoke_vnet" {
  source = "../../../modules/networking/virtual-network"

  name                = local.spoke_vnet_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space       = var.spoke_vnet_address_space

  tags = local.common_tags
}

#############################################
# Spoke Subnets
#############################################

module "spoke_subnets" {
  source   = "../../../modules/networking/subnet"
  for_each = local.subnets

  name                 = each.value.name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.spoke_vnet.name
  address_prefixes     = each.value.address_prefixes

  private_endpoint_network_policies = "Enabled"
}

#############################################
# Network Security Groups
#############################################

module "spoke_nsgs" {
  source   = "../../../modules/networking/network-security-group"
  for_each = local.network_security_groups

  name                = each.value.name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  security_rules      = each.value.rules

  tags = local.common_tags
}

#############################################
# NSG Associations
#############################################

module "spoke_nsg_associations" {
  source   = "../../../modules/networking/network-security-group-association"
  for_each = local.network_security_groups

  subnet_id                 = module.spoke_subnets[each.key].id
  network_security_group_id = module.spoke_nsgs[each.key].id
}

#############################################
# Hub-to-Spoke Peering
#############################################

module "hub_to_spoke_peering" {
  source = "../../../modules/networking/virtual-network-peering"

  name = "peer-hub-to-${local.application_name}-${local.environment}"

  resource_group_name  = data.terraform_remote_state.connectivity.outputs.hub_resource_group_name
  virtual_network_name = data.terraform_remote_state.connectivity.outputs.hub_vnet_name

  remote_virtual_network_id = module.spoke_vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

#############################################
# Spoke-to-Hub Peering
#############################################

module "spoke_to_hub_peering" {
  source = "../../../modules/networking/virtual-network-peering"

  name = "peer-${local.application_name}-${local.environment}-to-hub"

  resource_group_name  = module.resource_group.name
  virtual_network_name = module.spoke_vnet.name

  remote_virtual_network_id = data.terraform_remote_state.connectivity.outputs.hub_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}