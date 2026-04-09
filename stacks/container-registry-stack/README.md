# container-registry-stack

Creates the reusable container registry layer.

## Responsibility

This stack creates:

- Azure Container Registry
- optional private endpoint for ACR
- optional DNS zone group binding for the ACR private endpoint

## It does not create

- app RBAC assignments
- image builds
- image pushes
- app deployment wiring

Those should be handled outside this stack.

## Notes

- Private endpoint creation is optional and should only be enabled when using a Premium SKU.
- If `enable_private_endpoint = false`, the stack only creates the registry.
- The private DNS zone for ACR must already exist when private endpoint is enabled.
- Keep application-specific integration logic in the consumer root module.

## Example

module "acr" {
source = "../../stacks/container-registry-stack"

resource_group_name = "rg-incidencias-dev-we"
location = "westeurope"
container_registry_name = "acrdevalexwe01"
sku = "Basic"
public_network_access_enabled = true
enable_private_endpoint = false

private_endpoint_name = "pe-acr-incidencias-dev-we"
private_service_connection_name = "psc-acr-incidencias-dev-we"
private_endpoints_subnet_id = module.network.private_endpoints_subnet_id
acr_private_dns_zone_id = module.network.private_dns_zone_ids.acr

tags = {
environment = "dev"
project = "incidencias"
managed_by = "terraform"
}
}
