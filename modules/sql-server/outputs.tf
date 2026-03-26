output "id" {
  description = "ID of the SQL server."
  value       = azurerm_mssql_server.this.id
}

output "name" {
  description = "Name of the SQL server."
  value       = azurerm_mssql_server.this.name
}

output "fully_qualified_domain_name" {
  description = "Fully qualified domain name of the SQL server."
  value       = azurerm_mssql_server.this.fully_qualified_domain_name
}
