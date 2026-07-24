variable "name" {
  description = "Name of the virtual network peering."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The peering name must not be empty."
  }
}

variable "resource_group_name" {
  description = "Resource group containing the local virtual network."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "The resource group name must not be empty."
  }
}

variable "virtual_network_name" {
  description = "Name of the local virtual network."
  type        = string

  validation {
    condition     = length(trimspace(var.virtual_network_name)) > 0
    error_message = "The virtual network name must not be empty."
  }
}

variable "remote_virtual_network_id" {
  description = "Resource ID of the remote virtual network."
  type        = string

  validation {
    condition = can(
      regex(
        "(?i)^/subscriptions/[^/]+/resourceGroups/[^/]+/providers/Microsoft\\.Network/virtualNetworks/[^/]+$",
        var.remote_virtual_network_id
      )
    )

    error_message = "remote_virtual_network_id must be a valid Azure virtual network resource ID."
  }
}

variable "allow_virtual_network_access" {
  description = "Controls whether resources in the peered virtual networks can communicate."
  type        = bool
  default     = true
}

variable "allow_forwarded_traffic" {
  description = "Controls whether forwarded traffic from the remote virtual network is allowed."
  type        = bool
  default     = false
}

variable "allow_gateway_transit" {
  description = "Controls whether the local virtual network gateway may be used by the remote virtual network."
  type        = bool
  default     = false
}

variable "use_remote_gateways" {
  description = "Controls whether the local virtual network uses gateways from the remote virtual network."
  type        = bool
  default     = false
}

variable "peer_complete_virtual_networks_enabled" {
  description = "Controls whether the complete remote virtual network address space is peered."
  type        = bool
  default     = true
}