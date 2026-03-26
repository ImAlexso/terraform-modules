variable "resource_group_name" {
  description = "Name of the resource group containing security resources."
  type        = string
}

variable "location" {
  description = "Azure region for security resources."
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID for the Key Vault."
  type        = string
}

variable "key_vault_name" {
  description = "Name of the Key Vault."
  type        = string
}

variable "sku_name" {
  description = "SKU name of the Key Vault."
  type        = string
  default     = "standard"
}

variable "rbac_authorization_enabled" {
  description = "Whether RBAC authorization is enabled on the Key Vault."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the Key Vault."
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "Soft delete retention in days for the Key Vault."
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
  description = "Whether the Key Vault is enabled for deployment."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Whether the Key Vault is enabled for template deployment."
  type        = bool
  default     = false
}

variable "private_endpoint_name" {
  description = "Name of the private endpoint for the Key Vault."
  type        = string
}

variable "private_endpoints_subnet_id" {
  description = "Subnet ID used for the Key Vault private endpoint."
  type        = string
}

variable "key_vault_private_dns_zone_id" {
  description = "Private DNS zone ID for Key Vault."
  type        = string
}

variable "private_dns_zone_group_name" {
  description = "Name of the private DNS zone group used by the Key Vault private endpoint."
  type        = string
  default     = "pdzg-kv"
}

variable "role_assignments" {
  description = "Optional role assignments to create on the Key Vault."
  type = list(object({
    role_definition_name = string
    principal_id         = string
    description          = optional(string)
    principal_type       = optional(string)
  }))
  default = []
}

variable "tags" {
  description = "Tags applied to security resources."
  type        = map(string)
  default     = {}
}
