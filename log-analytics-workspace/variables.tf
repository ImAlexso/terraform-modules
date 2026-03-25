variable "name" {
  description = "Name of the Log Analytics workspace."
  type        = string
}

variable "location" {
  description = "Azure region for the Log Analytics workspace."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Log Analytics workspace."
  type        = string
}

variable "sku" {
  description = "SKU of the Log Analytics workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Retention in days for the workspace."
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  description = "Optional daily quota in GB for the workspace."
  type        = number
  default     = null
}

variable "tags" {
  description = "Tags applied to the Log Analytics workspace."
  type        = map(string)
  default     = {}
}
