# security-stack

Creates the reusable security foundation for the platform.

## Responsibility

This stack creates:

- Key Vault
- private endpoint for Key Vault
- DNS zone group binding for the Key Vault private endpoint
- optional generic RBAC assignments on the Key Vault

## It does not create

- project-specific secrets
- random passwords
- JWT secrets
- app-specific secret wiring

Those should stay in the root project.

## Notes

- This stack is intentionally limited to reusable security infrastructure.
- The private endpoint requires a dedicated private service connection name.
- Project-specific secret creation belongs in the consumer root module.

## Example

module "security" {
source = "../../stacks/security-stack"

resource_group_name = "rg-incidencias-dev-we"
location = "westeurope"
tenant_id = "00000000-0000-0000-0000-000000000000"
key_vault_name = "kvdevalexwe"
private_endpoint_name = "pe-kv-incidencias-dev-we"
private_service_connection_name = "psc-kv-incidencias-dev-we"
private_endpoints_subnet_id = module.network.private_endpoints_subnet_id
key_vault_private_dns_zone_id = module.network.private_dns_zone_ids.key_vault

role_assignments = [
{
role_definition_name = "Key Vault Secrets Officer"
principal_id = "11111111-1111-1111-1111-111111111111"
}
]

tags = {
environment = "dev"
project = "incidencias"
managed_by = "terraform"
}
}
