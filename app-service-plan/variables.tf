variable "name" {
  description = "Name of the App Service plan."
  type        = string
}

variable "location" {
  description = "Azure region for the App Service plan."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the App Service plan."
  type        = string
}

variable "os_type" {
  description = "Operating system type for the plan."
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "SKU name of the App Service plan."
  type        = string
}

variable "per_site_scaling_enabled" {
  description = "Whether per-site scaling is enabled."
  type        = bool
  default     = false
}

variable "zone_balancing_enabled" {
  description = "Whether zone balancing is enabled."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to the App Service plan."
  type        = map(string)
  default     = {}
}
