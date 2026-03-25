output "id" {
  description = "ID of Application Insights."
  value       = azurerm_application_insights.this.id
}

output "name" {
  description = "Name of Application Insights."
  value       = azurerm_application_insights.this.name
}

output "connection_string" {
  description = "Connection string of Application Insights."
  value       = azurerm_application_insights.this.connection_string
  sensitive   = true
}
