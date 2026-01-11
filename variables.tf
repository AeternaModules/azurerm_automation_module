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
}

