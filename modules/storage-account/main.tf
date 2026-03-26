resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier
  min_tls_version          = var.min_tls_version
  https_traffic_only_enabled      = var.https_traffic_only_enabled
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  public_network_access_enabled   = var.public_network_access_enabled
  shared_access_key_enabled       = var.shared_access_key_enabled
  sftp_enabled                    = var.sftp_enabled
  tags                            = var.tags

  dynamic "blob_properties" {
    for_each = var.blob_properties == null ? [] : [var.blob_properties]
    content {
      versioning_enabled       = try(blob_properties.value.versioning_enabled, null)
      change_feed_enabled      = try(blob_properties.value.change_feed_enabled, null)
      last_access_time_enabled = try(blob_properties.value.last_access_time_enabled, null)
    }
  }
}
