output "resource_group_id" {
  description = "Resource ID of the compute resource group."
  value       = module.resource_group.id
}

output "resource_group_name" {
  description = "Name of the compute resource group."
  value       = module.resource_group.name
}

output "virtual_machine_id" {
  description = "Resource ID of the management virtual machine."
  value       = module.management_vm.virtual_machine_id
}

output "virtual_machine_name" {
  description = "Name of the management virtual machine."
  value       = module.management_vm.virtual_machine_name
}

output "network_interface_id" {
  description = "Resource ID of the management VM network interface."
  value       = module.management_vm.network_interface_id
}

output "private_ip_address" {
  description = "Private IP address of the management virtual machine."
  value       = module.management_vm.private_ip_address
}

output "principal_id" {
  description = "Principal ID of the management VM system-assigned managed identity."
  value       = module.management_vm.principal_id
}

