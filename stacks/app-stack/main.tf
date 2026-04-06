module "app_service_plan" {
  source = "../../modules/app-service-plan"

  name                     = var.app_service_plan_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  os_type                  = var.os_type
  sku_name                 = var.sku_name
  per_site_scaling_enabled = var.per_site_scaling_enabled
  zone_balancing_enabled   = var.zone_balancing_enabled
  tags                     = var.tags
}

module "linux_web_app" {
  source = "../../modules/linux-web-app"

  name                      = var.linux_web_app_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  service_plan_id           = module.app_service_plan.id
  https_only                = var.https_only
  virtual_network_subnet_id = var.virtual_network_subnet_id
  client_affinity_enabled   = var.client_affinity_enabled
  enabled                   = var.enabled
  identity                  = var.identity
  site_config               = var.site_config
  app_settings              = var.app_settings
  tags                      = var.tags
}

module "webapp_key_vault_secrets_user" {
  count  = var.create_role_assignments ? 1 : 0
  source = "../../modules/role-assignment"

  scope                = var.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.linux_web_app.principal_id
}

module "webapp_storage_blob_data_contributor" {
  count  = var.create_role_assignments ? 1 : 0
  source = "../../modules/role-assignment"

  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.linux_web_app.principal_id
}

module "webapp_acr_pull" {
  count  = var.create_role_assignments ? 1 : 0
  source = "../../modules/role-assignment"

  scope                = var.container_registry_id
  role_definition_name = "AcrPull"
  principal_id         = module.linux_web_app.principal_id
}