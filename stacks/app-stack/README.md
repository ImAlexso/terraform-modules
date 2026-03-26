# app-stack

Creates the reusable application hosting layer.

## Responsibility

This stack creates:

- App Service plan
- Linux Web App
- optional standard RBAC assignments for the web app:
  - Key Vault Secrets User
  - Storage Blob Data Contributor
  - AcrPull

## It does not create

- project-specific secrets
- datasource URLs
- application-specific app settings logic
- naming conventions

Those should be defined by the consumer root module.

## Notes

- Keep `app_settings` in the consumer root so the stack stays reusable.
- The stack can support both Java runtimes and container-based deployments depending on `site_config.application_stack`.

## Example

```hcl
module "app" {
  source = "../../stacks/app-stack"

  resource_group_name     = "rg-incidencias-dev-we"
  location                = "westeurope"
  app_service_plan_name   = "asp-incidencias-dev-we"
  sku_name                = "B1"
  linux_web_app_name      = "app-incidencias-dev-we-alex"
  virtual_network_subnet_id = module.network.app_integration_subnet_id

  site_config = {
    always_on                         = true
    http2_enabled                     = true
    health_check_path                 = "/actuator/health"
    health_check_eviction_time_in_min = 2
    vnet_route_all_enabled            = true
    application_stack = {
      java_server         = "JAVA"
      java_server_version = "SE"
      java_version        = "21"
    }
  }

  app_settings = {
    WEBSITES_PORT = "8080"
  }

  key_vault_id         = module.security.key_vault_id
  storage_account_id   = module.storage.storage_account_id
  container_registry_id = module.acr.container_registry_id

  tags = {
    environment = "dev"
    project     = "incidencias"
    managed_by  = "terraform"
  }
}
```
