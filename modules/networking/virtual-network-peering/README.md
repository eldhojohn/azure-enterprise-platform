# Virtual Network Peering

Creates one direction of Azure Virtual Network peering.

The module should normally be called twice for bidirectional peering:

1. Hub to spoke
2. Spoke to hub

## Usage

```hcl
module "hub_to_spoke" {
  source = "../../../modules/networking/virtual-network-peering"

  name                      = "peer-hub-to-ropes-dev"
  resource_group_name       = var.hub_resource_group_name
  virtual_network_name      = var.hub_virtual_network_name
  remote_virtual_network_id = module.spoke_vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

module "spoke_to_hub" {
  source = "../../../modules/networking/virtual-network-peering"

  name                      = "peer-ropes-dev-to-hub"
  resource_group_name       = module.resource_group.name
  virtual_network_name      = module.spoke_vnet.name
  remote_virtual_network_id = var.hub_virtual_network_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}