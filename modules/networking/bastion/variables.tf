variable "name" {
  description = "Name of the Azure Bastion host."
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Bastion public IP address."
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "subnet_id" {
  description = "Resource ID of the AzureBastionSubnet."
  type        = string
}

variable "sku" {
  description = "Azure Bastion SKU."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium", "Developer"], var.sku)
    error_message = "The Bastion SKU must be Basic, Standard, Premium, or Developer."
  }
}

variable "copy_paste_enabled" {
  description = "Enable copy and paste through Azure Bastion."
  type        = bool
  default     = true
}

variable "tunneling_enabled" {
  description = "Enable native client tunnelling."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the resources."
  type        = map(string)
  default     = {}
}