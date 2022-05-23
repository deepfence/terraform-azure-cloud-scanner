output "resource_group_name" {
  value       = length(azurerm_resource_group.rg) > 0 ? azurerm_resource_group.rg[0].name : var.resource_group_name
  description = "Created resources group name"
}