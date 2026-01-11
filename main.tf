resource "azurerm_automation_module" "automation_modules" {
  for_each = var.automation_modules

  automation_account_name = each.value.automation_account_name
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name

  module_link {
    dynamic "hash" {
      for_each = each.value.module_link.hash != null ? [each.value.module_link.hash] : []
      content {
        algorithm = hash.value.algorithm
        value     = hash.value.value
      }
    }
    uri = each.value.module_link.uri
  }
}

