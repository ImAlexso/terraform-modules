variable "resource_group_name" {
  description = "Name of the resource group containing monitoring resources."
  type        = string
}

variable "location" {
  description = "Azure region for monitoring resources."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  type        = string
}

variable "log_analytics_workspace_sku" {
  description = "SKU of the Log Analytics workspace."
  type        = string
  default     = "PerGB2018"
}

variable "log_analytics_workspace_retention_in_days" {
  description = "Retention period in days for the Log Analytics workspace."
  type        = number
  default     = 30
}

variable "log_analytics_workspace_daily_quota_gb" {
  description = "Optional daily quota in GB for the Log Analytics workspace."
  type        = number
  default     = null
}

variable "application_insights_name" {
  description = "Name of the Application Insights instance."
  type        = string
}

variable "application_type" {
  description = "Application type for Application Insights."
  type        = string
  default     = "web"
}

variable "application_insights_retention_in_days" {
  description = "Retention period in days for Application Insights."
  type        = number
  default     = 90
}

variable "application_insights_sampling_percentage" {
  description = "Optional sampling percentage for Application Insights."
  type        = number
  default     = null
}

variable "tags" {
  description = "Tags applied to monitoring resources."
  type        = map(string)
  default     = {}
}
