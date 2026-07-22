variable "organisation" {
  description = "Organisation responsible for the platform."
  type        = string
}

variable "project" {
  description = "Project or platform name."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be dev, test, or prod."
  }
}

variable "location" {
  description = "Primary Azure region."
  type        = string
}

variable "region_code" {
  description = "Short code for the Azure region."
  type        = string
}

variable "owner" {
  description = "Team or organisation responsible for the resources."
  type        = string
}

variable "cost_centre" {
  description = "Cost centre associated with the platform."
  type        = string
}

variable "business_unit" {
  description = "Business unit responsible for the platform."
  type        = string
}
