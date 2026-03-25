output "id" {
  description = "ID of the SQL database."
  value       = azurerm_mssql_database.this.id
}

output "name" {
  description = "Name of the SQL database."
  value       = azurerm_mssql_database.this.name
}
