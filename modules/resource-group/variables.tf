variable "name" {
  description = "Name of the Azure resource group."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The resource group name must not be empty."
  }
}

variable "location" {
  description = "Azure region where the resource group will be created."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "The location must not be empty."
  }
}

variable "managed_by" {
  description = "Optional resource ID of the resource that manages this resource group."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to the resource group."
  type        = map(string)
  default     = {}
}