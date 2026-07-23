variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "prod"
}

variable "location" {
  description = "Azure deployment region."
  type        = string
  default     = "australiaeast"
}

variable "region_code" {
  description = "Short code for the Azure region."
  type        = string
  default     = "aue"
}