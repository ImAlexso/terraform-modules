module "sql_server" {
  source = "../../modules/sql-server"

  name                          = var.sql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.sql_server_version
  administrator_login           = var.administrator_login
  administrator_login_password  = var.administrator_login_password
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version
  tags                          = var.tags
}

module "sql_database" {
  source = "../../modules/sql-database"

  name           = var.sql_database_name
  server_id      = module.sql_server.id
  sku_name       = var.sql_database_sku_name
  collation      = var.sql_database_collation
  zone_redundant = var.sql_database_zone_redundant
  max_size_gb    = var.sql_database_max_size_gb
  tags           = var.tags
}

module "sql_private_endpoint" {
  source = "../../modules/private-endpoint"

  name                           = var.private_endpoint_name
  location                       = var.location
  resource_group_name            = var.resource_group_name
  subnet_id                      = var.private_endpoints_subnet_id
  private_connection_resource_id = module.sql_server.id
  subresource_names              = ["sqlServer"]
  private_dns_zone_group_name    = var.private_dns_zone_group_name
  private_dns_zone_ids           = [var.sql_private_dns_zone_id]
  tags                           = var.tags
}
