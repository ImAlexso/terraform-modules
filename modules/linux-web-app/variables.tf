variable "name" {
  description = "Name of the Linux Web App."
  type        = string
}

variable "location" {
  description = "Azure region for the Linux Web App."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Linux Web App."
  type        = string
}

variable "service_plan_id" {
  description = "ID of the App Service plan used by the web app."
  type        = string
}

variable "https_only" {
  description = "Whether HTTPS-only access is enabled."
  type        = bool
  default     = true
}

variable "virtual_network_subnet_id" {
  description = "Optional subnet ID used for VNet integration."
  type        = string
  default     = null
}

variable "client_affinity_enabled" {
  description = "Whether client affinity is enabled."
  type        = bool
  default     = false
}

variable "enabled" {
  description = "Whether the web app is enabled."
  type        = bool
  default     = true
}

variable "identity" {
  description = "Optional managed identity configuration."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = {
    type = "SystemAssigned"
  }
}

variable "site_config" {
  description = "Site configuration for the Linux Web App."
  type = object({
    always_on              = optional(bool, true)
    ftps_state             = optional(string, "Disabled")
    health_check_path      = optional(string)
    vnet_route_all_enabled = optional(bool, false)
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
  description = "Application settings applied to the web app."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags applied to the Linux Web App."
  type        = map(string)
  default     = {}
}
