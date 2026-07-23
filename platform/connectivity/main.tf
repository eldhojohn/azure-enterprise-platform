data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "connectivity" {
  name     = "rg-connectivity-${var.environment}-${var.region_code}-001"
  location = var.location

  tags = local.common_tags
}

module "hub_vnet" {
  source = "../../modules/networking/virtual-network"

  name                = "vnet-hub-${var.environment}-${var.region_code}-001"
  location            = var.location
  resource_group_name = azurerm_resource_group.connectivity.name

  address_space = [
    "10.0.0.0/16"
  ]

  tags = local.common_tags
}

module "hub_subnets" {
  source   = "../../modules/networking/subnet"
  for_each = local.hub_subnets

  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.connectivity.name
  virtual_network_name = module.hub_vnet.name
  address_prefixes     = each.value.address_prefixes
}

module "hub_nsgs" {
  source   = "../../modules/networking/network-security-group"
  for_each = local.hub_network_security_groups

  name                = each.value.name
  location            = var.location
  resource_group_name = azurerm_resource_group.connectivity.name
  security_rules      = each.value.rules
  tags                = local.common_tags
}

module "hub_nsg_associations" {
  source   = "../../modules/networking/network-security-group-association"
  for_each = local.hub_nsg_associations

  subnet_id = module.hub_subnets[each.value.subnet_key].id

  network_security_group_id = module.hub_nsgs[each.value.nsg_key].id
}

module "hub_route_tables" {
  source   = "../../modules/networking/route-table"
  for_each = local.hub_route_tables

  name                          = each.value.name
  location                      = var.location
  resource_group_name           = azurerm_resource_group.connectivity.name
  disable_bgp_route_propagation = each.value.disable_bgp_route_propagation
  routes                        = each.value.routes
  tags                          = local.common_tags
}

module "hub_route_table_associations" {
  source   = "../../modules/networking/route-table-association"
  for_each = local.hub_route_table_associations

  subnet_id = module.hub_subnets[each.value.subnet_key].id

  route_table_id = module.hub_route_tables[each.value.route_table_key].id
}

module "hub_bastion" {
  source = "../../modules/networking/bastion"

  name                = local.hub_bastion.name
  public_ip_name      = local.hub_bastion.public_ip_name
  location            = var.location
  resource_group_name = azurerm_resource_group.connectivity.name
  subnet_id           = module.hub_subnets["bastion"].id

  sku                = local.hub_bastion.sku
  copy_paste_enabled = true
  tunneling_enabled  = true

  tags = local.common_tags
}

module "hub_vpn_gateway" {
  count  = var.deploy_vpn_gateway ? 1 : 0
  source = "../../modules/networking/vpn-gateway"

  name                = local.hub_vpn_gateway.name
  public_ip_name      = local.hub_vpn_gateway.public_ip_name
  location            = var.location
  resource_group_name = azurerm_resource_group.connectivity.name
  gateway_subnet_id   = module.hub_subnets["gateway"].id

  sku           = local.hub_vpn_gateway.sku
  generation    = local.hub_vpn_gateway.generation
  active_active = local.hub_vpn_gateway.active_active
  enable_bgp    = local.hub_vpn_gateway.enable_bgp

  tags = local.common_tags
}

module "private_dns_zones" {
  source   = "../../modules/networking/private-dns-zone"
  for_each = local.private_dns_zones

  name                = each.value.name
  resource_group_name = azurerm_resource_group.connectivity.name

  virtual_network_links = {
    for link_key, link in each.value.virtual_network_links :
    link.name => {
      virtual_network_id   = module.hub_vnet.id
      registration_enabled = link.registration_enabled
    }
  }

  tags = local.common_tags
}