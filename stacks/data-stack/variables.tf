variable "resource_group_name" {
  description = "Name of the resource group containing data resources."
  type        = string
}

variable "location" {
  description = "Azure region for data resources."
  type        = string
}

variable "sql_server_name" {
  description = "Name of the SQL server."
  type        = string
}

variable "sql_server_version" {
  description = "Version of Azure SQL Server."
  type        = string
  default     = "12.0"
}

variable "administrator_login" {
  description = "Administrator login for the SQL server."
  type        = string
}

variable "administrator_login_password" {
  description = "Administrator login password for the SQL server."
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

variable "sql_database_name" {
  description = "Name of the SQL database."
  type        = string
}

variable "sql_database_sku_name" {
  description = "SKU name of the SQL database."
  type        = string
}

variable "sql_database_collation" {
  description = "Optional collation for the SQL database."
  type        = string
  default     = null
}

variable "sql_database_zone_redundant" {
  description = "Whether the SQL database is zone redundant."
  type        = bool
  default     = false
}

variable "sql_database_max_size_gb" {
  description = "Optional max size in GB for the SQL database."
  type        = number
  default     = null
}

variable "private_endpoint_name" {
  description = "Name of the SQL private endpoint."
  type        = string
}

variable "private_endpoints_subnet_id" {
  description = "Subnet ID used for the SQL private endpoint."
  type        = string
}

variable "sql_private_dns_zone_id" {
  description = "Private DNS zone ID used for SQL."
  type        = string
}

variable "private_dns_zone_group_name" {
  description = "Name of the private DNS zone group for the SQL private endpoint."
  type        = string
  default     = "pdzg-sql"
}

variable "tags" {
  description = "Tags applied to data resources."
  type        = map(string)
  default     = {}
}
