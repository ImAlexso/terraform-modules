output "openai_account_id" {
  description = "ID of the Azure OpenAI account."
  value       = module.openai_account.id
}

output "openai_account_name" {
  description = "Name of the Azure OpenAI account."
  value       = module.openai_account.name
}

output "openai_endpoint" {
  description = "Endpoint of the Azure OpenAI account."
  value       = module.openai_account.endpoint
}

output "openai_primary_access_key" {
  description = "Primary access key of the Azure OpenAI account."
  value       = module.openai_account.primary_access_key
  sensitive   = true
}

output "deployment_id" {
  description = "ID of the Azure OpenAI deployment."
  value       = module.openai_deployment.id
}

output "deployment_name" {
  description = "Name of the Azure OpenAI deployment."
  value       = module.openai_deployment.name
}

output "private_endpoint_id" {
  description = "ID of the Azure OpenAI private endpoint."
  value       = module.openai_private_endpoint.id
}

output "private_endpoint_name" {
  description = "Name of the Azure OpenAI private endpoint."
  value       = module.openai_private_endpoint.name
}
