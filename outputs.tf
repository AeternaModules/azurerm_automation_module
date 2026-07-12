output "automation_modules_automation_account_name" {
  description = "Map of automation_account_name values across all automation_modules, keyed the same as var.automation_modules"
  value       = { for k, v in azurerm_automation_module.automation_modules : k => v.automation_account_name }
}
output "automation_modules_module_link" {
  description = "Map of module_link values across all automation_modules, keyed the same as var.automation_modules"
  value       = { for k, v in azurerm_automation_module.automation_modules : k => v.module_link }
}
output "automation_modules_name" {
  description = "Map of name values across all automation_modules, keyed the same as var.automation_modules"
  value       = { for k, v in azurerm_automation_module.automation_modules : k => v.name }
}
output "automation_modules_resource_group_name" {
  description = "Map of resource_group_name values across all automation_modules, keyed the same as var.automation_modules"
  value       = { for k, v in azurerm_automation_module.automation_modules : k => v.resource_group_name }
}

