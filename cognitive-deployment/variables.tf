variable "name" {
  description = "Name of the cognitive deployment."
  type        = string
}

variable "cognitive_account_id" {
  description = "ID of the cognitive account hosting the deployment."
  type        = string
}

variable "model_format" {
  description = "Format of the deployed model."
  type        = string
  default     = "OpenAI"
}

variable "model_name" {
  description = "Name of the deployed model."
  type        = string
}

variable "model_version" {
  description = "Version of the deployed model."
  type        = string
}

variable "sku_name" {
  description = "SKU name used by the deployment."
  type        = string
  default     = "Standard"
}

variable "capacity" {
  description = "Optional capacity for the deployment SKU."
  type        = number
  default     = 1
}

variable "rai_policy_name" {
  description = "Optional RAI policy name assigned to the deployment."
  type        = string
  default     = null
}
