# Bootstrap

## Purpose

Creates the Terraform remote backend.

Resources deployed

- Resource Group
- Storage Account
- Blob Container

After deployment:

1. Configure backend.tf
2. Run terraform init -migrate-state

This layer should never contain platform resources.