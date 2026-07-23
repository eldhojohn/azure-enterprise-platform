# Azure Role Assignment Module

Creates one Azure RBAC role assignment.

## Required inputs

- `scope`
- `principal_id`
- `role_definition_name`

Managed identities normally use:

```hcl
principal_type = "ServicePrincipal"
