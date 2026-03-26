output "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace."
  value       = module.log_analytics_workspace.id
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  value       = module.log_analytics_workspace.name
}

output "application_insights_id" {
  description = "ID of the Application Insights instance."
  value       = module.application_insights.id
}

output "application_insights_name" {
  description = "Name of the Application Insights instance."
  value       = module.application_insights.name
}

output "application_insights_connection_string" {
  description = "Connection string of the Application Insights instance."
  value       = module.application_insights.connection_string
  sensitive   = true
}
