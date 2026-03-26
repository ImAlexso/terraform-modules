output "resource_group_id" {
  description = "ID of the resource group used for Terraform remote state."
  value       = module.resource_group.id
}

output "resource_group_name" {
  description = "Name of the resource group used for Terraform remote state."
  value       = module.resource_group.name
}

output "storage_account_id" {
  description = "ID of the storage account used for Terraform remote state."
  value       = module.storage_account.id
}

output "storage_account_name" {
  description = "Name of the storage account used for Terraform remote state."
  value       = module.storage_account.name
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint of the storage account."
  value       = module.storage_account.primary_blob_endpoint
}

output "tfstate_container_id" {
  description = "ID of the tfstate blob container."
  value       = module.storage_container.id
}

output "tfstate_container_name" {
  description = "Name of the tfstate blob container."
  value       = module.storage_container.name
}
