output "sql_server_id" {
  description = "ID of the SQL server."
  value       = module.sql_server.id
}

output "sql_server_name" {
  description = "Name of the SQL server."
  value       = module.sql_server.name
}

output "sql_fully_qualified_domain_name" {
  description = "Fully qualified domain name of the SQL server."
  value       = module.sql_server.fully_qualified_domain_name
}

output "sql_database_id" {
  description = "ID of the SQL database."
  value       = module.sql_database.id
}

output "sql_database_name" {
  description = "Name of the SQL database."
  value       = module.sql_database.name
}

output "private_endpoint_id" {
  description = "ID of the SQL private endpoint."
  value       = module.sql_private_endpoint.id
}

output "private_endpoint_name" {
  description = "Name of the SQL private endpoint."
  value       = module.sql_private_endpoint.name
}
