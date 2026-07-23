data "azurerm_client_config" "current" {}
data "terraform_remote_state" "connectivity" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate-prod-aue-001"
    storage_account_name = "sttfprodaue001"
    container_name       = "tfstate"
    key                  = "platform/connectivity.tfstate"
  }
}
resource "azurerm_resource_group" "identity" {
  name     = "rg-identity-${var.environment}-${var.region_code}-001"
  location = var.location

  tags = local.common_tags
}

module "platform_identity" {
  source = "../../modules/identity/user-assigned-managed-identity"

  name                = local.platform_identity.name
  location            = var.location
  resource_group_name = azurerm_resource_group.identity.name

  tags = local.common_tags
}

module "platform_key_vault" {
  source = "../../modules/security/key-vault"

  name                = local.platform_key_vault.name
  location            = var.location
  resource_group_name = azurerm_resource_group.identity.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name                      = local.platform_key_vault.sku_name
  soft_delete_retention_days    = local.platform_key_vault.soft_delete_retention_days
  purge_protection_enabled      = local.platform_key_vault.purge_protection_enabled
  public_network_access_enabled = local.platform_key_vault.public_network_access_enabled

  tags = local.common_tags
}

module "platform_keyvault_secrets_officer" {
  source = "../../modules/identity/role-assignment"

  scope                = module.platform_key_vault.id
  principal_id         = module.platform_identity.principal_id
  role_definition_name = "Key Vault Secrets Officer"

  description = "Platform managed identity can manage Key Vault secrets."
}

module "platform_key_vault_private_endpoint" {
  source = "../../modules/networking/private-endpoint"

  name                = "pep-kv-platform-${var.environment}-${var.region_code}-001"
  location            = var.location
  resource_group_name = azurerm_resource_group.identity.name

  subnet_id = data.terraform_remote_state.connectivity.outputs.shared_services_subnet_id

  private_connection_resource_id = module.platform_key_vault.id

  subresource_names = [
    "vault"
  ]

  private_dns_zone_ids = [
    data.terraform_remote_state.connectivity.outputs.key_vault_private_dns_zone_id
  ]

  tags = local.common_tags
}