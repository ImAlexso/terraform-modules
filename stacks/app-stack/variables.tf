variable "resource_group_name" {
  description = "Name of the resource group containing app resources."
  type        = string
}

variable "location" {
  description = "Azure region for app resources."
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service plan."
  type        = string
}

variable "os_type" {
  description = "Operating system type for the App Service plan."
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "SKU name of the App Service plan."
  type        = string
}

variable "per_site_scaling_enabled" {
  description = "Whether per-site scaling is enabled on the App Service plan."
  type        = bool
  default     = false
}

variable "zone_balancing_enabled" {
  description = "Whether zone balancing is enabled on the App Service plan."
  type        = bool
  default     = false
}

variable "linux_web_app_name" {
  description = "Name of the Linux Web App."
  type        = string
}

variable "https_only" {
  description = "Whether HTTPS-only access is enabled for the web app."
  type        = bool
  default     = true
}

variable "virtual_network_subnet_id" {
  description = "Optional subnet ID used for VNet integration."
  type        = string
  default     = null
}

variable "client_affinity_enabled" {
  description = "Whether client affinity is enabled on the web app."
  type        = bool
  default     = false
}

variable "enabled" {
  description = "Whether the web app is enabled."
  type        = bool
  default     = true
}

variable "identity" {
  description = "Managed identity configuration for the web app."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = {
    type = "SystemAssigned"
  }
}

variable "site_config" {
  description = "Site configuration passed to the Linux Web App module."
  type = object({
    always_on                               = optional(bool, true)
    ftps_state                              = optional(string, "Disabled")
    health_check_path                       = optional(string)
    health_check_eviction_time_in_min       = optional(number)
    http2_enabled                           = optional(bool, false)
    minimum_tls_version                     = optional(string, "1.2")
    vnet_route_all_enabled                  = optional(bool, false)
    container_registry_use_managed_identity = optional(bool, false)
    application_stack = optional(object({
      docker_image_name        = optional(string)
      docker_registry_url      = optional(string)
      docker_registry_username = optional(string)
      docker_registry_password = optional(string)
      java_server              = optional(string)
      java_server_version      = optional(string)
      java_version             = optional(string)
      node_version             = optional(string)
      python_version           = optional(string)
    }))
  })
  default = {}
}

variable "app_settings" {
  description = "Application settings for the Linux Web App."
  type        = map(string)
  default     = {}
}

variable "create_role_assignments" {
  description = "Whether to create standard RBAC assignments for the web app."
  type        = bool
  default     = true
}

variable "key_vault_id" {
  description = "Optional Key Vault ID used for Key Vault Secrets User assignment."
  type        = string
  default     = null
}

variable "storage_account_id" {
  description = "Optional Storage Account ID used for Storage Blob Data Contributor assignment."
  type        = string
  default     = null
}

variable "container_registry_id" {
  description = "Optional Container Registry ID used for AcrPull assignment."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to app resources."
  type        = map(string)
  default     = {}
}
