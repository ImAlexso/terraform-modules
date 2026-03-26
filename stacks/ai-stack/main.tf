module "openai_account" {
  source = "../../modules/cognitive-account-openai"

  name                          = var.openai_account_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku_name                      = var.sku_name
  custom_subdomain_name         = var.custom_subdomain_name
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
}

module "openai_deployment" {
  source = "../../modules/cognitive-deployment"

  name                 = var.deployment_name
  cognitive_account_id = module.openai_account.id
  model_format         = var.model_format
  model_name           = var.model_name
  model_version        = var.model_version
  sku_name             = var.deployment_sku_name
  capacity             = var.deployment_capacity
  rai_policy_name      = var.rai_policy_name
}

module "openai_private_endpoint" {
  source = "../../modules/private-endpoint"

  name                            = var.private_endpoint_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  subnet_id                       = var.private_endpoints_subnet_id
  private_service_connection_name = var.private_service_connection_name
  private_connection_resource_id  = module.openai_account.id
  subresource_names               = ["account"]
  private_dns_zone_group_name     = var.private_dns_zone_group_name
  private_dns_zone_ids            = [var.openai_private_dns_zone_id]
  tags                            = var.tags
}
