output "eventhubs" {
  description = "All eventhub resources"
  value       = azurerm_eventhub.eventhubs
}
output "eventhubs_capture_description" {
  description = "List of capture_description values across all eventhubs"
  value       = [for k, v in azurerm_eventhub.eventhubs : v.capture_description]
}
output "eventhubs_message_retention" {
  description = "List of message_retention values across all eventhubs"
  value       = [for k, v in azurerm_eventhub.eventhubs : v.message_retention]
}
output "eventhubs_name" {
  description = "List of name values across all eventhubs"
  value       = [for k, v in azurerm_eventhub.eventhubs : v.name]
}
output "eventhubs_namespace_id" {
  description = "List of namespace_id values across all eventhubs"
  value       = [for k, v in azurerm_eventhub.eventhubs : v.namespace_id]
}
output "eventhubs_namespace_name" {
  description = "List of namespace_name values across all eventhubs"
  value       = [for k, v in azurerm_eventhub.eventhubs : v.namespace_name]
}
output "eventhubs_partition_count" {
  description = "List of partition_count values across all eventhubs"
  value       = [for k, v in azurerm_eventhub.eventhubs : v.partition_count]
}
output "eventhubs_partition_ids" {
  description = "List of partition_ids values across all eventhubs"
  value       = [for k, v in azurerm_eventhub.eventhubs : v.partition_ids]
}
output "eventhubs_resource_group_name" {
  description = "List of resource_group_name values across all eventhubs"
  value       = [for k, v in azurerm_eventhub.eventhubs : v.resource_group_name]
}
output "eventhubs_retention_description" {
  description = "List of retention_description values across all eventhubs"
  value       = [for k, v in azurerm_eventhub.eventhubs : v.retention_description]
}
output "eventhubs_status" {
  description = "List of status values across all eventhubs"
  value       = [for k, v in azurerm_eventhub.eventhubs : v.status]
}

