module "storage_account" {
  source = "../../modules/storage-account"

  name                            = var.storage_account_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  account_kind                    = var.account_kind
  access_tier                     = var.access_tier
  min_tls_version                 = var.min_tls_version
  https_traffic_only_enabled      = var.https_traffic_only_enabled
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  public_network_access_enabled   = var.public_network_access_enabled
  shared_access_key_enabled       = var.shared_access_key_enabled
  sftp_enabled                    = var.sftp_enabled
  blob_properties                 = var.blob_properties
  tags                            = var.tags
}

module "storage_container" {
  source = "../../modules/storage-container"

  name                  = var.container_name
  storage_account_id    = module.storage_account.id
  container_access_type = var.container_access_type
  metadata              = var.container_metadata
}

module "blob_private_endpoint" {
  source = "../../modules/private-endpoint"

  name                            = var.private_endpoint_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  subnet_id                       = var.private_endpoints_subnet_id
  private_service_connection_name = var.private_service_connection_name
  private_connection_resource_id  = module.storage_account.id
  subresource_names               = ["blob"]
  private_dns_zone_group_name     = var.private_dns_zone_group_name
  private_dns_zone_ids            = [var.blob_private_dns_zone_id]
  tags                            = var.tags
}
