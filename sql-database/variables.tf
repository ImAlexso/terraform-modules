variable "name" {
  description = "Name of the SQL database."
  type        = string
}

variable "server_id" {
  description = "ID of the parent SQL server."
  type        = string
}

variable "sku_name" {
  description = "SKU name of the SQL database."
  type        = string
}

variable "collation" {
  description = "Optional collation for the SQL database."
  type        = string
  default     = null
}

variable "max_size_gb" {
  description = "Optional maximum size in GB for the SQL database."
  type        = number
  default     = null
}

variable "zone_redundant" {
  description = "Whether the SQL database is zone redundant."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to the SQL database."
  type        = map(string)
  default     = {}
}
