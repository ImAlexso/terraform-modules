variable "name" {
  description = "Name of the container registry."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the container registry."
  type        = string
}

variable "location" {
  description = "Azure region for the container registry."
  type        = string
}

variable "sku" {
  description = "SKU of the container registry."
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Whether admin user is enabled for the container registry."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the container registry."
  type        = bool
  default     = false
}

variable "anonymous_pull_enabled" {
  description = "Whether anonymous pull is enabled."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to the container registry."
  type        = map(string)
  default     = {}
}
