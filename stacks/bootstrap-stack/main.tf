module "resource_group" {
  source = "../../modules/resource-group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "storage_account" {
  source = "../../modules/storage-account"

  name                            = var.storage_account_name
  resource_group_name             = module.resource_group.name
  location                        = module.resource_group.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  account_kind                    = var.account_kind
  access_tier                     = var.access_tier
  min_tls_version                 = var.min_tls_version
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = var.public_network_access_enabled
  shared_access_key_enabled       = true
  sftp_enabled                    = false
  blob_properties                 = var.blob_properties
  tags                            = var.tags
}

module "storage_container" {
  source = "../../modules/storage-container"

  name                  = var.tfstate_container_name
  storage_account_id    = module.storage_account.id
  container_access_type = "private"
  metadata              = var.container_metadata
}
