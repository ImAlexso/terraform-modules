output "id" {
  description = "ID of the Linux Web App."
  value       = azurerm_linux_web_app.this.id
}

output "name" {
  description = "Name of the Linux Web App."
  value       = azurerm_linux_web_app.this.name
}

output "default_hostname" {
  description = "Default hostname of the Linux Web App."
  value       = azurerm_linux_web_app.this.default_hostname
}

output "identity" {
  description = "Managed identity block of the Linux Web App."
  value       = azurerm_linux_web_app.this.identity
}

output "principal_id" {
  description = "Principal ID of the system-assigned or user-assigned managed identity."
  value       = try(azurerm_linux_web_app.this.identity[0].principal_id, null)
}

output "tenant_id" {
  description = "Tenant ID of the managed identity."
  value       = try(azurerm_linux_web_app.this.identity[0].tenant_id, null)
}
