variable "name" {
  description = "Name of the storage account."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the storage account."
  type        = string
}

variable "location" {
  description = "Azure region for the storage account."
  type        = string
}

variable "account_tier" {
  description = "Tier of the storage account."
  type        = string
}

variable "account_replication_type" {
  description = "Replication type of the storage account."
  type        = string
}

variable "account_kind" {
  description = "Kind of the storage account."
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "Optional access tier for supported storage account kinds."
  type        = string
  default     = null
}

variable "min_tls_version" {
  description = "Minimum TLS version for the storage account."
  type        = string
  default     = "TLS1_2"
}

variable "https_traffic_only_enabled" {
  description = "Whether HTTPS-only traffic is enforced."
  type        = bool
  default     = true
}

variable "allow_nested_items_to_be_public" {
  description = "Whether nested blob items can be public."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the storage account."
  type        = bool
  default     = false
}

variable "shared_access_key_enabled" {
  description = "Whether shared access key authentication is enabled."
  type        = bool
  default     = true
}

variable "sftp_enabled" {
  description = "Whether SFTP is enabled on the storage account."
  type        = bool
  default     = false
}

variable "blob_properties" {
  description = "Optional blob service properties."
  type = object({
    versioning_enabled       = optional(bool)
    change_feed_enabled      = optional(bool)
    last_access_time_enabled = optional(bool)
  })
  default = null
}

variable "tags" {
  description = "Tags applied to the storage account."
  type        = map(string)
  default     = {}
}
