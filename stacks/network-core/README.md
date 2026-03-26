# network-core

Creates the core networking layer for the platform.

## Responsibility

This stack creates:

- virtual network
- subnet for App Service integration
- subnet for private endpoints
- private DNS zones for SQL, Blob, Key Vault, ACR and Azure OpenAI
- private DNS zone links to the virtual network

## It does not create

- private endpoints themselves
- SQL, Storage, Key Vault, ACR or OpenAI resources
- NSGs, route tables or firewall rules

Those should be composed in other stacks.

## Notes

- The App Service integration subnet is delegated to `Microsoft.Web/serverFarms`.
- The private endpoints subnet disables private endpoint network policies.
- DNS zones are created here so downstream stacks can attach zone groups consistently.

## Example

```hcl
module "network" {
  source = "../../stacks/network-core"

  resource_group_name             = "rg-incidencias-dev-we"
  location                        = "westeurope"
  virtual_network_name            = "vnet-incidencias-dev-we"
  virtual_network_address_space   = ["10.20.0.0/16"]
  app_integration_subnet_name     = "snet-app-int"
  app_integration_subnet_cidr     = "10.20.1.0/24"
  private_endpoints_subnet_name   = "snet-private-endpoints"
  private_endpoints_subnet_cidr   = "10.20.2.0/24"

  private_dns_zone_link_names = {
    sql       = "link-sql-incidencias-dev-we"
    blob      = "link-blob-incidencias-dev-we"
    key_vault = "link-kv-incidencias-dev-we"
    acr       = "link-acr-incidencias-dev-we"
    openai    = "link-openai-incidencias-dev-we"
  }

  tags = {
    environment = "dev"
    project     = "incidencias"
    managed_by  = "terraform"
  }
}
```
