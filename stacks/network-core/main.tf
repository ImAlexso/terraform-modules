module "vnet" {
  source = "../../modules/virtual-network"

  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network_address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}

module "subnet_app_integration" {
  source = "../../modules/subnet"

  name                 = var.app_integration_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = module.vnet.name
  address_prefixes     = [var.app_integration_subnet_cidr]
  service_endpoints    = var.app_integration_service_endpoints

  delegations = [
    {
      name = "appservice-delegation"
      service_delegation = {
        name = "Microsoft.Web/serverFarms"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/action"
        ]
      }
    }
  ]
}

module "subnet_private_endpoints" {
  source = "../../modules/subnet"

  name                              = var.private_endpoints_subnet_name
  resource_group_name               = var.resource_group_name
  virtual_network_name              = module.vnet.name
  address_prefixes                  = [var.private_endpoints_subnet_cidr]
  service_endpoints                 = var.private_endpoints_service_endpoints
  private_endpoint_network_policies = "Disabled"
}

module "dns_sql" {
  source = "../../modules/private-dns-zone"

  name                = var.private_dns_zone_names.sql
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

module "dns_blob" {
  source = "../../modules/private-dns-zone"

  name                = var.private_dns_zone_names.blob
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

module "dns_key_vault" {
  source = "../../modules/private-dns-zone"

  name                = var.private_dns_zone_names.key_vault
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

module "dns_acr" {
  source = "../../modules/private-dns-zone"

  name                = var.private_dns_zone_names.acr
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

module "dns_openai" {
  source = "../../modules/private-dns-zone"

  name                = var.private_dns_zone_names.openai
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

module "dns_link_sql" {
  source = "../../modules/private-dns-zone-link"

  name                  = var.private_dns_zone_link_names.sql
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = module.dns_sql.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false
  tags                  = var.tags
}

module "dns_link_blob" {
  source = "../../modules/private-dns-zone-link"

  name                  = var.private_dns_zone_link_names.blob
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = module.dns_blob.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false
  tags                  = var.tags
}

module "dns_link_key_vault" {
  source = "../../modules/private-dns-zone-link"

  name                  = var.private_dns_zone_link_names.key_vault
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = module.dns_key_vault.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false
  tags                  = var.tags
}

module "dns_link_acr" {
  source = "../../modules/private-dns-zone-link"

  name                  = var.private_dns_zone_link_names.acr
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = module.dns_acr.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false
  tags                  = var.tags
}

module "dns_link_openai" {
  source = "../../modules/private-dns-zone-link"

  name                  = var.private_dns_zone_link_names.openai
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = module.dns_openai.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false
  tags                  = var.tags
}
