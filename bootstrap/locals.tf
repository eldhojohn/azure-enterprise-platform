locals {
  suffix = "${var.environment}-${var.region_code}-${var.instance}"

  names = {
    backend_rg      = "rg-tfstate-${local.suffix}"
    backend_storage = "sttf${var.environment}${var.region_code}${var.instance}"
    backend_blob    = "tfstate"
  }

  common_tags = {
    Owner        = var.owner
    ManagedBy    = "Terraform"
    Project      = var.project
    Environment  = var.environment
    CostCentre   = var.cost_centre
    BusinessUnit = var.business_unit
    Organisation = var.organisation
  }
}