resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_bastion_host" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku                = var.sku
  copy_paste_enabled = var.copy_paste_enabled
  tunneling_enabled  = var.sku == "Standard" || var.sku == "Premium" ? var.tunneling_enabled : false

  ip_configuration {
    name                 = "bastion-ip-configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.this.id
  }

  tags = var.tags
}