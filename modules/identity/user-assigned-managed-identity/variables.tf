variable "name" {
  description = "Name of the user-assigned managed identity."
  type        = string
}

variable "location" {
  description = "Azure region where the managed identity is deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "tags" {
  description = "Tags applied to the managed identity."
  type        = map(string)
  default     = {}
}