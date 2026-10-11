variable "scc_event_threat_detection_custom_modules" {
  description = <<EOT
Map of scc_event_threat_detection_custom_modules, attributes below
Required:
    - config
    - enablement_state
    - organization
    - type
Optional:
    - deletion_policy
    - display_name
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    config           = string
    enablement_state = string
    organization     = string
    type             = string
    deletion_policy  = optional(string)
    display_name     = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.scc_event_threat_detection_custom_modules : (
        can(jsondecode(v.config))
      )
    ])
    error_message = "must be valid JSON"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

