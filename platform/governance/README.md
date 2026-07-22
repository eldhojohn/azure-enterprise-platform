# Governance

## Purpose

This Terraform root configuration manages subscription-level governance for the Azure Enterprise Platform.

## Planned capabilities

- Azure Policy definitions
- Policy initiatives
- Policy assignments
- Role assignments
- Resource locks
- Required resource-provider registration

## Terraform state

State is stored in the shared Azure Storage backend using:

`platform/governance.tfstate`

## Deployment

```powershell
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
