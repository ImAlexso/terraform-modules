module "key_vault" {
  source = "../../modules/key-vault"

  name                            = var.key_vault_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tenant_id                       = var.tenant_id
  sku_name                        = var.sku_name
  rbac_authorization_enabled      = var.rbac_authorization_enabled
  public_network_access_enabled   = var.public_network_access_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  tags                            = var.tags
}

module "key_vault_private_endpoint" {
  source = "../../modules/private-endpoint"

  name                           = var.private_endpoint_name
  location                       = var.location
  resource_group_name            = var.resource_group_name
  subnet_id                      = var.private_endpoints_subnet_id
  private_connection_resource_id = module.key_vault.id
  subresource_names              = ["vault"]
  private_dns_zone_group_name    = var.private_dns_zone_group_name
  private_dns_zone_ids           = [var.key_vault_private_dns_zone_id]
  tags                           = var.tags
}

module "key_vault_role_assignments" {
  for_each = {
    for item in var.role_assignments : "${item.role_definition_name}-${item.principal_id}" => item
  }

  source = "../../modules/role-assignment"

  scope                = module.key_vault.id
  role_definition_name = each.value.role_definition_name
  principal_id         = each.value.principal_id
  description          = try(each.value.description, null)
  principal_type       = try(each.value.principal_type, null)
}
