output "virtual_network_id" {
  description = "ID of the virtual network."
  value       = module.vnet.id
}

output "virtual_network_name" {
  description = "Name of the virtual network."
  value       = module.vnet.name
}

output "app_integration_subnet_id" {
  description = "ID of the App Service integration subnet."
  value       = module.subnet_app_integration.id
}

output "app_integration_subnet_name" {
  description = "Name of the App Service integration subnet."
  value       = module.subnet_app_integration.name
}

output "private_endpoints_subnet_id" {
  description = "ID of the private endpoints subnet."
  value       = module.subnet_private_endpoints.id
}

output "private_endpoints_subnet_name" {
  description = "Name of the private endpoints subnet."
  value       = module.subnet_private_endpoints.name
}

output "private_dns_zone_ids" {
  description = "IDs of the private DNS zones."
  value = {
    sql       = module.dns_sql.id
    blob      = module.dns_blob.id
    key_vault = module.dns_key_vault.id
    acr       = module.dns_acr.id
    openai    = module.dns_openai.id
  }
}

output "private_dns_zone_names" {
  description = "Names of the private DNS zones."
  value = {
    sql       = module.dns_sql.name
    blob      = module.dns_blob.name
    key_vault = module.dns_key_vault.name
    acr       = module.dns_acr.name
    openai    = module.dns_openai.name
  }
}
