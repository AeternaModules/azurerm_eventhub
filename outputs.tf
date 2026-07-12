output "eventhubs_capture_description" {
  description = "Map of capture_description values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.capture_description }
}
output "eventhubs_message_retention" {
  description = "Map of message_retention values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.message_retention }
}
output "eventhubs_name" {
  description = "Map of name values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.name }
}
output "eventhubs_namespace_id" {
  description = "Map of namespace_id values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.namespace_id }
}
output "eventhubs_namespace_name" {
  description = "Map of namespace_name values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.namespace_name }
}
output "eventhubs_partition_count" {
  description = "Map of partition_count values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.partition_count }
}
output "eventhubs_partition_ids" {
  description = "Map of partition_ids values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.partition_ids }
}
output "eventhubs_resource_group_name" {
  description = "Map of resource_group_name values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.resource_group_name }
}
output "eventhubs_retention_description" {
  description = "Map of retention_description values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.retention_description }
}
output "eventhubs_status" {
  description = "Map of status values across all eventhubs, keyed the same as var.eventhubs"
  value       = { for k, v in azurerm_eventhub.eventhubs : k => v.status }
}

