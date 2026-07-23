# Windows Virtual Machine Module

Deploys a reusable Windows Server virtual machine with an Azure network interface.

## Features

- Windows Server 2025 Azure Edition
- Existing subnet integration
- No public IP
- Optional System Assigned Managed Identity
- Managed Boot Diagnostics
- Configurable VM size
- Configurable OS disk
- Dynamic or Static private IP
- Fully tagged resources

## Resources

- azurerm_network_interface
- azurerm_windows_virtual_machine

## Outputs

- VM ID
- VM Name
- Network Interface ID
- Private IP Address
- Managed Identity Principal ID

## Notes

This module intentionally does **not** create:

- Public IP
- NSG
- Route Table
- Backup
- Azure Monitor Agent
- Defender configuration
- VM Extensions

These responsibilities belong to other platform layers.