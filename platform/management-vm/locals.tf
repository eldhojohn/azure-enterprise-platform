locals {
  environment = "prod"
  location    = "Australia East"
  region_code = "aue"

  resource_group_name = "rg-compute-${local.environment}-${local.region_code}-001"
  vm_name             = "vm-mgmt-${local.environment}-${local.region_code}-001"

  common_tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
    Project     = "Azure Enterprise Platform"
    Workload    = "Management"
  }
}