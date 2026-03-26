data "azurerm_client_config" "current" {}

locals {
  name_base = "sample-dev-we"

  tags = {
    environment = "dev"
    project     = "platform-sample"
    managed_by  = "terraform"
  }
}

module "resource_group" {
  source = "../../modules/resource-group"

  name     = "rg-${local.name_base}"
  location = "westeurope"
  tags     = local.tags
}

module "virtual_network" {
  source = "../../modules/virtual-network"

  name                = "vnet-${local.name_base}"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space       = ["10.50.0.0/16"]
  tags                = local.tags
}

module "subnet_app" {
  source = "../../modules/subnet"

  name                 = "snet-app-int"
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = ["10.50.1.0/24"]

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

  name                              = "snet-private-endpoints"
  resource_group_name               = module.resource_group.name
  virtual_network_name              = module.virtual_network.name
  address_prefixes                  = ["10.50.2.0/24"]
  private_endpoint_network_policies = "Disabled"
}

module "private_dns_zone_sql" {
  source = "../../modules/private-dns-zone"

  name                = "privatelink.database.windows.net"
  resource_group_name = module.resource_group.name
  tags                = local.tags
}

module "private_dns_zone_link_sql" {
  source = "../../modules/private-dns-zone-link"

  name                  = "link-sql-${local.name_base}"
  resource_group_name   = module.resource_group.name
  private_dns_zone_name = module.private_dns_zone_sql.name
  virtual_network_id    = module.virtual_network.id
  registration_enabled  = false
  tags                  = local.tags
}

module "sql_server" {
  source = "../../modules/sql-server"

  name                          = "sqlsampledevwealex"
  resource_group_name           = module.resource_group.name
  location                      = module.resource_group.location
  administrator_login           = "sqladmin"
  administrator_login_password  = "ChangeMe123!ChangeMe123!"
  public_network_access_enabled = true
  tags                          = local.tags
}

module "sql_database" {
  source = "../../modules/sql-database"

  name      = "sqldb-sample-dev"
  server_id = module.sql_server.id
  sku_name  = "Basic"
  tags      = local.tags
}

module "sql_private_endpoint" {
  source = "../../modules/private-endpoint"

  name                            = "pe-sql-${local.name_base}"
  location                        = module.resource_group.location
  resource_group_name             = module.resource_group.name
  subnet_id                       = module.subnet_private_endpoints.id
  private_service_connection_name = "psc-sql-${local.name_base}"
  private_connection_resource_id  = module.sql_server.id
  subresource_names               = ["sqlServer"]
  private_dns_zone_group_name     = "pdzg-sql"
  private_dns_zone_ids            = [module.private_dns_zone_sql.id]
  tags                            = local.tags
}
