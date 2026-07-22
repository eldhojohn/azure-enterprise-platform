# Contributing

Thank you for your interest in contributing.

## Branch Strategy

- main
- develop
- feature/*

Example:

```
feature/bootstrap
feature/networking
feature/security
```

---

## Pull Requests

Before submitting a pull request:

- Run `terraform fmt`
- Run `terraform validate`
- Ensure documentation is updated
- Ensure modules are reusable

---

## Coding Standards

- Follow Terraform best practices.
- Keep modules small and reusable.
- Avoid hardcoded values.
- Use variables where appropriate.
- Document every module.

---

## Commit Messages

Examples

```
feat: add bootstrap module

fix: resolve firewall routing issue

docs: update architecture documentation
```