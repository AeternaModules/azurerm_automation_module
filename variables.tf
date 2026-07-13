variable "automation_modules" {
  description = <<EOT
Map of automation_modules, attributes below
Required:
    - automation_account_name
    - name
    - resource_group_name
    - module_link (block):
        - hash (optional, block):
            - algorithm (required)
            - value (required)
        - uri (required)
EOT

  type = map(object({
    automation_account_name = string
    name                    = string
    resource_group_name     = string
    module_link = object({
      hash = optional(object({
        algorithm = string
        value     = string
      }))
      uri = string
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.automation_modules : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_modules : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_modules : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_modules : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

