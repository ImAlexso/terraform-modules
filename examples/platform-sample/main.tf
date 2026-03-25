terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "rg" {
  source   = "../../resource-group"
  name     = "rg-example-dev-we"
  location = "westeurope"
  tags = {
    environment = "dev"
    project     = "example"
  }
}

module "vnet" {
  source              = "../../virtual-network"
  name                = "vnet-example-dev-we"
  location            = module.rg.location
  resource_group_name = module.rg.name
  address_space       = ["10.10.0.0/16"]
}

module "app_subnet" {
  source               = "../../subnet"
  name                 = "snet-app"
  resource_group_name  = module.rg.name
  virtual_network_name = module.vnet.name
  address_prefixes     = ["10.10.1.0/24"]
  delegations = [
    {
      name = "appservice-delegation"
      service_delegation = {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    }
  ]
}

module "pe_subnet" {
  source               = "../../subnet"
  name                 = "snet-private-endpoints"
  resource_group_name  = module.rg.name
  virtual_network_name = module.vnet.name
  address_prefixes     = ["10.10.2.0/24"]
  private_endpoint_network_policies = "Disabled"
}

module "sql_dns" {
  source              = "../../private-dns-zone"
  name                = "privatelink.database.windows.net"
  resource_group_name = module.rg.name
}

module "sql_dns_link" {
  source                = "../../private-dns-zone-link"
  name                  = "link-sql-example"
  resource_group_name   = module.rg.name
  private_dns_zone_name = module.sql_dns.name
  virtual_network_id    = module.vnet.id
}

module "sql_server" {
  source                         = "../../sql-server"
  name                           = "sql-example-dev-we"
  resource_group_name            = module.rg.name
  location                       = module.rg.location
  administrator_login            = "sqladminuser"
  administrator_login_password   = "ChangeMe123!"
  public_network_access_enabled  = false
}

module "sql_database" {
  source    = "../../sql-database"
  name      = "sqldb-example-dev-we"
  server_id = module.sql_server.id
  sku_name  = "Basic"
}

module "sql_private_endpoint" {
  source                         = "../../private-endpoint"
  name                           = "pe-sql-example-dev-we"
  location                       = module.rg.location
  resource_group_name            = module.rg.name
  subnet_id                      = module.pe_subnet.id
  private_service_connection_name = "psc-sql"
  private_connection_resource_id = module.sql_server.id
  subresource_names              = ["sqlServer"]
  private_dns_zone_group_name    = "pdzg-sql"
  private_dns_zone_ids           = [module.sql_dns.id]
}
