locals {
  common_tags = {
    BusinessUnit = "Enterprise Platforms"
    CostCentre   = "ICT"
    Environment  = var.environment
    ManagedBy    = "Terraform"
    Organisation = "QPS"
    Owner        = "QPS"
    Project      = "Azure Enterprise Platform"
  }

  platform_identity = {
    name = "id-platform-${var.environment}-${var.region_code}-001"
  }

  platform_key_vault = {
    name                          = "kv-plat-${var.environment}-${var.region_code}-001"
    sku_name                      = "standard"
    soft_delete_retention_days    = 90
    purge_protection_enabled      = true
    public_network_access_enabled = true
  }

}
