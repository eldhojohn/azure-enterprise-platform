variable "name" {
  description = "Name of the Azure Private DNS zone."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the Private DNS zone."
  type        = string
}

variable "virtual_network_links" {
  description = "Virtual networks linked to the Private DNS zone."
  type = map(object({
    virtual_network_id   = string
    registration_enabled = optional(bool, false)
  }))
  default = {}
}

variable "tags" {
  description = "Tags applied to the Private DNS zone."
  type        = map(string)
  default     = {}
}