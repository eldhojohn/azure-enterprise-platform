resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_virtual_network_gateway" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  type       = "Vpn"
  vpn_type   = "RouteBased"
  sku        = var.sku
  generation = var.generation

  active_active = var.active_active
  bgp_enabled   = var.enable_bgp

  ip_configuration {
    name                          = "gateway-ip-configuration"
    public_ip_address_id          = azurerm_public_ip.this.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet_id
  }

  tags = var.tags
}