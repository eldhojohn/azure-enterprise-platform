
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-prod-aue-001"
    storage_account_name = "sttfprodaue001"
    container_name       = "tfstate"
    key                  = "platform/management.tfstate"
    use_azuread_auth     = true
  }
}


