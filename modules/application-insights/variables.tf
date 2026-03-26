variable "name" {
  description = "Name of Application Insights."
  type        = string
}

variable "location" {
  description = "Azure region for Application Insights."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing Application Insights."
  type        = string
}

variable "workspace_id" {
  description = "ID of the Log Analytics workspace linked to Application Insights."
  type        = string
}

variable "application_type" {
  description = "Application type for Application Insights."
  type        = string
  default     = "web"
}

variable "retention_in_days" {
  description = "Retention in days for Application Insights."
  type        = number
  default     = 90
}

variable "sampling_percentage" {
  description = "Sampling percentage for telemetry collection."
  type        = number
  default     = null
}

variable "tags" {
  description = "Tags applied to Application Insights."
  type        = map(string)
  default     = {}
}
