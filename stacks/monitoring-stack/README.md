# monitoring-stack

Creates the monitoring foundation for the platform.

## Responsibility

This stack creates:

- Log Analytics workspace
- Application Insights connected to that workspace

## It does not create

- diagnostic settings for other resources
- alerts
- action groups
- dashboards

Those can be composed later if needed.

## Notes

- Application Insights is workspace-based.
- This stack is intentionally small and reusable.

## Example

```hcl
module "monitoring" {
  source = "../../stacks/monitoring-stack"

  resource_group_name         = "rg-incidencias-dev-we"
  location                    = "westeurope"
  log_analytics_workspace_name = "law-incidencias-dev-we"
  application_insights_name    = "appi-incidencias-dev-we"

  tags = {
    environment = "dev"
    project     = "incidencias"
    managed_by  = "terraform"
  }
}
```
