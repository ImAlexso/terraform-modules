# ai-stack

Creates the reusable Azure OpenAI layer.

## Responsibility

This stack creates:

- Azure OpenAI account
- Azure OpenAI deployment
- private endpoint for Azure OpenAI
- DNS zone group binding for the Azure OpenAI private endpoint

## It does not create

- Key Vault secrets for API keys
- app-specific AI settings
- backend feature flags

Those should be handled by the consumer root module.

## Notes

- This stack requires the private DNS zone for Azure OpenAI to already exist.
- The private endpoint requires a dedicated private service connection name.
- Project-specific secret storage should remain outside this stack.

## Example

module "ai" {
source = "../../stacks/ai-stack"

resource_group_name = "rg-incidencias-dev-we"
location = "swedencentral"
openai_account_name = "oai-incidencias-dev-we-alex"
custom_subdomain_name = "oai-incidencias-dev-we-alex"
deployment_name = "incident-classifier"
model_name = "gpt-4.1-mini"
model_version = "2025-04-14"
private_endpoint_name = "pe-openai-incidencias-dev-we"
private_service_connection_name = "psc-openai-incidencias-dev-we"
private_endpoints_subnet_id = module.network.private_endpoints_subnet_id
openai_private_dns_zone_id = module.network.private_dns_zone_ids.openai

tags = {
environment = "dev"
project = "incidencias"
managed_by = "terraform"
}
}
