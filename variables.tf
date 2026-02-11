variable "eventhubs" {
  description = <<EOT
Map of eventhubs, attributes below
Required:
    - name
    - partition_count
Optional:
    - message_retention
    - namespace_id
    - namespace_name
    - resource_group_name
    - status
    - capture_description (block):
        - destination (required, block):
            - archive_name_format (required)
            - blob_container_name (required)
            - name (required)
            - storage_account_id (required)
        - enabled (required)
        - encoding (required)
        - interval_in_seconds (optional)
        - size_limit_in_bytes (optional)
        - skip_empty_archives (optional)
    - retention_description (block):
        - cleanup_policy (required)
        - retention_time_in_hours (optional)
        - tombstone_retention_time_in_hours (optional)
EOT

  type = map(object({
    name                = string
    partition_count     = number
    message_retention   = optional(number)
    namespace_id        = optional(string)
    namespace_name      = optional(string)
    resource_group_name = optional(string)
    status              = optional(string) # Default: "Active"
    capture_description = optional(object({
      destination = object({
        archive_name_format = string
        blob_container_name = string
        name                = string
        storage_account_id  = string
      })
      enabled             = bool
      encoding            = string
      interval_in_seconds = optional(number) # Default: 300
      size_limit_in_bytes = optional(number) # Default: 314572800
      skip_empty_archives = optional(bool)   # Default: false
    }))
    retention_description = optional(object({
      cleanup_policy                    = string
      retention_time_in_hours           = optional(number)
      tombstone_retention_time_in_hours = optional(number)
    }))
  }))
}

