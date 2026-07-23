variable "scope" {
  description = "Resource ID defining the scope of the role assignment."
  type        = string
}

variable "principal_id" {
  description = "Object ID of the user, group, service principal, or managed identity receiving the role."
  type        = string
}

variable "role_definition_name" {
  description = "Name of the Azure built-in or custom role to assign."
  type        = string
}

variable "principal_type" {
  description = "Type of principal receiving the role assignment."
  type        = string
  default     = "ServicePrincipal"

  validation {
    condition = contains([
      "User",
      "Group",
      "ServicePrincipal",
      "ForeignGroup",
      "Device"
    ], var.principal_type)

    error_message = "principal_type must be User, Group, ServicePrincipal, ForeignGroup, or Device."
  }
}

variable "description" {
  description = "Optional description for the role assignment."
  type        = string
  default     = null
}