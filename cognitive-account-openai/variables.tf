variable "name" {
  description = "Name of the Azure OpenAI account."
  type        = string
}

variable "location" {
  description = "Azure region for the Azure OpenAI account."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Azure OpenAI account."
  type        = string
}

variable "sku_name" {
  description = "SKU name of the Azure OpenAI account."
  type        = string
}

variable "custom_subdomain_name" {
  description = "Custom subdomain name for the Azure OpenAI account."
  type        = string
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the Azure OpenAI account."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to the Azure OpenAI account."
  type        = map(string)
  default     = {}
}
