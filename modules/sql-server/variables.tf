variable "name" {
  description = "Name of the SQL server."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the SQL server."
  type        = string
}

variable "location" {
  description = "Azure region for the SQL server."
  type        = string
}

variable "version" {
  description = "Version of Azure SQL Server."
  type        = string
  default     = "12.0"
}

variable "administrator_login" {
  description = "Administrator login for the SQL server."
  type        = string
}

variable "administrator_login_password" {
  description = "Administrator password for the SQL server."
  type        = string
  sensitive   = true
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the SQL server."
  type        = bool
  default     = false
}

variable "minimum_tls_version" {
  description = "Minimum TLS version for the SQL server."
  type        = string
  default     = "1.2"
}

variable "azuread_administrator" {
  description = "Optional Azure AD administrator for the SQL server."
  type = object({
    login_username              = string
    object_id                   = string
    tenant_id                   = string
    azuread_authentication_only = optional(bool, false)
  })
  default = null
}

variable "tags" {
  description = "Tags applied to the SQL server."
  type        = map(string)
  default     = {}
}
