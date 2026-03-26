variable "resource_group_name" {
  description = "Name of the resource group used for Terraform remote state."
  type        = string
}

variable "location" {
  description = "Azure region for the Terraform remote state resources."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account used for Terraform remote state."
  type        = string
}

variable "tfstate_container_name" {
  description = "Name of the private blob container used to store Terraform state files."
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
  description = "Optional access tier for the storage account."
  type        = string
  default     = null
}

variable "min_tls_version" {
  description = "Minimum TLS version enforced on the storage account."
  type        = string
  default     = "TLS1_2"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the storage account."
  type        = bool
  default     = true
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

variable "container_metadata" {
  description = "Optional metadata applied to the Terraform state container."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags applied to bootstrap resources."
  type        = map(string)
  default     = {}
}
