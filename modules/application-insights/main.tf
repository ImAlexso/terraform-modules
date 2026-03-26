resource "azurerm_application_insights" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = var.workspace_id
  application_type    = var.application_type
  retention_in_days   = var.retention_in_days
  sampling_percentage = var.sampling_percentage
  tags                = var.tags
}
