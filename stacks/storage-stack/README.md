# storage-stack

Creates the reusable storage layer.

## Responsibility

This stack creates:

- storage account
- blob container
- private endpoint for Blob
- DNS zone group binding for the Blob private endpoint

## It does not create

- app-specific RBAC assignments
- project-specific secrets
- lifecycle management rules
- immutability policies

Those can be added later in the consumer project if needed.

## Example

```hcl
module "storage" {
  source = "../../stacks/storage-stack"

  resource_group_name          = "rg-incidencias-dev-we"
  location                     = "westeurope"
  storage_account_name         = "stdevalexwe01"
  container_name               = "attachments"
  private_endpoint_name        = "pe-blob-incidencias-dev-we"
  private_endpoints_subnet_id  = module.network.private_endpoints_subnet_id
  blob_private_dns_zone_id     = module.network.private_dns_zone_ids.blob

  tags = {
    environment = "dev"
    project     = "incidencias"
    managed_by  = "terraform"
  }
}
```
