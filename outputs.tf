output "eventhubs_id" {
  description = "Map of id values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "eventhubs_capture_description" {
  description = "Map of capture_description values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => one(v.capture_description) if v.capture_description != null && length(v.capture_description) > 0 }
}
output "eventhubs_message_retention" {
  description = "Map of message_retention values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.message_retention if v.message_retention != null }
}
output "eventhubs_name" {
  description = "Map of name values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "eventhubs_namespace_id" {
  description = "Map of namespace_id values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.namespace_id if v.namespace_id != null && length(v.namespace_id) > 0 }
}
output "eventhubs_partition_count" {
  description = "Map of partition_count values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.partition_count if v.partition_count != null }
}
output "eventhubs_partition_ids" {
  description = "Map of partition_ids values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.partition_ids if v.partition_ids != null && length(v.partition_ids) > 0 }
}
output "eventhubs_retention_description" {
  description = "Map of retention_description values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => one(v.retention_description) if v.retention_description != null && length(v.retention_description) > 0 }
}
output "eventhubs_status" {
  description = "Map of status values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.status if v.status != null && length(v.status) > 0 }
}

