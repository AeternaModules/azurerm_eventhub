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
            - storage_authentication_id (optional)
            - storage_authentication_type (optional)
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
        archive_name_format         = string
        blob_container_name         = string
        name                        = string
        storage_account_id          = string
        storage_authentication_id   = optional(string)
        storage_authentication_type = optional(string) # Default: "StorageSAS"
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
  validation {
    condition = alltrue([
      for k, v in var.eventhubs : (
        v.capture_description == null || (v.capture_description.interval_in_seconds == null || (v.capture_description.interval_in_seconds >= 60 && v.capture_description.interval_in_seconds <= 900))
      )
    ])
    error_message = "must be between 60 and 900"
  }
  validation {
    condition = alltrue([
      for k, v in var.eventhubs : (
        v.capture_description == null || (v.capture_description.size_limit_in_bytes == null || (v.capture_description.size_limit_in_bytes >= 10485760 && v.capture_description.size_limit_in_bytes <= 524288000))
      )
    ])
    error_message = "must be between 10485760 and 524288000"
  }
  validation {
    condition = alltrue([
      for k, v in var.eventhubs : (
        v.capture_description == null || (contains(["EventHubArchive.AzureBlockBlob"], v.capture_description.destination.name))
      )
    ])
    error_message = "must be one of: EventHubArchive.AzureBlockBlob"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_eventhub's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.ValidateEventHubName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: namespace_id
  #   source:    [from namespaces.ValidateNamespaceID] !ok
  # path: namespace_id
  #   source:    [from namespaces.ValidateNamespaceID] err != nil
  # path: partition_count
  #   source:    validate.ValidateEventHubPartitionCount: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: message_retention
  #   source:    validate.ValidateEventHubMessageRetentionCount: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: retention_description.cleanup_policy
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: capture_description.encoding
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: capture_description.destination.archive_name_format
  #   source:    [from validate.ValidateEventHubArchiveNameFormat] !strings.Contains(value, component)
  # path: capture_description.destination.storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] !ok
  # path: capture_description.destination.storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] err != nil
  # path: capture_description.destination.storage_authentication_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: capture_description.destination.storage_authentication_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: capture_description.destination.storage_authentication_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: status
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

