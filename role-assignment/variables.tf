variable "scope" {
  description = "Scope of the role assignment."
  type        = string
}

variable "role_definition_name" {
  description = "Built-in role definition name assigned to the principal."
  type        = string
}

variable "principal_id" {
  description = "Object ID of the principal receiving the role assignment."
  type        = string
}

variable "description" {
  description = "Optional description for the role assignment."
  type        = string
  default     = null
}

variable "principal_type" {
  description = "Optional principal type for the role assignment."
  type        = string
  default     = null
}
