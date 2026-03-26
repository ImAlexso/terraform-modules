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
