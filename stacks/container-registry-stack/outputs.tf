output "container_registry_id" {
  description = "ID of the container registry."
  value       = module.container_registry.id
}

output "container_registry_name" {
  description = "Name of the container registry."
  value       = module.container_registry.name
}

output "login_server" {
  description = "Login server of the container registry."
  value       = module.container_registry.login_server
}

output "private_endpoint_id" {
  description = "ID of the ACR private endpoint."
  value       = var.enable_private_endpoint ? module.container_registry_private_endpoint[0].id : null
}

output "private_endpoint_name" {
  description = "Name of the ACR private endpoint."
  value       = var.enable_private_endpoint ? module.container_registry_private_endpoint[0].name : null
}