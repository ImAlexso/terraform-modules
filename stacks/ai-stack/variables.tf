variable "resource_group_name" {
  description = "Name of the resource group containing AI resources."
  type        = string
}

variable "location" {
  description = "Azure region for AI resources."
  type        = string
}

variable "openai_account_name" {
  description = "Name of the Azure OpenAI account."
  type        = string
}

variable "custom_subdomain_name" {
  description = "Custom subdomain name for the Azure OpenAI account."
  type        = string
}

variable "sku_name" {
  description = "SKU of the Azure OpenAI account."
  type        = string
  default     = "S0"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the Azure OpenAI account."
  type        = bool
  default     = false
}

variable "deployment_name" {
  description = "Name of the Azure OpenAI deployment."
  type        = string
}

variable "model_format" {
  description = "Model format used by the deployment."
  type        = string
  default     = "OpenAI"
}

variable "model_name" {
  description = "Model name used by the deployment."
  type        = string
}

variable "model_version" {
  description = "Model version used by the deployment."
  type        = string
}

variable "deployment_sku_name" {
  description = "SKU name of the Azure OpenAI deployment."
  type        = string
  default     = "Standard"
}

variable "deployment_capacity" {
  description = "Capacity of the Azure OpenAI deployment."
  type        = number
  default     = 1
}

variable "rai_policy_name" {
  description = "Optional RAI policy name for the deployment."
  type        = string
  default     = null
}

variable "private_endpoint_name" {
  description = "Name of the Azure OpenAI private endpoint."
  type        = string
}

variable "private_endpoints_subnet_id" {
  description = "Subnet ID used for the Azure OpenAI private endpoint."
  type        = string
}

variable "openai_private_dns_zone_id" {
  description = "Private DNS zone ID used for Azure OpenAI."
  type        = string
}

variable "private_dns_zone_group_name" {
  description = "Name of the private DNS zone group for the Azure OpenAI private endpoint."
  type        = string
  default     = "pdzg-openai"
}

variable "tags" {
  description = "Tags applied to AI resources."
  type        = map(string)
  default     = {}
}

variable "private_service_connection_name" {
  description = "Name of the private service connection used by the Azure OpenAI private endpoint."
  type        = string
}
