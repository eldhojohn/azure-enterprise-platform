variable "location" {
  description = "Azure region for the ROPES Dev landing zone."
  type        = string
  default     = "Australia East"
}

variable "region_code" {
  description = "Short code representing the Azure region."
  type        = string
  default     = "aue"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"

  validation {
    condition = contains(
      ["dev", "test", "uat", "prod"],
      lower(var.environment)
    )

    error_message = "Environment must be dev, test, uat, or prod."
  }
}

variable "application_name" {
  description = "Short application name used in Azure resource naming."
  type        = string
  default     = "ropes"
}

variable "organisation" {
  description = "Organisation responsible for the workload."
  type        = string
  default     = "QPS"
}

variable "owner" {
  description = "Owner of the workload."
  type        = string
  default     = "QPS"
}

variable "project" {
  description = "Project name applied to resource tags."
  type        = string
  default     = "Azure Enterprise Platform"
}

variable "cost_centre" {
  description = "Cost centre applied to resource tags."
  type        = string
  default     = "IT"
}

variable "business_unit" {
  description = "Business unit responsible for the application."
  type        = string
  default     = "Application Services"
}

variable "spoke_vnet_address_space" {
  description = "Address space assigned to the ROPES Dev spoke VNet."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "web_subnet_address_prefixes" {
  description = "Address prefixes assigned to the web subnet."
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "data_subnet_address_prefixes" {
  description = "Address prefixes assigned to the data subnet."
  type        = list(string)
  default     = ["10.10.2.0/24"]
}

variable "private_endpoint_subnet_address_prefixes" {
  description = "Address prefixes assigned to the private endpoint subnet."
  type        = list(string)
  default     = ["10.10.3.0/24"]
}