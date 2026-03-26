# data-stack

Creates the reusable SQL data layer.

## Responsibility

This stack creates:

- Azure SQL Server
- Azure SQL Database
- private endpoint for SQL Server
- DNS zone group binding for the SQL private endpoint

## It does not create

- passwords in Key Vault
- JDBC connection strings
- app-specific settings

Those should be handled in the consumer root module.

## Notes

- This stack requires the private DNS zone for SQL to already exist.
- The private endpoint requires a dedicated private service connection name.
- Password generation and secret storage should remain outside this stack.

## Example

module "data" {
source = "../../stacks/data-stack"

resource_group_name = "rg-incidencias-dev-we"
location = "westeurope"
sql_server_name = "sql-incidencias-dev-we-alex"
administrator_login = "sqladmin"
administrator_login_password = random_password.sql_password.result
sql_database_name = "sqldb-incidencias-dev"
sql_database_sku_name = "Basic"
private_endpoint_name = "pe-sql-incidencias-dev-we"
private_service_connection_name = "psc-sql-incidencias-dev-we"
private_endpoints_subnet_id = module.network.private_endpoints_subnet_id
sql_private_dns_zone_id = module.network.private_dns_zone_ids.sql

tags = {
environment = "dev"
project = "incidencias"
managed_by = "terraform"
}
}
