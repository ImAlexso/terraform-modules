resource "azurerm_cognitive_account" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "OpenAI"
  sku_name            = var.sku_name
  custom_subdomain_name        = var.custom_subdomain_name
  public_network_access_enabled = var.public_network_access_enabled
  tags                         = var.tags
}
