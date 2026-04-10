variable "aks_name" {
  type        = string
  description = "AKS cluster name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for AKS"
}

variable "node_count" {
  type        = number
  description = "Initial node count"
  default     = 1
}

variable "vm_size" {
  type        = string
  description = "VM size for nodes"
  default     = "Standard_B2s"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for AKS (optional)"
  default     = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "oidc_issuer_enabled" {
  type    = bool
  default = false
}

variable "workload_identity_enabled" {
  type    = bool
  default = false
}

variable "key_vault_secrets_provider_enabled" {
  type        = bool
  description = "Enable Azure Key Vault Secrets Provider add-on in AKS"
  default     = false
}

variable "secret_rotation_enabled" {
  type        = bool
  description = "Enable secret rotation for AKS Key Vault Secrets Provider"
  default     = true
}

variable "secret_rotation_interval" {
  type        = string
  description = "Secret rotation interval for AKS Key Vault Secrets Provider"
  default     = "2m"
}
