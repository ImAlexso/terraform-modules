variable "name" {
  description = "Name of the private DNS zone."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the private DNS zone."
  type        = string
}

variable "tags" {
  description = "Tags applied to the private DNS zone."
  type        = map(string)
  default     = {}
}
