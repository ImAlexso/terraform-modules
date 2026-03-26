# bootstrap-stack

This stack creates the minimum Azure resources required to host a remote Terraform state:

- Resource Group
- Storage Account
- Private blob container for tfstate

## Purpose

Use this stack only for the initial bootstrap of the Terraform backend.
It should be applied first with a local backend.

## Resources created

- Azure Resource Group
- Azure Storage Account
- Azure Storage Container

## Example usage

module "bootstrap_stack" {
source = "../../stacks/bootstrap-stack"

resource_group_name = "rg-cantera-bootstrap-we"
location = "westeurope"
storage_account_name = "stcanteratfstatewe01"
tfstate_container_name = "tfstate"

tags = {
environment = "dev"
project = "cantera"
managed_by = "terraform"
}
}
