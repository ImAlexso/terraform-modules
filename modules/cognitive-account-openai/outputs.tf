output "id" {
  description = "ID of the Azure OpenAI account."
  value       = azurerm_cognitive_account.this.id
}

output "name" {
  description = "Name of the Azure OpenAI account."
  value       = azurerm_cognitive_account.this.name
}

output "endpoint" {
  description = "Endpoint of the Azure OpenAI account."
  value       = azurerm_cognitive_account.this.endpoint
}

output "primary_access_key" {
  description = "Primary access key of the Azure OpenAI account."
  value       = azurerm_cognitive_account.this.primary_access_key
  sensitive   = true
}
