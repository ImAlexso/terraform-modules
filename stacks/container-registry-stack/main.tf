module "container_registry" {
  source = "../../modules/container-registry"

  name                          = var.container_registry_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  tags                          = var.tags
}

module "container_registry_private_endpoint" {
  source = "../../modules/private-endpoint"

  name                            = var.private_endpoint_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  subnet_id                       = var.private_endpoints_subnet_id
  private_service_connection_name = var.private_service_connection_name
  private_connection_resource_id  = module.container_registry.id
  subresource_names               = ["registry"]
  private_dns_zone_group_name     = var.private_dns_zone_group_name
  private_dns_zone_ids            = [var.acr_private_dns_zone_id]
  tags                            = var.tags
}
