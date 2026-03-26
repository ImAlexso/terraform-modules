variable "resource_group_name" {
  description = "Name of the resource group used for Terraform remote state."
  type        = string
}

variable "location" {
  description = "Azure region for the bootstrap resources."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account used for Terraform remote state."
  type        = string

  validation {
    condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24
    error_message = "The storage account name must be between 3 and 24 characters."
  }

  validation {
    condition     = can(regex("^[a-z0-9]+$", var.storage_account_name))
    error_message = "The storage account name must contain only lowercase letters and numbers."
  }
}

variable "tfstate_container_name" {
  description = "Name of the blob container used to store the Terraform state file."
  type        = string
  default     = "tfstate"
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
  description = "Whether public network access is enabled on the tfstate storage account."
  type        = bool
  default     = true
}

variable "blob_properties" {
  description = "Optional blob service properties for the tfstate storage account."
  type = object({
    versioning_enabled       = optional(bool)
    change_feed_enabled      = optional(bool)
    last_access_time_enabled = optional(bool)
  })
  default = {
    versioning_enabled       = true
    change_feed_enabled      = true
    last_access_time_enabled = true
  }
}

variable "container_metadata" {
  description = "Metadata applied to the tfstate container."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags applied to bootstrap resources."
  type        = map(string)
  default     = {}
}
