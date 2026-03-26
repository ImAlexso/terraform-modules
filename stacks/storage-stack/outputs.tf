output "storage_account_id" {
  description = "ID of the storage account."
  value       = module.storage_account.id
}

output "storage_account_name" {
  description = "Name of the storage account."
  value       = module.storage_account.name
}

output "storage_container_id" {
  description = "ID of the storage container."
  value       = module.storage_container.id
}

output "storage_container_name" {
  description = "Name of the storage container."
  value       = module.storage_container.name
}

output "storage_container_resource_manager_id" {
  description = "Azure Resource Manager ID of the storage container."
  value       = module.storage_container.resource_manager_id
}

output "private_endpoint_id" {
  description = "ID of the Blob private endpoint."
  value       = module.blob_private_endpoint.id
}

output "private_endpoint_name" {
  description = "Name of the Blob private endpoint."
  value       = module.blob_private_endpoint.name
}
