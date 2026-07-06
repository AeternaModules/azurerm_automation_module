output "automation_modules" {
  description = "All automation_module resources"
  value       = azurerm_automation_module.automation_modules
}
output "automation_modules_automation_account_name" {
  description = "List of automation_account_name values across all automation_modules"
  value       = [for k, v in azurerm_automation_module.automation_modules : v.automation_account_name]
}
output "automation_modules_module_link" {
  description = "List of module_link values across all automation_modules"
  value       = [for k, v in azurerm_automation_module.automation_modules : v.module_link]
}
output "automation_modules_name" {
  description = "List of name values across all automation_modules"
  value       = [for k, v in azurerm_automation_module.automation_modules : v.name]
}
output "automation_modules_resource_group_name" {
  description = "List of resource_group_name values across all automation_modules"
  value       = [for k, v in azurerm_automation_module.automation_modules : v.resource_group_name]
}

