locals {
  common_tags = {
    Organisation = var.organisation
    Owner        = var.owner
    Project      = var.project
    Environment  = var.environment
    ManagedBy    = "Terraform"
    CostCentre   = var.cost_centre
    BusinessUnit = var.business_unit
  }
}
