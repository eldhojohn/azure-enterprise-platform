# Azure Enterprise Platform

Enterprise-grade Azure platform built with Terraform following Microsoft Azure Landing Zone principles.

## Overview

This repository demonstrates how to design, deploy and manage a scalable Azure platform using Infrastructure as Code (IaC).

The project is built to reflect real-world enterprise environments including:

- Azure Landing Zones
- Hub & Spoke Networking
- Azure Firewall
- VPN Gateway
- Bastion
- Azure Monitor
- Log Analytics
- Key Vault
- Private Endpoints
- Azure Policy
- RBAC
- GitHub Actions
- Multi-environment deployments

---

## Repository Structure

```
azure-enterprise-platform
│
├── bootstrap/
├── platform/
│   ├── governance/
│   ├── connectivity/
│   ├── identity/
│   ├── management/
│   └── security/
│
├── landing-zones/
│   ├── dev/
│   ├── test/
│   └── prod/
│
├── applications/
│   └── ropes/
│
├── modules/
├── docs/
├── scripts/
└── .github/
```

---

## Technologies

- Terraform
- Microsoft Azure
- Azure CLI
- GitHub Actions
- PowerShell

---

## Objectives

- Deploy Azure infrastructure using Terraform
- Build reusable Terraform modules
- Implement Azure Landing Zone architecture
- Separate platform and application infrastructure
- Demonstrate enterprise DevOps practices

---

## Current Progress

- [ ] Bootstrap
- [ ] Governance
- [ ] Connectivity
- [ ] Identity
- [ ] Security
- [ ] Management
- [ ] Landing Zones
- [ ] Applications
- [ ] CI/CD

---

## License

MIT License