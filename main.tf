resource "google_scc_event_threat_detection_custom_module" "scc_event_threat_detection_custom_modules" {
  for_each = var.scc_event_threat_detection_custom_modules

  config           = each.value.config
  enablement_state = each.value.enablement_state
  organization     = each.value.organization
  type             = each.value.type
  deletion_policy  = each.value.deletion_policy
  display_name     = each.value.display_name

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

