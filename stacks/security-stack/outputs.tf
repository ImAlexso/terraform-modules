output "key_vault_id" {
  description = "ID of the Key Vault."
  value       = module.key_vault.id
}

output "key_vault_name" {
  description = "Name of the Key Vault."
  value       = module.key_vault.name
}

output "key_vault_uri" {
  description = "Vault URI of the Key Vault."
  value       = module.key_vault.vault_uri
}

output "private_endpoint_id" {
  description = "ID of the Key Vault private endpoint."
  value       = module.key_vault_private_endpoint.id
}

output "private_endpoint_name" {
  description = "Name of the Key Vault private endpoint."
  value       = module.key_vault_private_endpoint.name
}
