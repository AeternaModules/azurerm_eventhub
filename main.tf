resource "azurerm_eventhub" "eventhubs" {
  for_each = var.eventhubs

  name                = each.value.name
  partition_count     = each.value.partition_count
  message_retention   = each.value.message_retention
  namespace_id        = each.value.namespace_id
  namespace_name      = each.value.namespace_name
  resource_group_name = each.value.resource_group_name
  status              = each.value.status

  dynamic "capture_description" {
    for_each = each.value.capture_description != null ? [each.value.capture_description] : []
    content {
      destination {
        archive_name_format = capture_description.value.destination.archive_name_format
        blob_container_name = capture_description.value.destination.blob_container_name
        name                = capture_description.value.destination.name
        storage_account_id  = capture_description.value.destination.storage_account_id
      }
      enabled             = capture_description.value.enabled
      encoding            = capture_description.value.encoding
      interval_in_seconds = capture_description.value.interval_in_seconds
      size_limit_in_bytes = capture_description.value.size_limit_in_bytes
      skip_empty_archives = capture_description.value.skip_empty_archives
    }
  }

  dynamic "retention_description" {
    for_each = each.value.retention_description != null ? [each.value.retention_description] : []
    content {
      cleanup_policy                    = retention_description.value.cleanup_policy
      retention_time_in_hours           = retention_description.value.retention_time_in_hours
      tombstone_retention_time_in_hours = retention_description.value.tombstone_retention_time_in_hours
    }
  }
}

