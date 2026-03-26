variable "name" {
  description = "Name of the Key Vault."
  type        = string
}

variable "location" {
  description = "Azure region for the Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Key Vault."
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID associated with the Key Vault."
  type        = string
}

variable "sku_name" {
  description = "SKU of the Key Vault."
  type        = string
  default     = "standard"
}

variable "rbac_authorization_enabled" {
  description = "Whether RBAC authorization is enabled for the Key Vault."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the Key Vault."
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "Soft delete retention period in days."
  type        = number
  default     = 7
}

variable "purge_protection_enabled" {
  description = "Whether purge protection is enabled for the Key Vault."
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Whether the Key Vault is enabled for disk encryption."
  type        = bool
  default     = false
}

variable "enabled_for_deployment" {
  description = "Whether the Key Vault is enabled for Azure VM deployment."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Whether the Key Vault is enabled for template deployment."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to the Key Vault."
  type        = map(string)
  default     = {}
}
