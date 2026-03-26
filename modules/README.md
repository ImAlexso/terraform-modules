# terraform-modules-v2

This is a refactored Azure Terraform modules repository designed to be much more reusable than the original project-specific version.

## Core idea

Each module has one clear responsibility:

- create one base Azure resource, or
- create one generic cross-cutting resource such as a private endpoint, DNS link, or role assignment.

The repository intentionally avoids hard-coding a full platform architecture inside the modules.

## What changed compared with the original repo

- network was split into generic modules: `virtual-network`, `subnet`, `private-dns-zone`, and `private-dns-zone-link`
- SQL was split into `sql-server` and `sql-database`
- storage was split into `storage-account` and `storage-container`
- monitoring was split into `log-analytics-workspace` and `application-insights`
- App Service no longer creates RBAC assignments automatically
- Azure OpenAI was split into `cognitive-account-openai` and `cognitive-deployment`
- private connectivity is now handled by a generic `private-endpoint` module
- RBAC is now handled by a generic `role-assignment` module

## Important note

No Terraform module can be literally 100% reusable for every company and every Azure convention. What this repo does is move much closer to the right reusable pattern:

- small modules
- narrow responsibility
- composition from the root module
- minimal architecture assumptions inside each module

## Recommended composition pattern

A root module or environment stack should now compose these modules, for example:

1. `resource-group`
2. `virtual-network`
3. one or more `subnet`
4. one or more `private-dns-zone`
5. one or more `private-dns-zone-link`
6. base services such as `sql-server`, `storage-account`, `key-vault`, `container-registry`, `cognitive-account-openai`
7. optional add-ons such as `sql-database`, `storage-container`, `cognitive-deployment`
8. connectivity with `private-endpoint`
9. RBAC with `role-assignment`

That keeps the modules reusable and pushes project-specific architecture choices to the consuming layer.
