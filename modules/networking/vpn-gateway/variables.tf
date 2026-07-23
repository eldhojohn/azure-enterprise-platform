variable "name" {
  description = "Name of the Azure VPN Gateway."
  type        = string
}

variable "public_ip_name" {
  description = "Name of the VPN Gateway public IP address."
  type        = string
}

variable "location" {
  description = "Azure region where the resources are deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "gateway_subnet_id" {
  description = "Resource ID of the GatewaySubnet."
  type        = string
}

variable "sku" {
  description = "Azure VPN Gateway SKU."
  type        = string
  default     = "VpnGw1AZ"

  validation {
    condition = contains([
      "VpnGw1AZ",
      "VpnGw2AZ",
      "VpnGw3AZ",
      "VpnGw4AZ",
      "VpnGw5AZ"
    ], var.sku)

    error_message = "Use an availability-zone-capable VPN Gateway SKU."
  }
}

variable "generation" {
  description = "VPN Gateway generation."
  type        = string
  default     = "Generation2"

  validation {
    condition     = contains(["Generation1", "Generation2"], var.generation)
    error_message = "Generation must be Generation1 or Generation2."
  }
}

variable "active_active" {
  description = "Deploy the VPN Gateway in active-active mode."
  type        = bool
  default     = false
}

variable "enable_bgp" {
  description = "Enable BGP on the VPN Gateway."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to the resources."
  type        = map(string)
  default     = {}
}