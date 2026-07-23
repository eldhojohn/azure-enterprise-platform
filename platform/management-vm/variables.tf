variable "subscription_id" {
  description = "Azure subscription ID used for the deployment."
  type        = string

  validation {
    condition     = length(trimspace(var.subscription_id)) > 0
    error_message = "The subscription ID must not be empty."
  }
}

variable "admin_username" {
  description = "Administrator username for the Windows virtual machine."
  type        = string

  validation {
    condition     = length(trimspace(var.admin_username)) > 0
    error_message = "The administrator username must not be empty."
  }
}

variable "admin_password" {
  description = "Administrator password for the Windows virtual machine."
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.admin_password) >= 12
    error_message = "The administrator password must contain at least 12 characters."
  }
}