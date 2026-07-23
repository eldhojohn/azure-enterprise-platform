resource "azurerm_network_interface" "this" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address            = var.private_ip_address
  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "this" {
  name                = var.name
  computer_name = coalesce(var.computer_name, var.name)
  resource_group_name = var.resource_group_name
  location            = var.location

  size = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  provision_vm_agent        = true
  automatic_updates_enabled = true

  
  patch_mode            = "AutomaticByPlatform"
  patch_assessment_mode = "AutomaticByPlatform"
  hotpatching_enabled = true

  timezone = var.timezone

  license_type = var.license_type

  os_disk {
    name                 = "${var.name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  dynamic "identity" {
    for_each = var.enable_system_assigned_identity ? [1] : []

    content {
      type = "SystemAssigned"
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.enable_boot_diagnostics ? [1] : []

    content {}
  }

  tags = var.tags
}