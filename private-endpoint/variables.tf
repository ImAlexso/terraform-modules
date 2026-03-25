variable "name" {
  description = "Name of the private endpoint."
  type        = string
}

variable "location" {
  description = "Azure region for the private endpoint."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the private endpoint."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet used by the private endpoint."
  type        = string
}

variable "custom_network_interface_name" {
  description = "Optional custom name for the network interface created by the private endpoint."
  type        = string
  default     = null
}

variable "private_service_connection_name" {
  description = "Name of the private service connection block."
  type        = string
}

variable "private_connection_resource_id" {
  description = "ID of the private link-enabled resource."
  type        = string
}

variable "is_manual_connection" {
  description = "Whether the private service connection is manual."
  type        = bool
  default     = false
}

variable "subresource_names" {
  description = "Subresource names used by the private service connection."
  type        = list(string)
}

variable "request_message" {
  description = "Optional request message for manual approval workflows."
  type        = string
  default     = null
}

variable "private_dns_zone_group_name" {
  description = "Optional name of the private DNS zone group."
  type        = string
  default     = null
}

variable "private_dns_zone_ids" {
  description = "Optional private DNS zone IDs associated with the private endpoint."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags applied to the private endpoint."
  type        = map(string)
  default     = {}
}
