#############################################
# Remote State
#############################################

data "terraform_remote_state" "connectivity" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate-prod-aue-001"
    storage_account_name = "sttfprodaue001"
    container_name       = "tfstate"
    key                  = "platform/connectivity.tfstate"
  }
}

data "terraform_remote_state" "identity" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate-prod-aue-001"
    storage_account_name = "sttfprodaue001"
    container_name       = "tfstate"
    key                  = "platform/identity.tfstate"
  }
}

#############################################
# Resource Group
#############################################

module "resource_group" {
  source = "../../modules/resource-group"

  name     = local.resource_group_name
  location = local.location
  tags     = local.common_tags
}

#############################################
# Management VM
#############################################

module "management_vm" {
  source = "../../modules/compute/windows-virtual-machine"

  name                = local.vm_name
  computer_name       = "MGT01"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  subnet_id = data.terraform_remote_state.connectivity.outputs.hub_subnet_ids["management"]

  admin_username = var.admin_username
  admin_password = var.admin_password

  vm_size = "Standard_B2ts_v2"

  tags = local.common_tags
}