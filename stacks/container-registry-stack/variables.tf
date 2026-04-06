variable "resource_group_name" {
  description = "Name of the resource group containing container registry resources."
  type        = string
}

variable "location" {
  description = "Azure region for container registry resources."
  type        = string
}

variable "container_registry_name" {
  description = "Name of the container registry."
  type        = string
}

variable "sku" {
  description = "SKU of the container registry."
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Whether admin access is enabled for the container registry."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the container registry."
  type        = bool
  default     = false
}

variable "anonymous_pull_enabled" {
  description = "Whether anonymous pull is enabled for the container registry."
  type        = bool
  default     = false
}

variable "private_endpoint_name" {
  description = "Name of the private endpoint for the container registry."
  type        = string
}

variable "private_endpoints_subnet_id" {
  description = "Subnet ID used for the container registry private endpoint."
  type        = string
}

variable "acr_private_dns_zone_id" {
  description = "Private DNS zone ID used for ACR."
  type        = string
}

variable "private_dns_zone_group_name" {
  description = "Name of the private DNS zone group for the ACR private endpoint."
  type        = string
  default     = "pdzg-acr"
}

variable "tags" {
  description = "Tags applied to container registry resources."
  type        = map(string)
  default     = {}
}

variable "private_service_connection_name" {
  description = "Name of the private service connection used by the ACR private endpoint."
  type        = string
}

variable "enable_private_endpoint" {
  description = "Whether to create a private endpoint for the container registry."
  type        = bool
  default     = false
}