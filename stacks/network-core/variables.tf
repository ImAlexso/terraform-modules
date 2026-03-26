variable "resource_group_name" {
  description = "Name of the resource group containing the network resources."
  type        = string
}

variable "location" {
  description = "Azure region for the network resources."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space assigned to the virtual network."
  type        = list(string)
}

variable "dns_servers" {
  description = "Optional custom DNS servers for the virtual network."
  type        = list(string)
  default     = null
}

variable "app_integration_subnet_name" {
  description = "Name of the App Service integration subnet."
  type        = string
}

variable "app_integration_subnet_cidr" {
  description = "CIDR block for the App Service integration subnet."
  type        = string
}

variable "app_integration_service_endpoints" {
  description = "Optional service endpoints for the App Service integration subnet."
  type        = list(string)
  default     = []
}

variable "private_endpoints_subnet_name" {
  description = "Name of the private endpoints subnet."
  type        = string
}

variable "private_endpoints_subnet_cidr" {
  description = "CIDR block for the private endpoints subnet."
  type        = string
}

variable "private_endpoints_service_endpoints" {
  description = "Optional service endpoints for the private endpoints subnet."
  type        = list(string)
  default     = []
}

variable "private_dns_zone_names" {
  description = "Private DNS zone names used by the platform."
  type = object({
    sql       = string
    blob      = string
    key_vault = string
    acr       = string
    openai    = string
  })
  default = {
    sql       = "privatelink.database.windows.net"
    blob      = "privatelink.blob.core.windows.net"
    key_vault = "privatelink.vaultcore.azure.net"
    acr       = "privatelink.azurecr.io"
    openai    = "privatelink.openai.azure.com"
  }
}

variable "private_dns_zone_link_names" {
  description = "Names of the private DNS zone virtual network links."
  type = object({
    sql       = string
    blob      = string
    key_vault = string
    acr       = string
    openai    = string
  })
}

variable "tags" {
  description = "Tags applied to network resources."
  type        = map(string)
  default     = {}
}
