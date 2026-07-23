variable "name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the VM will be deployed."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the network interface will be attached."
  type        = string
}

variable "vm_size" {
  description = "Azure VM size."
  type        = string
  default     = "Standard_B2s"
}

variable "computer_name" {
  description = "Windows computer name."
  type        = string
  default     = null
}

variable "admin_username" {
  description = "Local administrator username."
  type        = string
}

variable "admin_password" {
  description = "Local administrator password."
  type        = string
  sensitive   = true
}

variable "private_ip_address_allocation" {
  description = "Private IP allocation method."
  type        = string
  default     = "Dynamic"

  validation {
    condition     = contains(["Dynamic", "Static"], var.private_ip_address_allocation)
    error_message = "private_ip_address_allocation must be Dynamic or Static."
  }
}

variable "private_ip_address" {
  description = "Static private IP address when allocation is Static."
  type        = string
  default     = null
}

variable "os_disk_storage_account_type" {
  description = "Storage account type for the OS disk."
  type        = string
  default     = "StandardSSD_LRS"
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB."
  type        = number
  default     = 128
}

variable "enable_boot_diagnostics" {
  description = "Enable managed boot diagnostics."
  type        = bool
  default     = true
}

variable "enable_system_assigned_identity" {
  description = "Enable a system-assigned managed identity."
  type        = bool
  default     = true
}

variable "license_type" {
  description = "Windows license type."
  type        = string
  default     = null
}

variable "timezone" {
  description = "Windows time zone."
  type        = string
  default     = "AUS Eastern Standard Time"
}

variable "patch_mode" {
  description = "Windows patch mode."
  type        = string
  default     = "AutomaticByOS"
}

variable "source_image_reference" {
  description = "Marketplace image."

  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })

  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2025-datacenter-azure-edition"
    version   = "latest"
  }
}

variable "tags" {
  description = "Tags applied to resources."
  type        = map(string)
  default     = {}
}