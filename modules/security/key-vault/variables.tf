variable "name" {
  description = "Globally unique name of the Azure Key Vault."
  type        = string
}

variable "location" {
  description = "Azure region where the Key Vault is deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID."
  type        = string
}

variable "sku_name" {
  description = "Key Vault SKU."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "sku_name must be standard or premium."
  }
}

variable "soft_delete_retention_days" {
  description = "Number of days deleted vault objects are retained."
  type        = number
  default     = 90

  validation {
    condition = (
      var.soft_delete_retention_days >= 7 &&
      var.soft_delete_retention_days <= 90
    )

    error_message = "soft_delete_retention_days must be between 7 and 90."
  }
}

variable "purge_protection_enabled" {
  description = "Whether purge protection is enabled."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Whether the Key Vault permits public network access."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to the Key Vault."
  type        = map(string)
  default     = {}
}