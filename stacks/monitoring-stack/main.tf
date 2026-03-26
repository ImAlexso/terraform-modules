module "log_analytics_workspace" {
  source = "../../modules/log-analytics-workspace"

  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_analytics_workspace_retention_in_days
  daily_quota_gb      = var.log_analytics_workspace_daily_quota_gb
  tags                = var.tags
}

module "application_insights" {
  source = "../../modules/application-insights"

  name                = var.application_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = module.log_analytics_workspace.id
  application_type    = var.application_type
  retention_in_days   = var.application_insights_retention_in_days
  sampling_percentage = var.application_insights_sampling_percentage
  tags                = var.tags
}
