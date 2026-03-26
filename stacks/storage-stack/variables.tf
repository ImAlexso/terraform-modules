variable "resource_group_name" {
  description = "Name of the resource group containing storage resources."
  type        = string
}

variable "location" {
  description = "Azure region for storage resources."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
}

variable "account_tier" {
  description = "Tier of the storage account."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type of the storage account."
  type        = string
  default     = "LRS"
}

variable "account_kind" {
  description = "Kind of the storage account."
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "Optional access tier of the storage account."
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
  description = "Whether nested blob items may be public."
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
  description = "Optional blob service properties for the storage account."
  type = object({
    versioning_enabled       = optional(bool)
    change_feed_enabled      = optional(bool)
    last_access_time_enabled = optional(bool)
  })
  default = null
}

variable "container_name" {
  description = "Name of the blob container."
  type        = string
}

variable "container_access_type" {
  description = "Access type of the blob container."
  type        = string
  default     = "private"
}

variable "container_metadata" {
  description = "Optional metadata for the blob container."
  type        = map(string)
  default     = {}
}

variable "private_endpoint_name" {
  description = "Name of the Blob private endpoint."
  type        = string
}

variable "private_endpoints_subnet_id" {
  description = "Subnet ID used for the Blob private endpoint."
  type        = string
}

variable "blob_private_dns_zone_id" {
  description = "Private DNS zone ID used for Blob."
  type        = string
}

variable "private_dns_zone_group_name" {
  description = "Name of the private DNS zone group for the Blob private endpoint."
  type        = string
  default     = "pdzg-blob"
}

variable "tags" {
  description = "Tags applied to storage resources."
  type        = map(string)
  default     = {}
}
