variable "name" {
  description = "Name of the virtual network."
  type        = string
}

variable "location" {
  description = "Azure region for the virtual network."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the virtual network."
  type        = string
}

variable "address_space" {
  description = "Address spaces assigned to the virtual network."
  type        = list(string)
}

variable "dns_servers" {
  description = "Optional custom DNS servers for the virtual network."
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "Tags applied to the virtual network."
  type        = map(string)
  default     = {}
}
