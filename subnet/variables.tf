variable "name" {
  description = "Name of the subnet."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the subnet."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the parent virtual network."
  type        = string
}

variable "address_prefixes" {
  description = "CIDR ranges assigned to the subnet."
  type        = list(string)
}

variable "service_endpoints" {
  description = "Optional service endpoints enabled on the subnet."
  type        = list(string)
  default     = []
}

variable "default_outbound_access_enabled" {
  description = "Whether default outbound access is enabled for the subnet."
  type        = bool
  default     = null
}

variable "private_endpoint_network_policies" {
  description = "Value for private endpoint network policies."
  type        = string
  default     = null
}

variable "private_link_service_network_policies_enabled" {
  description = "Whether private link service network policies are enabled."
  type        = bool
  default     = null
}

variable "delegations" {
  description = "Optional subnet delegations."
  type = list(object({
    name = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })
  }))
  default = []
}
