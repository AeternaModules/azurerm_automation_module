output "automation_modules_id" {
  description = "Map of id values across all automation_modules, keyed the same as var.automation_modules"
  value       = { for k, v in azurerm_automation_module.automation_modules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "automation_modules_automation_account_name" {
  description = "Map of automation_account_name values across all automation_modules, keyed the same as var.automation_modules"
  value       = { for k, v in azurerm_automation_module.automation_modules : k => v.automation_account_name if v.automation_account_name != null && length(v.automation_account_name) > 0 }
}
output "automation_modules_module_link" {
  description = "Map of module_link values across all automation_modules, keyed the same as var.automation_modules"
  value       = { for k, v in azurerm_automation_module.automation_modules : k => v.module_link if v.module_link != null && length(v.module_link) > 0 }
}
output "automation_modules_name" {
  description = "Map of name values across all automation_modules, keyed the same as var.automation_modules"
  value       = { for k, v in azurerm_automation_module.automation_modules : k => v.name if v.name != null && length(v.name) > 0 }
}
output "automation_modules_resource_group_name" {
  description = "Map of resource_group_name values across all automation_modules, keyed the same as var.automation_modules"
  value       = { for k, v in azurerm_automation_module.automation_modules : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}

