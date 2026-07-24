data "terraform_remote_state" "connectivity" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate-prod-aue-001"
    storage_account_name = "sttfprodaue001"
    container_name       = "tfstate"
    key                  = "platform/connectivity.tfstate"
  }
}