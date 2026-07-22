# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability, please do not create a public GitHub issue.

Instead:

- Contact the repository owner directly.
- Provide sufficient information to reproduce the issue.
- Allow reasonable time for investigation before public disclosure.

---

## Secrets

Never commit:

- terraform.tfvars
- Certificates
- Private Keys
- Passwords
- Client Secrets
- Storage Account Keys

---

## Terraform State

Terraform state may contain sensitive information.

State files should always be stored in a secured remote backend.

---

## Azure Security

Recommended practices:

- Least Privilege RBAC
- Managed Identity
- Private Endpoints
- Azure Key Vault
- Azure Policy
- Defender for Cloud
- Diagnostic Logging