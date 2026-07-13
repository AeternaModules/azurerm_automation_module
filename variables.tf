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
  # --- Unconfirmed validation candidates, derived from azurerm_automation_module's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: automation_account_name
  #   source:    validate.AutomationAccount: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
}

