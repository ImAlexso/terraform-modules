output "app_service_plan_id" {
  description = "ID of the App Service plan."
  value       = module.app_service_plan.id
}

output "app_service_plan_name" {
  description = "Name of the App Service plan."
  value       = module.app_service_plan.name
}

output "linux_web_app_id" {
  description = "ID of the Linux Web App."
  value       = module.linux_web_app.id
}

output "linux_web_app_name" {
  description = "Name of the Linux Web App."
  value       = module.linux_web_app.name
}

output "default_hostname" {
  description = "Default hostname of the Linux Web App."
  value       = module.linux_web_app.default_hostname
}

output "principal_id" {
  description = "Principal ID of the web app managed identity."
  value       = module.linux_web_app.principal_id
}

output "tenant_id" {
  description = "Tenant ID of the web app managed identity."
  value       = module.linux_web_app.tenant_id
}
